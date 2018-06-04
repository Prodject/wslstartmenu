#!/bin/bash

  # PowerShell installed on WSL?
  
  if command -v powershell >/dev/null 2>&1 ; then
    echo "powershell found"
else
    echo "powershell not found"
    cd /tmp/
    bash <(wget -O - https://raw.githubusercontent.com/PowerShell/PowerShell/master/tools/install-powershell.sh)
 fi
  
  # An X server installed?
  
     # try to open X connection, check error code
     
     # if error, then
     
          # download VcXsrc
          
          # run VcXsrc
          
          # write and hide xlaunch.config in user's Documents folder
          
          # set display and opengl variables in .bashrc
          
          cd ~
          echo "export DISPLAY=:0" >> .bashrc
          echo "export LIBGL_ALWAYS_INDIRECT=1" >> .bashrc

# Check ~/.local/share/applications for .desktop files

cd ~
ls ~/.local/share/applications/*.desktop >> .appdatabase

# Check /usr/share/applications for .desktop files

cd ~
ls /usr/share/applications/*.desktop >> .appdatabase

# Refactor each .desktop file into a Windows .lnk file 

    # get list of all .desktop files
    
    # open and parse each .desktop file
    
    # Name= in desktop file -> Name.link
    
    # Exec=% in .desktop file -> c:\Windows\System32\bash.exe -c "%" in .lnk file.
    
    # extract the corresponding icon from /usr/share/icons/ and embed in .lnk file.
    
    # generate .lnk file using pwsh
    
# Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/

# Clean up

rm .appdatabase
