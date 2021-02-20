param (
    [switch] $client5,
    [switch] $client2,
    [switch] $help,
    [string] $output = ""
)

# Setup

$githubBaseUrl = "https://raw.githubusercontent.com/n4y0n/wifi-swapper/master"
$coreVersion = "0.0.0"

# Functions

function Download-Self {
    Invoke-RestMethod -OutFile $scriptPath -Uri "${githubBaseUrl}/swapper.ps1"
}

function List-Commands {
    Write-Line "
Available commands:

-client5
-client2
-help

"
}

function Write-Line($str) {
    if ($env:SWAPPER_QUIET -ne "true") {
        Write-Host $str
    }
}

# Intro

Write-Line @'
__          ___ ______ _    _____                                    
\ \        / (_)  ____(_)  / ____|                                   
 \ \  /\  / / _| |__   _  | (_____      ____ _ _ __  _ __   ___ _ __ 
  \ \/  \/ / | |  __| | |  \___ \ \ /\ / / _` | '_ \| '_ \ / _ \ '__|
   \  /\  /  | | |    | |  ____) \ V  V / (_| | |_) | |_) |  __/ |   
    \/  \/   |_|_|    |_| |_____/ \_/\_/ \__,_| .__/| .__/ \___|_|   
                                              | |   | |              
                                              |_|   |_|               
'@

Write-Line "
author: @n4y0n on Github
license: MIT
page: https://github.com/n4y0n/wifi-swapper.git
===================================================
"

if ($env:SWAPPER_QUIET -ne "true") {
    Write-Line "swapper.ps1 version ${coreVersion}"
}

Write-Line ""

# Commands

if ($client5) {
    # Invoke-Expression "& `"$scriptsDir\run.ps1`" -install -outputDir `"$output`" -coreVersion $coreVersion -webVersion $webVersion"
    Write-Line "Swap 5Ghz to 2.4Ghz client"
    Write-Line "Disablig 5Ghz hotspot"

    Write-Line "Enabling 5Ghz client"

    Write-Line "Swap 2.4Ghz to 5Ghz hotspot"
    Write-Line "Disabling 2.4Ghz client"

    Write-Line "Enabling 2.4Ghz hotspot"
}
elseif ($client2) {
    # Invoke-Expression "& `"$scriptsDir\run.ps1`" -update -outputDir `"$output`" -coreVersion $coreVersion -webVersion $webVersion"
    Write-Line "Swap 2.4Ghz to 5Ghz client"
    Write-Line "Disablig 2.4Ghz hotspot"

    Write-Line "Enabling 2.4Ghz client"

    Write-Line "Swap 5Ghz to 2.4Ghz hotspot"
    Write-Line "Disabling 5Ghz client"

    Write-Line "Enabling 5Ghz hotspot"
}
elseif ($help) {
    List-Commands
}
else {
    Write-Line "No command found."
    Write-Line ""
    List-Commands
}
