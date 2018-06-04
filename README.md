# wslstartmenu
A proof of concept script that mirrors Windows Subsystem for Linux (WSL) GUI app shortcuts to the Windows 10 Start Menu.

Allows users who install GUI apps in WSL to find and launch them easily from the Windows 10 Start Menu.

Concept
==============

* Sanity check
  - Running on supported WSL? (i.e. check uname and for /mnt/c/) If not, exit or warn.
  - PowerShell installed on WSL? [1] If not, download and install [binary from GitHub](https://github.com/PowerShell/PowerShell) using dpkg or zypper.
  - An X server installed? If not, download and install VcXsrc, install a default xlaunch.config, and set display and libgl variables in .bash.
* Check ~/.local/share/applications for .desktop files
* Check /usr/share/applications for .desktop files
* Refactor each [.desktop file](https://standards.freedesktop.org/desktop-entry-spec/latest/) into a Windows .lnk file
  - get list of all .desktop files
  - ignore duplicates
  - open and parse each .desktop file
  - Name= in desktop file -> Name.link
  - Exec=% in .desktop file -> c:\Windows\System32\bash.exe -c "%" in .lnk file.
  - extract the corresponding icon from /usr/share/icons/ and embed in .lnk file.
  - generate .lnk file  
* Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/


Notes
==============

[1] Yes, I know, PowerShell in the WSL. A big issue here is that .lnk files we are creating on Windows are binary-encoded and difficult to generate programatically. The simplest way to generate .lnk files seems to be [in PowerShell](http://powershellblogger.com/2016/01/create-shortcuts-lnk-or-url-files-with-powershell/). The script should start in bash but then do at least the link generation in dynamically generated PowerShell scripting.
