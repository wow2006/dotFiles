import subprocess, tempfile
from os.path import join
import neovim


@neovim.plugin
class CUDA(object):

    def __init__(self, nvim):
        self.vim = nvim
        self.tempFile = join(tempfile.gettempdir(), tempfile.gettempprefix() + "_CUDA")
        self.ptxFile  = join(tempfile.gettempdir(), tempfile.gettempprefix() + "_PTX.ptx")

    def runCommand(self, command):
        self.vim.out_write("{}\n".format(command))
        result = subprocess.run(command,
                                shell=True,
                                stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE)
        return result

    def writeToBuffer(self, fullFileName):
        self.vim.command('vsplit')




    def writeToQuickFix(self, errors, currentFile):
        with open(self.tempFile, 'w') as f:
            f.write("current file %s\n" % currentFile)
            f.write(errors)

        self.vim.command("cfile %s" % self.tempFile)
        self.vim.command("copen")

    @neovim.autocmd('BufWrite', pattern='*.cu',)
    def BuildCUDA(self):
        currentFile = self.vim.current.buffer.name
        if(not currentFile):
            return
        command = "nvcc -std=c++11 -O3 -Wno-deprecated-gpu-targets " + currentFile

        result = self.runCommand(command)
        if(result.returncode == 0):
            errors = "no errors"
        else:
            errors = result.stderr.decode("utf-8")

        self.writeToQuickFix(errors, currentFile)

    @neovim.autocmd('BufWrite', pattern='*.cu')
    def GeneratePtx(self):
        currentFile = self.vim.current.buffer.name
        if(not currentFile):
            return
        command = "nvcc --ptx --std=c++11 --generate-code {} -o {}".format(currentFile, self.ptxFile)

        result = runCommand(command)

        if(result.returncode != 0):
            return

        self.writeToQuickFix(errors, currentFile)
