import neovim
import time
from threading import Timer

class Habitica:
    def __init__(self):
        pass

class Promodo:
    import sched, time
    def __init__(self, fileName, buffer):
        with open("/home/ahussein/TODO.md", "r") as f:
            self.todoFile = f.read().split()
        self.buffer = buffer
        self.start    = 0
        self.stop     = 44
        self.running  = True

    def drawTODO(self, item):
        todoItem = "{}{}".format(item, " " * (45 - len(item)))
        for i in range(self.start, self.stop):
            self.buffer[0] = "%s[%s%s]" % (todoItem, "*"*i, " "*(43-i))
            time.sleep(0.01) # 25 * 60 = 34.09
            if(not self.running):
                self.start = i
                break

    def StartPromodo(self, index):
        self.running = True
        todoItem     = self.todoFile[index][:45]
        self.drawTODO(todoItem)

    def StopPromodo(self, index):
        pass
        #self.running = False

    def StartShortBreak(self, index):
        self.running = True
        BREAK = " BREAK"
        todoItem     = self.todoFile[index][:(45 - len(BREAK))] + BREAK
        self.drawTODO(todoItem)

    def StopShortBreak(self, index):
        self.running = False

@neovim.plugin
class TODOPlugin(object):

    def __init__(self, nvim):
        self.vim      = nvim
        self.habitica = Habitica()
        self.promodo  = None
        self.todo     = None

    def createTempBuffer(self):
        src = self.vim.current.window

        self.vim.command(":botright vnew %s" % "TODO")
        # make the new buffer 'temporary'
        self.vim.command(":setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted")
        # make ensure our buffer is uncluttered
        self.vim.command(":setlocal norelativenumber nolist nospell wrap")

        todo = self.vim.current.window

        todo.width = 49

        self.vim.command(":set wfw")

        # Remove binding
        keys = "aAcCsSiIoOrRxXpP"
        for key in keys:
            self.vim.command("map <buffer> %s <NOP>" % key)

        self.vim.command("nmap <buffer> <CR> :ToggleTODO<CR>")
        #self.vim.command(":augroup tempFile")
        #self.vim.command(":autocmd!")
        #self.vim.command(":augroup END")

        self.vim.current.window = src

        return todo

    @neovim.command("ToggleTODO")
    def toggleTODO(self):
        if(self.todo is None):
            self.todo = self.createTempBuffer()

        if(self.promodo is None):
            self.promodo = Promodo("", self.todo.buffer)
        currentLine = self.vim.eval('line(".")') - 1
        self.promodo.StartPromodo(currentLine)


    def StartPromodo(self):
        pass

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
