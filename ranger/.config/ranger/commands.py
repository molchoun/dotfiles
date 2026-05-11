import subprocess

from ranger.api.commands import Command


class fzf_select(Command):
    def execute(self):
        command = "fd . -tf -a -I | fzf"
        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )
        stdout, _ = fzf.communicate()

        if stdout:
            self.fm.select_file(stdout.strip())


class fzf_search_home(Command):
    def execute(self):
        command = "fd . ~/ -tf -a -I | fzf"
        fzf = self.fm.execute_command(
            command, universal_newlines=True, stdout=subprocess.PIPE
        )
        stdout, _ = fzf.communicate()

        if stdout:
            self.fm.select_file(stdout.strip())
