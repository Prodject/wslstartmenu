# wslstartmenu
A proof of concept script that mirrors GUI Linux apps installed on WSL to the Windows 10 Start Menu.

Runs on Linux Subsystem for Windows (WSL).

Script Outline

* Check ~/.local/share/applications for *.desktop files
* Check /usr/share/applications for *.desktop files
* Refactor each [*.desktop file](https://standards.freedesktop.org/desktop-entry-spec/latest/) into a Windows .lnk file
    #each Exec=% becomes bash.exe -c %
    #copy icon file if available
* Place .lnk in /c/mnt/Users/%USER/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/WSL GUI Applications/%DISTRO/
