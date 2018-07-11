import neovim, tempfile
from os import chdir, curdir, remove
from os.path import dirname, exists, isdir, join, abspath
import subprocess


@neovim.plugin
class Main(object):
    def __init__(self, vim):
        self.vim = vim
        self.buildDir = ''
        self.tempFile = join(tempfile.gettempdir(),
                             tempfile.gettempprefix() + "_analysis")
        self.commands = {
            "clang": "clang-tidy -format-style=file -p {} -checks={} {}",
            "pvs": "pvs-studio-analyzer analyze",
            "pvs_ans": "plog-converter -a %s -t errorfile PVS-Studio.log",
            "oclint": lambda filename, args: "%s %s" % (args, filename),
            "cppcheck": lambda filename, args: "%s %s" % (args, filename),
        }

    def __del__(self):
        remove(self.tempFile)

    @neovim.command("SetBuild", range='', nargs='*')
    def setBuild(self, args, range):
        if (not range and not isdir(args[0])):
            self.vim.out_write("Please write build dir")
            return

        self.buildDir = abspath(args[0])
        self.vim.out_write("Set build dir to {}\n".format(self.buildDir))

    @neovim.command("AnalysisClang", range='', nargs='*')
    def analysisClang(self, args, range):
        currentFile = self.vim.current.buffer.name
        self.vim.out_write("current %s\n" % currentFile)
        if (not currentFile):
            return

        if (not ".cpp" in currentFile):
            return

        #command = self.commands["clang"] % (self.tempFile, '*', currentFile)
        #self.vim.out_write("command %s" % command)
        #result  = self.runCommand(command)
        #if(not result):
        #    return

        #errors = result.stdout.decode("utf-8")

        #self.writeToQuickFix(errors, currentFile)

    @neovim.command("AnalysisPVS", range='', nargs='*')
    def analysisPVS(self, args, range):
        if(not self.buildDir or not exists(self.buildDir)):
            if(exists('build/')):
                if(exists('Debug/')):
                    self.buildDir = "build/Debug/"
                elif(exists('Release/')):
                    self.buildDir = "build/Release/"
            self.vim.out_write("Please set Build dir\n")
            self.vim.out_write("Using :SetBuild \"build\"\n")
            return

        currentFile = self.vim.current.buffer.name
        if (not currentFile or not (".cpp" in currentFile)):
            return
        self.vim.out_write("current %s\n" % currentFile)

        command = self.commands["pvs"]

        chdir(self.buildDir)
        if(not exists('PVS-Studio.log')):
            self.runCommand(command)

        command = self.commands["pvs_ans"] % "GA:1,2,3"

        result = self.runCommand(command)

        if(not result):
            self.vim.out_write("Error with %s\n" % currentFile)
            return

        result = result.stdout.decode("utf-8").split('\n')

        errors = "\n".join([x for x in result if currentFile in x])
        
        self.writeToQuickFix(errors, '/tmp/pvs')

    @neovim.command("AnalysisOclint", range='', nargs='*')
    def analysisOclint(self):
        pass

    @neovim.command("AnalysisCppcheck", range='', nargs='*')
    def analysisCppcheck(self):
        pass

    def writeToQuickFix(self, message, tempFile):
        with open(tempFile, 'w') as f:
            f.write(message)
        self.vim.command("cfile %s" % tempFile)
        self.vim.command("copen")

    def runCommand(self, command):
        self.vim.out_write("{}\n".format(command))
        try:
            result = subprocess.run(
                command,
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE)
            if (result.returncode != 0):
                self.vim.err_write("ERROR at {}:\n{}\n{}".format(
                    result.args, result.stderr.decode("utf-8"),
                    result.stdout.decode("utf-8")))
                return None
            return result
        except subprocess.CalledProcessError as e:
            self.vim.err_write(e.output)
