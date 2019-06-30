# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class empty(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:empty <filename>

    A command to create <filename>.empty then delete <filename>
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filenames = [self.rest(1)]
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filenames = [f.path for f in self.fm.thistab.get_selection()]

        for target_filename in target_filenames:
            # Using bad=True in fm.notify allows you to print error messagess
            if not os.path.exists(target_filename):
                self.fm.notify("" + target_filename + " does not exist!", bad=True)
                return
            
            # This is a generic function to print text in ranger.
            self.fm.notify("Creating " + target_filename + ".empty")
            self.fm.execute_command(["touch", "" + target_filename + ".empty"])
            
            # This executes a function from ranger.core.acitons, a module with a
            # variety of subroutines that can help you construct commands.
            # Check out the source, or run "pydoc ranger.core.actions" for a list.
            self.fm.notify("Deleting " + target_filename)
            self.fm.execute_command(["rm", target_filename])
            #self.fm.delete(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()
