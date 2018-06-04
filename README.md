# wslstartmenu
A proof of concept that mirrors GUI Linux apps installed on WSL to the Windows 10 Start Menu.

Runs on Linux Subsystem for Windows (WSL).

Concept
==============

* Sanity check
  - Running on WSL?
  - PowerShell installed on WSL? If not, download and install [binary from GitHub](https://github.com/PowerShell/PowerShell) using dpkg or zypper.
* Check ~/.local/share/applications for .desktop files
* Check /usr/share/applications for .desktop files
* Refactor each [.desktop file](https://standards.freedesktop.org/desktop-entry-spec/latest/) into a Windows .lnk file
  - get list of all .desktop files
  - ignore duplicates
  - open and parse each .desktop file
  - Name= in desktop file -> Name.link
  - Exec=% in .desktop file -> c:\Windows\System32\bash.exe -c "%" in .lnk file.
  - extract the corresponding icon from /usr/share/icons/ and embed in .lnk file.
  - generate .lnk file  [1]
* Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/


Notes
==============

[1] The first major issue this idea encounters is that .lnk files are binary-encoded and difficult to generate programatically. The simplest way to generate .lnk files programmatically seems to be [in PowerShell](http://powershellblogger.com/2016/01/create-shortcuts-lnk-or-url-files-with-powershell/).

The script should run in bash but then do at least the link generation in dynamically generated PowerShell scripting.
