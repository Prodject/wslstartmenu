#requires -version 4

<#
.SYNOPSIS
  A PowerShell script that allows users who install GUI apps in Ubuntu 18.04 on WSL to find and launch those apps easily from the Windows 10 Start Menu.

.DESCRIPTION

  Extracts .desktop files from Ubuntu 18.04 on WSL and translates them into easily-launchable Start Menu shortcuts using PowerShell.

  Script runs destructively one-way from Ubuntu to a folder in Windows 10 Start Menu.

.NOTES

  Only supports Ubuntu 18.04 at this time.

  My first foray into PowerShell. YMMV.

  Written using Visual Studio Code.
  Copyright (c) 2018 Hayden Barnes
  All rights reserved
  Licensed under the MIT license
  https://github.com/sirredbeard/wslstartmenu
  https://github.com/sirredbeard/Awesome-WSL

#>

# Execution
# =========

# Preparation
    
    # Is this a compatible verison of Windows 10?

    # Is WSL/bash installed?

    # Is an X server (Xming, X/Cygwin, or VcXsrv) installed?

      # If no:
      
        # Download and install VcXsrv from SourceForge.net
        # Create and hide default xlaunch.config in %CSIDL_DEFAULT_MYDOCUMENTS%
        # Generate and run a shortcut that executes %SYSTEM32%\bash.exe -c "echo "export DISPLAY=:0" >> .bashrc && echo "export LIBGL_ALWAYS_INDIRECT=1" >> .bashrc"

    # Go ahead and erase everything in %CSIDL_PROGRAMS%\WSL Desktop Apps\, this is a one-way destructive script designed to be automated.

    $StartMenuFolder = %CSIDL_COMMON_STARTMENU% + "\WSL Desktop Apps\*.lnk"
    Remove-Item $StartMenuFolder

# Assemble Data

   # Copy .desktop files from WSL rootfs:

    # First copy from the main location for .desktop files

      # %CSIDL_DEFAULT_LOCAL_APPDATA\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\share\applications\*.desktop
    
    # Then copy from  user-installed locations for .desktop files

        # Get list of users from:
    
          # %CSIDL_DEFAULT_LOCAL_APPDATA\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\

        # Go into each one:

          # %CSIDL_DEFAULT_LOCAL_APPDATA\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\$username\.local\share\applications\*.desktop
    
    # Copy the .desktop files to %TEMP%\WSLdesktopfiles\

    # WARNING: Do not create or modify any files in WSL from Windows. See https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/

# Process Data

   # Go down the the desktop files in %TEMP%\WSLdesktopfiles\, opening each one in a loop:

    # Parse them with a PowerShell template

    # Extract application name ($LinuxAppName), exec ("$LinuxCommand"), path ($LinuxPath), and icon ($LinuxIconFile) from .desktop file

    # Create shortcut

    $WshShell = New-Object -comObject WScript.Shell # Invoke shortcut creation magic in PowerShell
    $WindowsShortcutLocation = %CSIDL_COMMON_STARTMENU% + "\WSL Desktop Apps\" + $AppName + ".lnk" # Put together the path and filename for our new Windows shortcut
    $Shortcut = $WshShell.CreateShortcut($WindowsShortcutLocation) # Save that to our shortcut
    $WindowsBashLocation = %SYSTEM32% + "\bash.exe" # Put together the path to bash.exe on Windows, which is what our shortcut is executing
    $Shortcut.TargetPath = $WindowsBashLocation # Save that to our shortcut
    $WindowsBashArguments = " -c " + "'cd " + $LinuxPath + " && " + $LinuxCommand # Pass the Linux exec line as an argument to bash following "-c" and cd'ing to the starting path
    $Shortcut.Arguments = $WindowsBashArguments  # Save that to our shortcut

    # What to do with Icon= a/k/a $LinuxIconFile?

      # Bringing the icons over and embedding would be a really nice touch but they are a big undertaking.
      # They may or may not have a path to the file in Icon=, they could be located in $HOME/.icons, $XDG_DATA_DIRS/icons, and/or /usr/share/pixmaps. 
      # Different themes also apply different icons in gnome and KDE, which the users may be expecting to see, so the script will have go read the theme set in gnome and KDE and then rely on those icon sets. I don't know what to do if it sees both, perhaps we should just specify exclusive support for icons set in gnome.
      # Even once you located the icons and the ones the users will want applied if they change icons in gnome-tweak-tools, they are in .xpm and .png.
      # The two ways I have thought of to address this are to: embed some C# to fix this or dynamically create and run a bash script that uses imagemagick on WSL to do the .png to .ico conversion.
        # **Warning: ImageMagick must write the new .ico to /mnt/c/Windows/Temp/WSLdesktopfiles/icons/, not inside the WSL from Windows
      # In the interim, just use a default Windows application .ico for the program.

    # Setting the Path= from the .desktop in the Windows shortcut may or may not be required, so this is saved until otherwise unneeded:
    
      # convert $LinuxExecPath to $WindowsExecPath
      # $Shortcut.WorkingDirectory = $WindowsExecPath
    
    $Shortcut.Save() # Save our shortcut

  # Do again with next .desktop file until done.

# Cleanup

Remove-Item %TEMP%\WSLdesktopfiles