#requires -version 4

<#
.SYNOPSIS
  A proof of concept script that mirrors Windows Subsystem for Linux (WSL) GUI app shortcuts to the Windows 10 Start Menu.

.DESCRIPTION
  Allows users who install GUI apps in WSL to find and launch them easily from the Windows 10 Start Menu.

.NOTES
  Author:   Hayden Barnes (github.com/sirredbeard)
#>

# Set up logging

Import-Module PSLogging
$sLogPath = 'C:\Windows\Temp'
$sLogName = 'wslstartmenu.log'
$sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName

# Functions

<

Function DoSomething {
  Param ()

  Begin {
    Write-LogInfo -LogPath $sLogFile -Message '<description of what is going on>...'
  }

  Process {
    Try {
      <code goes here>
    }

    Catch {
      Write-LogError -LogPath $sLogFile -Message $_.Exception -ExitGracefully
      Break
    }
  }

  End {
    If ($?) {
      Write-LogInfo -LogPath $sLogFile -Message 'Completed Successfully.'
      Write-LogInfo -LogPath $sLogFile -Message ' '
    }
  }
}

>

# Execution

Start-Log -LogPath $sLogPath -LogName $sLogName


# Collect .desktop files from WSL rootfs: /etc/share/applications/%.desktop, /users/%/.local/share/applications/%.desktop
# Dump them all into a single text file
# Parse them with a template
# Go back in for the corresponding icons
# Erase anything in CSIDL_PROGRAMS\WSL Desktop Apps\
# Create shortcuts in CSIDL_PROGRAMS\WSL Destop Apps\

DoSomething

Stop-Log -LogPath $sLogFile