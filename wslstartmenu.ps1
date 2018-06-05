#requires -version 4

<#
.SYNOPSIS
  A proof of concept script that mirrors Windows Subsystem for Linux (WSL) GUI app shortcuts to the Windows 10 Start Menu.

.DESCRIPTION
  Allows users who install GUI apps in WSL to find and launch them easily from the Windows 10 Start Menu.

.NOTES
  Author:   Hayden Barnes (github.com/sirredbeard)
#>

# Execution

# Collect .desktop files from WSL rootfs: /etc/share/applications/%.desktop, /users/%/.local/share/applications/%.desktop
# Dump them all into a single text file
# Parse them with a template
# Go back in for the corresponding icons
# Erase anything in CSIDL_PROGRAMS\WSL Desktop Apps\
# Create shortcuts in CSIDL_PROGRAMS\WSL Destop Apps\