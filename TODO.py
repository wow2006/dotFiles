import neovim
import time, tqdm
from threading import Timer

class Habitica:
    def __init__(self):
        pass

class Promodo:
    import sched
    import time
    def __init__(self):
        pass

    def StartPromodo(self, index):
        pass

    def StopPromodo(self, index):
        pass

    def StartShortBreak(self, index):
        pass

    def StopShortBreak(self, index):
        pass

@neovim.plugin
class TODOPlugin(object):

    def __init__(self, nvim):
        self.vim      = nvim
        self.habitica = Habitica()
        self.promodo  = Promodo()

    @neovim.command("ToggleTODO")
    def toggleTODO(self):
        src = self.vim.current.window

        self.vim.command(":botright vnew %s" % "TODO")
        # make the new buffer 'temporary'
        self.vim.command(":setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted")
        # make ensure our buffer is uncluttered
        self.vim.command(":setlocal nonumber norelativenumber nolist nospell")

        todo = self.vim.current.window

        todo.width = 50

        self.vim.command(":set wfw")

        self.vim.current.window = src

        for i in range(48):
            time.sleep(0.1)
            todo.buffer[0] = "[%s%s]" % ("*"*i, " "*(47-i))


    def StartPromodo(self):
        if(self.vim.current.buffer.name != "TODO"):
            return
        currentIdex = self.vim.current.line


    def StopPromodo(self, index):
        pass

    def StartShortBreak(self, index):
        pass

    def StopShortBreak(self, index):
        pass

    def getFromHabitica(self):
        pass

    def updateHabitica(self):
        pass
