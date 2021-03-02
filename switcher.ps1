#region Setup Windows Forms
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$form = New-Object system.Windows.Forms.Form
$form.ClientSize = New-Object System.Drawing.Point(966, 216)
$form.text = "WiFi Swapper."
$form.TopMost = $false

$lip = New-Object system.Windows.Forms.Label
$lip.text = "IP:"
$lip.AutoSize = $true
$lip.width = 25
$lip.height = 10
$lip.location = New-Object System.Drawing.Point(30, 27)
$lip.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$lc5 = New-Object system.Windows.Forms.Label
$lc5.text = "Client 5Ghz:"
$lc5.AutoSize = $true
$lc5.width = 25
$lc5.height = 10
$lc5.location = New-Object System.Drawing.Point(324, 27)
$lc5.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$tip = New-Object system.Windows.Forms.TextBox
$tip.multiline = $false
$tip.width = 199
$tip.height = 20
$tip.location = New-Object System.Drawing.Point(100, 23)
$tip.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$tc5 = New-Object system.Windows.Forms.TextBox
$tc5.multiline = $false
$tc5.width = 186
$tc5.height = 20
$tc5.location = New-Object System.Drawing.Point(419, 23)
$tc5.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$lpsw = New-Object system.Windows.Forms.Label
$lpsw.text = "Password:"
$lpsw.AutoSize = $true
$lpsw.width = 25
$lpsw.height = 10
$lpsw.location = New-Object System.Drawing.Point(30, 62)
$lpsw.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$bint = New-Object system.Windows.Forms.Button
$bint.text = "Get Interfaces"
$bint.width = 94
$bint.height = 35
$bint.enabled = $true
$bint.location = New-Object System.Drawing.Point(30, 113)
$bint.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$bint.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")

$bh5 = New-Object system.Windows.Forms.Button
$bh5.text = "5GHz Hotspot"
$bh5.width = 95
$bh5.height = 35
$bh5.visible = $true
$bh5.enabled = $true
$bh5.location = New-Object System.Drawing.Point(30, 159)
$bh5.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$bh2 = New-Object system.Windows.Forms.Button
$bh2.text = "2.4GHz Hotspot"
$bh2.width = 96
$bh2.height = 35
$bh2.visible = $true
$bh2.enabled = $true
$bh2.location = New-Object System.Drawing.Point(145, 159)
$bh2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$tc2 = New-Object system.Windows.Forms.TextBox
$tc2.multiline = $false
$tc2.width = 186
$tc2.height = 20
$tc2.location = New-Object System.Drawing.Point(744, 23)
$tc2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$lc2 = New-Object system.Windows.Forms.Label
$lc2.text = "Client 2.4Ghz:"
$lc2.AutoSize = $true
$lc2.width = 25
$lc2.height = 10
$lc2.location = New-Object System.Drawing.Point(639, 27)
$lc2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$lap5 = New-Object system.Windows.Forms.Label
$lap5.text = "Hotspot 5Ghz:"
$lap5.AutoSize = $true
$lap5.width = 25
$lap5.height = 10
$lap5.location = New-Object System.Drawing.Point(324, 64)
$lap5.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$tap5 = New-Object system.Windows.Forms.TextBox
$tap5.multiline = $false
$tap5.width = 186
$tap5.height = 20
$tap5.location = New-Object System.Drawing.Point(419, 60)
$tap5.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$lap2 = New-Object system.Windows.Forms.Label
$lap2.text = "Hotspot 2.4Ghz:"
$lap2.AutoSize = $true
$lap2.width = 25
$lap2.height = 10
$lap2.location = New-Object System.Drawing.Point(639, 64)
$lap2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$tap2 = New-Object system.Windows.Forms.TextBox
$tap2.multiline = $false
$tap2.width = 186
$tap2.height = 20
$tap2.location = New-Object System.Drawing.Point(745, 60)
$tap2.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$bstatus = New-Object system.Windows.Forms.Button
$bstatus.text = "Get Status"
$bstatus.width = 96
$bstatus.height = 35
$bstatus.visible = $true
$bstatus.enabled = $true
$bstatus.location = New-Object System.Drawing.Point(145, 112)
$bstatus.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$bstatus.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")

$save = New-Object system.Windows.Forms.Button
$save.text = "Save"
$save.width = 96
$save.height = 35
$save.visible = $true
$save.enabled = $true
$save.location = New-Object System.Drawing.Point(257, 113)
$save.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$save.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")

$load = New-Object system.Windows.Forms.Button
$load.text = "Load"
$load.width = 96
$load.height = 35
$load.visible = $true
$load.enabled = $true
$load.location = New-Object System.Drawing.Point(257, 159)
$load.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)
$load.ForeColor = [System.Drawing.ColorTranslator]::FromHtml("")

$tpsw = New-Object system.Windows.Forms.MaskedTextBox
$tpsw.multiline = $false
$tpsw.width = 200
$tpsw.height = 20
$tpsw.location = New-Object System.Drawing.Point(99, 60)
$tpsw.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$log = New-Object System.Windows.Forms.TextBox
$log.multiline = $true
$log.width = 512
$log.ScrollBars = "Vertical"
$log.height = 80
$log.enabled = $true
$log.Anchor = 'top,right,bottom,left'
$log.location = New-Object System.Drawing.Point(418, 112)
$log.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 10)

$form.controls.AddRange(@($lip, $lc5, $tip, $tc5, $lpsw, $bint, $bh5, $bh2, $tc2, $lc2, $lap5, $tap5, $lap2, $tap2, $bstatus, $save, $load, $tpsw, $log))

$bint.Add_Click( { Get-Interfaces })
$bh5.Add_Click( { Set-Hotspot5 })
$bh2.Add_Click( { Set-Hotspot2 })
$bstatus.Add_Click( { Get-Status })
$save.Add_Click( { Write-Settings })
$load.Add_Click( { Read-Settings })

$tpsw.PasswordChar = '*'

#endregion Setup Windows Forms

#region Setup Router Interface
$plink = ".\plink.exe"
#endregion Setup Router Interface

#region Functions
function Invoke-RemoteCommand($str) {
    $routerUser = "root"
    $routerIP = $tip.Text
    $routerPassword = $tpsw.Text

    $command = "$plink -ssh $routerUser@$routerIP -pw $routerPassword -no-antispoof $str"
    Invoke-Expression $command
}

function Read-WifiStatus($obj) {
    $obj | ForEach-Object { 
        $section = $_.section
        $ifname = $_.ifname
        $mode = $_.config.mode
        $ssid = $_.config.ssid
        Write-Log ("Section: $section`r`n`tInterface: $ifname`r`n`tMode: $mode`r`n`tSSID: $ssid") 
    }
}

function Read-WifiDevices {
    $result = @{}
    Invoke-RemoteCommand "uci show wireless" | Where-Object { $_.Contains("ssid=") -or $_.Contains(".mode=") -or $_.Contains(".device=") } | ForEach-Object {
        $splitted = $_.Split(".")
        $name = $splitted.Get(1)
        $sp2 = $splitted.Get(2).Replace("'", "").Split("=")

        $pname = $sp2.Get(0)
        $pvalue = $sp2.Get(1)

        if ($result.ContainsKey($name)) {
            $result[$name][$pname] = $pvalue
        }
        else {
            $pdata = @{
                $pname = $pvalue
            }
            $result[$name] = $pdata
        }
    }
    return $result
}

function Commit-Changes {
    Invoke-RemoteCommand "`"uci commit`"" 2>$null
}

function Reload-Settings {
    Invoke-RemoteCommand "`"wifi`"" 2>$null
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

function Write-Log {
    param ($Str)
    Write-Line $Str
    $log.AppendText($Str + "`r`n")
}


function Write-Settings {
    $ip = $tip.Text
    $psw = $tpsw.Text
    $c2 = $tc2.Text
    $c5 = $tc5.Text
    $h2 = $tap2.Text
    $h5 = $tap5.Text

    $settings = [PSCustomObject]@{
        ip       = $ip
        password = $psw
        h5g      = $h5
        c5g      = $c5
        h2g      = $h2
        c2g      = $c2
    }

    $settings | ConvertTo-Json | Out-File -FilePath "$env:HOMEPATH\.wifi-swapper.conf"
}
function Read-Settings {
    if (Test-Path -Path "$env:HOMEPATH\.wifi-swapper.conf") {
        $settings = Get-Content -Path "$env:HOMEPATH\.wifi-swapper.conf" | ConvertFrom-Json

        $tip.Text = $settings.ip
        $tpsw.Text = $settings.password
        $tc5.Text = $settings.c5g
        $tc2.Text = $settings.c2g
        $tap2.Text = $settings.h2g
        $tap5.Text = $settings.h5g
    }
}

function Get-Status {
    $jsonStatus = (Invoke-RemoteCommand "wifi status" | ConvertFrom-Json)
    $Iradio0 = $jsonStatus.radio0.interfaces
    $Iradio1 = $jsonStatus.radio1.interfaces

    Read-WifiStatus $Iradio0
    Read-WifiStatus $Iradio1
    Write-Log "=================="
}
function Set-Hotspot2 {
    Write-Log "Enabling 2.4Ghz hotspot"
    Enable-WifiInterface $tap2.Text
    Write-Log "Disabling 2.4Ghz client"
    Disable-WifiInterface $tc2.Text

    Write-Log "Enabling 5Ghz client"
    Enable-WifiInterface $tc5.Text
    Write-Log "Disablig 5Ghz hotspot"
    Disable-WifiInterface $tap5.Text

    Commit-Changes
    Reload-Settings
}
function Set-Hotspot5 {
    Write-Log "Enabling 2.4Ghz client"
    Enable-WifiInterface $tc2.Text
    Write-Log "Disablig 2.4Ghz AP"
    Disable-WifiInterface $tap2.Text

    Write-Log "Disablig 5Ghz client"
    Disable-WifiInterface $tc5.Text
    Write-Log "Enabling 5Ghz hotspot"
    Enable-WifiInterface $tap5.Text

    Commit-Changes
    Reload-Settings
}
function Get-Interfaces {
    $result = Read-WifiDevices
    foreach ($key in $result.Keys) {
        Write-Log "Interface Name: $key :"
        foreach ($k2 in $result[$key].Keys) {
            $val = $result[$key][$k2]
            if ($val -eq "sta") {
                $val = "Client"
            }
            elseif ($val -eq "ap") {
                $val = "Hotspot"
            }
            elseif ($val -eq "radio0") {
                $val = "5GHz"
            }
            elseif ($val -eq "radio1") {
                $val = "2.4GHz"
            }

            Write-Log "`t$k2 : $val"
        }
        Write-Log
    }
    Write-Log "=================="
}

function Write-Line($str) {
    if ($env:SWAPPER_QUIET -ne "true") {
        Write-Host $str
    }
}

#endregion Functions

Read-Settings

#Write your logic code here

[void]$form.ShowDialog()