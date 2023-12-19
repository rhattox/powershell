# Install applications using winget with specified versions
############################################################################
# Applications
$apps = @(
    "Google.Chrome",
    "WhatsApp.WhatsApp",
    "Mozilla.Firefox",
    "Telegram.TelegramDesktop",
    "Spotify.Spotify", 
    "Microsoft.VisualStudioCode",
    "Notepad++.Notepad++",
    "WinSCP.WinSCP",
    "Microsoft.WindowsTerminal",
    "PuTTY.PuTTY",
    "Postman.Postman",
    "Git.Git",,
    "7zip.7zip",
    "VideoLAN.VLC",
    "Notion.Notion",
    "Valve.Steam",
    "Discord.Discord",
    "ElectronicArts.Origin",
    "EpicGames.EpicGamesLauncher",
    "RiotGames.LeagueOfLegends.BR",
    "qBittorrent.qBittorrent",
	"Microsoft.PowerShell",
    "Nvidia.GeForceExperience"
)

# Install Tools
 foreach ($item in $apps) {
     Write-Host "`n"
     $Key = $item
     $Path = "$env:USERPROFILE\Custom\$Key"
     Write-Host "App: $Key,  Path: $Path"
     winget install --location $Path --id $Key -e
     Write-Host "`n"
 }

############################################################################
# Infra Tools
$infra = @(
    "Amazon.AWSCLI",
    "Google.CloudSDK",
    "Microsoft.AzureCLI",
    "GitHub.GitHubDesktop",
    "Docker.DockerDesktop",
    "Docker.DockerCLI",
    "Docker.DockerCompose",
    "RedHat.Podman",
    "GoLang.Go" 
)

# Install Infra Tools
 foreach ($item in $infra) {
     Write-Host "`n"     
     $Key = $item
     $Path = "$env:USERPROFILE\Custom\$Key"
     Write-Host "App: $Key,  Path: $Path"
     winget install --location $Path --id $Key -e
     Write-Host "`n"
 }

############################################################################
# Hashicorp Tools
$hashicorp = @(
    "Hashicorp.Boundary",
    "Hashicorp.Consul",
    "Hashicorp.Nomad",
    "Hashicorp.Packer",
    "Hashicorp.Vagrant",
    "Hashicorp.Waypoints",
    "Hashicorp.Terraform",
    "Hashicorp.Vault"
)

# Development Tools
$DevKit = @{
    # LTS Version
    "OpenJS.NodeJS.LTS" = "20.10.0";
    # Latest Version
    # Gets the ID version
    "Python.Python.3.12" = "3.12";
    # Matching version For Eclipse
    "EclipseAdoptium.Temurin.20.JRE" = "20.0.1.9";
    "EclipseAdoptium.Temurin.20.JDK" = "20.0.1.9";
    # Fixed version
    "Rustlang.Rustup" = "1.26.0";
    # Fixed version
    "CrystalLang.Crystal" = "1.9.2"
    # Gets the ID version
    "RubyInstallerTeam.Ruby.3.2" = "3.2.1-1"
}

# Install DevKit
foreach ($kit in $DevKit.GetEnumerator()) {
    Write-Host "`n"
    $Key = $kit.Key
    $Value = $kit.Value
    $Path = "$env:USERPROFILE\Custom\$Key"
    Write-Host "DevKit: $Key, Version: $Value, Path: $Path"
    winget install --location $Path --id $Key --version $Value -e
    Write-Host "`n"
}

############################################################################
# IDEs
$ides = @{
    "JetBrains.CLion" = "2021.1.3";
    "JetBrains.DataGrip" = "2021.1.3";
    "JetBrains.GoLand" = "2021.1.3";
    "JetBrains.IntelliJIDEA.Ultimate" = "2021.1.2";
    "JetBrains.Rider" = "2021.1.5";
    "JetBrains.PhpStorm" = "2021.1.1";
    "JetBrains.PyCharm.Professional" = "2021.2.2";
    "JetBrains.RubyMine" = "2021.1.2";
    "JetBrains.WebStorm" = "2021.1.3"
}



# Install IDEs
 foreach ($ide in $ides.GetEnumerator()) {
     Write-Host "`n"
     $Key = $ide.Key
     $Value = $ide.Value
     $Path = "$env:USERPROFILE\Custom\$Key"
     Write-Host "IDE: $Key, Version: $Value, Path: $Path"
     winget install --location $Path --id $Key --version $Value -e
     Write-Host "`n"
 }



Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Containers --norestart -NoRestart
wsl --install Debian
