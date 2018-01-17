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
        self.ans_command = "plog-converter -a GA:1,2,3 -t errorfile PVS-Studio.log"

        self.buildDir = ''

    @neovim.command("PVMsetBuild", range='', nargs='*')
    def setBuild(self, args, range):
        self.buildDir = args[0]
        self.vim.current.line = self.buildDir
        

    @neovim.command('PVManalysis')
    def analysisPVM(self):
        chdir(self.buildDir)

        self.vim.current.line = "{} - {}".format(self.buildDir, self.pvs_command)
        result = subprocess.run(self.pvs_command, shell=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)

        self.readPVM()


    def readPVM(self):
        result = subprocess.run(self.ans_command,
                                shell=True, check=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        self.vim.out_write(abspath(curdir) + "\n")

        result = result.stdout.decode("utf-8").split('\n')

        errors = [x for x in result if self.vim.current.buffer.name in x]
        tFile = tempfile.mktemp()

        with open(tFile, 'w') as f:
            f.write("current file %s\n" % self.vim.current.buffer.name)
            f.write('\n'.join(errors))

        self.vim.command("cfile %s" % tFile)
        self.vim.command("copen")

