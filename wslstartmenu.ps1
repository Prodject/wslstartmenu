#requires -version 4

<#
.SYNOPSIS
  A proof of concept script that mirrors Windows Subsystem for Linux (WSL) GUI app shortcuts to the Windows 10 Start Menu.

.DESCRIPTION
  Allows users who install GUI apps in WSL to find and launch them easily from the Windows 10 Start Menu.

.NOTES

  Only supports Ubuntu 18.04 at this time.

  My first foray into PowerShell. YMMV.

  Written using Visual Studio Code.

  Copyright (c) 2018 Hayden Barnes
  All rights reserved
  Licensed under the MIT license
  https://github.com/sirredbeard

#>

# Execution
# =========

# Preparation

    # Go ahead and rrase everything in CSIDL_PROGRAMS\WSL Desktop Apps\

    $StartMenuFolder = %CSIDL_COMMON_STARTMENU% + "\WSL Desktop Apps\*.lnk"
    Remove-Item $StartMenuFolder

# Assemble Data

   # Copy .desktop files from WSL rootfs:

    # First copy from the main location for .desktop files

      # %\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\usr\share\applications\*.desktop
    
    # Then copy from  user-installed locations for .desktop files

        # Get list of users from:
    
          # %\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\

        # Go into each one:

          # %\Local\Packages\CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc\LocalState\rootfs\home\$username\.local\share\applications\*.desktop
    
    # Copy the .desktop files to %TEMP%\WSLdesktopfiles\

    # WARNING: Do not create or modify any files in WSL from Windows. See https://blogs.msdn.microsoft.com/commandline/2016/11/17/do-not-change-linux-files-using-windows-apps-and-tools/

# Process Data

   # Go down the the desktop files in %TEMP%\WSLdesktopfiles\, opening each one in a loop:

    # Parse them with a PowerShell template

    # Extract application name ($LinuxAppName), exec ("$LinuxCommand"), path ($LinuxPath), and icon ($LinuxIconFile)

    # Create shortcut

    $WshShell = New-Object -comObject WScript.Shell # Invoke shortcut creation magic in PowerShell
    $WindowsShortcutLocation = %CSIDL_COMMON_STARTMENU% + "\WSL Desktop Apps\" + $AppName + ".lnk" # Put together the path and filename for our new Windows shortcut
    $Shortcut = $WshShell.CreateShortcut($WindowsShortcutLocation) # Save that to our shortcut
    $WindowsBashLocation = %SYSTEM32% + "\bash.exe" # Put together the path to bash.exe on Windows, which is what our shortcut is executing
    $Shortcut.TargetPath = $WindowsBashLocation # Save that to our shortcut
    $WindowsBashArguments = " -c " + "'cd " + $LinuxPath + " && " + $LinuxCommand # Pass the Linux exec line as an argument to bash following "-c" and cd'ing to the starting path
    $Shortcut.Arguments = $WindowsBashArguments  # Save that to our shortcut
    
    # Setting the path from the .desktop in the Windows shortcut may or may not be required, so this is saved until otherwise unneeded:
      # convert $LinuxExecPath to $WindowsExecPath
      # $Shortcut.WorkingDirectory = $WindowsExecPath
    
    $Shortcut.Save() # Save our shortcut

  # Do again with next .desktop file

# Cleanup

Remove-Item %TEMP%\WSLdesktopfiles