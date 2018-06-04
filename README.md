# wslstartmenu
A proof of concept script that mirrors GUI Linux apps installed on WSL to the Windows 10 Start Menu.

Runs on Linux Subsystem for Windows (WSL).

Concept
==============
* Check ~/.local/share/applications for .desktop files
* Check usr/share/applications for .desktop files
* Refactor each [.desktop file](https://standards.freedesktop.org/desktop-entry-spec/latest/) into a Windows .lnk file
   - # get list of all .desktop files
   - # open and parse each one
   - # each Exec=% becomes bash.exe -c %
   - # generate .link file (look for another tool to help with this, apparently .link is a binary format?)
   - # include icon if available
* Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/
