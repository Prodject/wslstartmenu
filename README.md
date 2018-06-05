# wslstartmenu
A proof of concept script that mirrors Windows Subsystem for Linux (WSL) GUI app shortcuts to the Windows 10 Start Menu.

Allows users who install GUI apps in WSL to find and launch them easily from the Windows 10 Start Menu.

Notes
------

Bash to PowerShell:

This originally began as a bash script that would be run from WSL. However Windows shortcut links are binaries and difficult to create programatically. They are not as easy as parsing strings like the .desktop files. PowerShell can be used to generate shortcut links though. I found myself in a situation where I was doing most of the heavy lifting in bash on WSL and then writing and generating a dynamic PowerShell script. This also required buiilding PowerShell from source because most distros do not ship PowerShell and the PowerShell binary releases don't support the new Ubuntu 18.04. I realized it made more sense to run the whole thing from the Windows side, particularly if I wanted to help users get an X server installed if they don't have one.

PowerShell:

So now I have to go learn PowerShell.
