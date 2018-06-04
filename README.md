# wslstartmenu
A proof of concept that mirrors GUI Linux apps installed on WSL to the Windows 10 Start Menu.

Runs on Linux Subsystem for Windows (WSL).

Concept
==============

* Check ~/.local/share/applications for .desktop files
* Check /usr/share/applications for .desktop files
* Refactor each [.desktop file](https://standards.freedesktop.org/desktop-entry-spec/latest/) into a Windows .lnk file
  - #get list of all .desktop files
  - #ignore duplicates
  - #open and parse each .desktop file
  - #each Exec=% becomes c:\Windows\System32\bash.exe -c "%"
  - #extract corresponding icon from /usr/share/icons/ and embed
  - #generate .link file
* Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/
