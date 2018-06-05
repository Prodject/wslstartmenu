# wslstartmenu
A PowerShell script that allows users who install GUI apps in Ubuntu 18.04 on WSL to find and launch those apps easily from the Windows 10 Start Menu.

Extracts .desktop files from Ubuntu 18.04 on WSL and translates them into easily-launchable Start Menu shortcuts using PowerShell.

Script runs destructively one-way from Ubuntu to a folder in Windows 10 Start Menu.

Release Notes
--------

Only supports Ubuntu 18.04 at this time.

My first foray into PowerShell. YMMV.
  
Written using Visual Studio Code.
Copyright (c) 2018 Hayden Barnes
All rights reserved
Licensed under the MIT license
https://github.com/sirredbeard/wslstartmenu
https://github.com/sirredbeard/Awesome-WSL

Project History
------

This originally began as a bash script that would be run from WSL. However Windows shortcut links are binaries and difficult to create programatically. They are not as easy as parsing strings like the .desktop files. PowerShell can be used to generate shortcut links though. I found myself in a situation where I was doing most of the heavy lifting in bash on WSL and then writing and generating a dynamic PowerShell script to create the .lnk files. This also required buiilding PowerShell from source because most distros do not ship PowerShell (none currently in the Microsoft Store) and the PowerShell binary releases don't support the new Ubuntu 18.04. I realized it made more sense to run the whole thing from the Windows side, particularly if I wanted to help users get an X server installed if they don't have one. I am using this as an experiment to get to learn PowerShell too.
