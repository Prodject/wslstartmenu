#!/bin/bash

#Sanity check 
  # Running on supported WSL? (i.e. check uname and for /mnt/c/) If not, exit or warn.
  # PowerShell installed on WSL? [1] If not, download and install binary from GitHub using dpkg or zypper.
  # An X server installed? If not, download and install VcXsrc, install a default xlaunch.config, and set display and libgl variables in .bash.

# Check ~/.local/share/applications for .desktop files
# Check /usr/share/applications for .desktop files
# Refactor each .desktop file into a Windows .lnk file 
    # get list of all .desktop files
    # ignore duplicates
    # open and parse each .desktop file
    # Name= in desktop file -> Name.link
    # Exec=% in .desktop file -> c:\Windows\System32\bash.exe -c "%" in .lnk file.
    # extract the corresponding icon from /usr/share/icons/ and embed in .lnk file.
    #generate .lnk file
    
#Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/
