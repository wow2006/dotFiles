from os import chdir, remove
from os.path import exists, isdir, abspath, join, dirname, basename, splitext
import subprocess
import json
import neovim


@neovim.plugin
class Main(object):
    def __init__(self, vim):
        self.vim = vim
        self.build_dir = ''

        config_file = join(dirname(abspath(__file__)), 'static.json')
        with open(config_file, 'r') as file_handler:
            self.commands = json.loads(file_handler.read())

    def __del__(self):
        for key in self.commands:
            temp_file = self.commands[key].get('tempFile')
            if temp_file:
                remove(temp_file)

    @neovim.command("SetBuild", range='', nargs='*')
    def set_build(self, args, range):
        if (not range and not isdir(args[0])):
            self.vim.out_write("Please write build dir")
            return

        self.build_dir = abspath(args[0])
        self.vim.out_write("Set build dir to {}\n".format(self.build_dir))

    @neovim.command("AnalysisClang", range='', nargs='*')
    def analysisClang(self, args, range):
        if not self.check_build_dir():
            return

        current_file = self.vim.current.buffer.name

        command = self.commands["clang-tidy"]

        if command["needBuild"]:
            chdir(self.build_dir)

        result = self.runCommand(command["command"][0] % (command["tempFile"],
                                                          '*', current_file))

        if not result:
            self.vim.out_write("Error with %s\n" % current_file)
            return

        result = result.stdout.decode("utf-8").split('\n')

        errors = "\n".join(
            [x for x in result if splitext(basename(current_file))[0] in x])

        self.writeToQuickFix(errors, command["tempFile"])

    @neovim.command("AnalysisPVS", range='', nargs='*')
    def analysis_pvs(self, args, range):
        if not self.check_build_dir():
            return

        current_file = self.vim.current.buffer.name
        if not current_file or not (".cpp" in current_file):
            return

        self.vim.out_write("current %s\n" % current_file)

        pvs_values = self.commands["pvs"]
        command = pvs_values["command"][0]

        if command["needBuild"]:
            chdir(self.build_dir)

        if not exists('PVS-Studio.log'):
            self.runCommand(command)

        command = pvs_values["command"][1] % "GA:1,2,3"

        result = self.runCommand(command)

        if not result:
            self.vim.out_write("Error with %s\n" % current_file)
            return

        result = result.stdout.decode("utf-8").split('\n')

        errors = "\n".join([x for x in result if current_file in x])

        self.writeToQuickFix(errors, pvs_values["tempFile"])

    @neovim.command("AnalysisOclint", range='', nargs='*')
    def analysis_oclint(self, arg, range):
        pass

    @neovim.command("AnalysisCppcheck", range='', nargs='*')
    def analysis_cpp_check(self, arg, range):
        if not self.check_build_dir():
            return

        current_file = self.vim.current.buffer.name

        command = self.commands["cppcheck"]

        if command["needBuild"]:
            chdir(self.build_dir)

        result = self.runCommand(command["command"][0] % current_file)

        if not result:
            self.vim.out_write("Error with %s\n" % current_file)
            return

        temp_buffer = result.stderr.decode("utf-8").split('\n')

        result = []
        for line in temp_buffer:
            if current_file in line:
                temp = line.split('[')[1].split(']')
                file_name_in_cppcheck_format = temp[0]
                message = temp[1][2:]
                result.append(file_name_in_cppcheck_format + ":0: " + message)

        errors = "\n".join(result)

        self.writeToQuickFix(errors, command["tempFile"])

    def writeToQuickFix(self, message, tempFile):
        with open(tempFile, 'w') as file_handler:
            file_handler.write(message)
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
            if result.returncode != 0:
                self.vim.err_write("ERROR at {}:\n{}\n{}".format(
                    result.args, result.stderr.decode("utf-8"),
                    result.stdout.decode("utf-8")))
                return None
            return result
        except subprocess.CalledProcessError as expt:
            self.vim.err_write(expt.output)

    def check_build_dir(self):
        if (not self.build_dir or not exists(self.build_dir)):
            if exists('build/'):
                if exists('build/compile_commands.json'):
                    self.build_dir = 'build/'
                    return True
                elif exists('Debug/'):
                    self.build_dir = "build/Debug/"
                    return True
                elif exists('Release/'):
                    self.build_dir = "build/Release/"
                    return True

            self.vim.out_write("Please set Build dir\n")
            self.vim.out_write("Using :SetBuild \"build\"\n")
            return False
        else:
            return True
