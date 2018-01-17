import neovim
import subprocess
import sys
import tempfile
from os import chdir, curdir
from os.path import dirname, exists, isdir, join, abspath



@neovim.plugin
class PVM(object):
    def __init__(self, vim) -> None:
        self.vim = vim
        self.pvs_command = "pvs-studio-analyzer analyze"
        self.ans_command = "plog-converter -a %s -t errorfile PVS-Studio.log"

        self.buildDir = ''

    @neovim.command("PVMsetBuild", range='', nargs='*')
    def setBuild(self, args, range):
        if(not range and not isdir(args[0])):
            self.vim.out_write("Please write build dir")
            return

        self.buildDir = abspath(args[0])
        self.vim.out_write("Set build dir to {}".format(self.buildDir))

    @neovim.command('PVManalysis', range='', nargs='*')
    def analysisPVM(self, args, nargs='*'):
        if(not args):
            self.readPVM()
        else:
            self.readPVM(args[0])

    def readPVM(self, analysisFilter="GA:1,2,3"):
        chdir(self.buildDir)

        self.vim.out_write("{} - {}\n".format(self.buildDir, self.pvs_command))
        result = subprocess.run(self.pvs_command, shell=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        if(result.returncode != 0):
            self.vim.err_write("ERROR at {}:\n{}\n{}".format(result.args,
                               result.stderr.decode("utf-8"),
                               result.stdout.decode("utf-8")))
            return

        self.vim.out_write("{}\n".format(self.ans_command))
        result = subprocess.run(self.ans_command % analysisFilter,
                                shell=True, check=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        if(result.returncode != 0):
            self.vim.err_write("ERROR at {}:\n{}\n{}".format(result.args[0],
                               result.stderr.decode("utf-8"),
                               result.stdout.decode("utf-8")))
            return

        result = result.stdout.decode("utf-8").split('\n')

        errors = [x for x in result if self.vim.current.buffer.name in x]
        tFile = tempfile.mktemp()

        with open(tFile, 'w') as f:
            f.write("current file %s\n" % self.vim.current.buffer.name)
            f.write('\n'.join(errors))

        self.vim.command("cfile %s" % tFile)
        self.vim.command("copen")

