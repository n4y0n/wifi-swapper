param (
    [switch] $client5,
    [switch] $client2,
    [switch] $interfaces,
    [switch] $status,
    [switch] $noheadless,
    [switch] $help,
    [string] $output = ""
)

# Setup
$routerIP = "10.0.0.1"
$routerUser = "root"
$routerPassword = "L34vemeal0"

# CHANGE ME
# Find interface names using switcher.ps1 -interfaces
$5ghzClientInterfaceName = "wifinet3"
$24ghzClientInterfaceName = "wifinet2"
$5ghzAPInterfaceName = "default_radio0"
$24ghzAPInterfaceName = "wifinet4"

$coreVersion = "1.0.2"
$githubBaseUrl = "https://raw.githubusercontent.com/n4y0n/wifi-swapper/master"

$plink = ".\plink.exe"
$connection = "$plink -ssh $routerUser@$routerIP -pw $routerPassword -no-antispoof"

# Functions

function Invoke-RemoteCommand($str) {
    $command = "$connection $str"
    Invoke-Expression $command
}

function Read-WifiStatus($obj) {
    $obj | ForEach-Object { "Section: " + $_.section + "`n`tInterface: " + $_.ifname + "`n`tMode: " + $_.config.mode + "`n`tSSID: " + $_.config.ssid }
    Write-Line
}

function Read-WifiDevices {
    Invoke-RemoteCommand "uci show wireless" | Where-Object { $_.Contains("ssid") } | ForEach-Object { "Interface: " + $_.replace("wireless.", "").replace(".ssid=", " -> ") }
}

function Toggle-WifiInterface($ifname) {
    $device = Invoke-RemoteCommand "`"uci get wireless.$ifname`"" 2>$null

    if ($device -ne "wifi-iface") {
        Write-Line "No Interface $ifname found"
        exit
    }

    $disabled = Invoke-RemoteCommand "`"uci get wireless.$ifname.disabled`"" 2>$null
    $name = Invoke-RemoteCommand "`"uci get wireless.$ifname.ssid`"" 2>$null

    if ($disabled -eq "1") {
        Enable-WifiInterface $ifname
        Write-Line "Enabled $name."
    }
    else {
        Disable-WifiInterface $ifname    
        Write-Line "Disabled $name."
    }
    
    Commit-Changes
    Reload-Settings
}

function Disable-WifiInterface($ifname) {
    $device = Invoke-RemoteCommand "`"uci get wireless.$ifname`"" 2>$null

    if ($device -ne "wifi-iface") {
        Write-Line "No Interface $ifname found"
        exit
    }

    $disabled = Invoke-RemoteCommand "`"uci get wireless.$ifname.disabled`"" 2>$null
    if ($disabled -ne "1") {
        Invoke-RemoteCommand "`"uci set wireless.$ifname.disabled='1'`"" 2>$null
    }
}

function Enable-WifiInterface($ifname) {
    $device = Invoke-RemoteCommand "`"uci get wireless.$ifname`"" 2>$null

    if ($device -ne "wifi-iface") {
        Write-Line "No Interface $ifname found"
        exit
    }

    $disabled = Invoke-RemoteCommand "`"uci get wireless.$ifname.disabled`"" 2>$null
    if ($disabled -eq "1") {
        Invoke-RemoteCommand "`"uci set wireless.$ifname.disabled='0'`"" 2>$null
    }
}

function Commit-Changes {
    Invoke-RemoteCommand "`"uci commit`"" 2>$null
}

function Reload-Settings {
    Invoke-RemoteCommand "`"wifi`"" 2>$null
}

function Download-Self {
    Invoke-RestMethod -OutFile "./switcher.ps1" -Uri "${githubBaseUrl}/switcher.ps1"
}

function Client2 {
    Write-Line "Enabling 2.4Ghz client"
    Enable-WifiInterface $24ghzClientInterfaceName
    Write-Line "Disablig 2.4Ghz AP"
    Disable-WifiInterface $24ghzAPInterfaceName

    Write-Line "Disablig 5Ghz client"
    Disable-WifiInterface $5ghzClientInterfaceName
    Write-Line "Enabling 5Ghz hotspot"
    Enable-WifiInterface $5ghzAPInterfaceName

    Commit-Changes
    Reload-Settings
}

function Client5 {
    Write-Line "Enabling 2.4Ghz hotspot"
    Enable-WifiInterface $24ghzAPInterfaceName
    Write-Line "Disabling 2.4Ghz client"
    Disable-WifiInterface $24ghzClientInterfaceName

    Write-Line "Enabling 5Ghz client"
    Enable-WifiInterface $5ghzClientInterfaceName
    Write-Line "Disablig 5Ghz hotspot"
    Disable-WifiInterface $5ghzAPInterfaceName

    Commit-Changes
    Reload-Settings
}

function List-Commands {
    Write-Line "
Available commands:

-client5
-client2
-interfaces
-status
-noheadless
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
    Client5
}
elseif ($client2) {
    Client2
}
elseif ($interfaces) {
    Read-WifiDevices
}
elseif ($status) {
    $jsonStatus = (Invoke-RemoteCommand "wifi status" | ConvertFrom-Json)
    $Iradio0 = $jsonStatus.radio0.interfaces
    $Iradio1 = $jsonStatus.radio1.interfaces

    Read-WifiStatus $Iradio0
    Read-WifiStatus $Iradio1
}
elseif ($help) {
    List-Commands
}
elseif ($noheadless) {
    Write-Line "==================================================="
    Write-Line

    Write-Line "Options: "
    Write-Line "1 : 5Ghz client -> 2.4Ghz hotspot"
    Write-Line "2 : 2.4Ghz client -> 5Ghz hotspot"

    
    $counter = 0
    while (!$Host.UI.RawUI.KeyAvailable -and ($counter++ -lt 1000)) {
        $key = $Host.UI.RawUI.ReadKey()
        if ($key.Character -eq '1') {
            Write-Line
            Client5
        } elseif ($key.Character -eq '2') {
            Write-Line
            Client2
        }

        Write-Line "Done!"
        Write-Line "Press any key to exit..."
        [Threading.Thread]::Sleep( 1000 )
    }

}
else {
    Write-Line "No command from command line found."
    Write-Line ""
    List-Commands
}