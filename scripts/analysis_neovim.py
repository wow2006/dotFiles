import neovim
import subprocess
import sys
import tempfile
import weakref
from os import chdir, curdir, remove
from os.path import dirname, exists, isdir, join, abspath



@neovim.plugin
class Analysis(object):
    def __init__(self, vim):
        self.vim = vim
        self.pvs_command    = "pvs-studio-analyzer analyze"
        self.ans_cmmmand    = "plog-converter -a %s -t errorfile PVS-Studio.log"
        self.tidy_command   = 'clang-tidy -format-style=file -p {} -checks={} {}'
        self.oclint_command = 'oclint -p {} {}'
        self.tempFile = join(tempfile.gettempdir(), tempfile.gettempprefix() + "_analysis")
        self.buildDir = ''

    def __del__(self):
        remove(self.tempFile)

    @neovim.command("SetBuild", range='', nargs='*')
    def setBuild(self, args, range):
        if(not range and not isdir(args[0])):
            self.vim.out_write("Please write build dir")
            return

        self.buildDir = abspath(args[0])
        self.vim.out_write("Set build dir to {}\n".format(self.buildDir))

    @neovim.command('Analysis', range='', nargs='*')
    def analysisPVM(self, args, nargs='*'):
        self.vim.out_write("args {}\n".format(args))
        if(not args):
            self.readPVM()
        else:
            if(any(x in ["GA", "OP"] for x in args)):
                self.readPVM(args[0])
            else:
                self.readTidy(args[0])

    @neovim.command('Oclint')
    def oclint(self):
        self.readOclint()

    def runCommand(self, command):
        self.vim.out_write("{}\n".format(command))
        try:
            result = subprocess.run(command,
                                    shell=True, check=True,
                                    stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
            if(result.returncode != 0):
                self.vim.err_write("ERROR at {}:\n{}\n{}".format(result.args,
                                   result.stderr.decode("utf-8"),
                                   result.stdout.decode("utf-8")))
                return None
            return result
        except subprocess.CalledProcessError as e:
            self.vim.err_write(e.output)

    def writeToQuickFix(self, errors, currentFile):
        with open(self.tempFile, 'w') as f:
            f.write("current file %s\n" % currentFile)
            f.write(errors)

        self.vim.command("cfile %s" % self.tempFile)
        self.vim.command("copen")


    def readPVM(self, analysisFilter="GA:1,2,3"):
        chdir(self.buildDir)
        currentFile = self.vim.current.buffer.name
        if(not currentFile):
            return
        command = self.pvs_command

        self.runCommand(command)

        command = self.ans_cmmmand % analysisFilter
        result = self.runCommand(command)
        if(not result):
            return

        result = result.stdout.decode("utf-8").split('\n')

        errors = "\n".join([x for x in result if currentFile in x])

        self.writeToQuickFix(errors, currentFile)


    def readTidy(self, analysisFilter="readability-*"):
        currentFile = self.vim.current.buffer.name
        if(not currentFile):
            return

        command     = self.tidy_command.format(self.buildDir,
                                               analysisFilter,
                                               currentFile)

        result = self.runCommand(command)
        if(not result):
            return

        errors = result.stdout.decode("utf-8")

        self.writeToQuickFix(errors, currentFile)

    def readOclint(self):
        currentFile = self.vim.current.buffer.name
        if(not currentFile):
            return

        command = self.oclint_command.format(self.buildDir, currentFile)

        result = self.runCommand(command)
        if(not result):
            return

        errors = result.stdout.decode("utf-8")

        self.writeToQuickFix(errors, currentFile)

