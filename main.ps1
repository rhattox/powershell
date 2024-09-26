# Install applications using winget with specified versions

# To install applications that the hash doesn't match, use this
# winget settings --enable InstallerHashOverride

# remove the UAC from windows panel to make it easier
# put it back on once it's done

$installUserApps = $false
$installGamerApps = $false
$installDevApps = $false
$installContainersApps = $false
$installHashicorpApps = $false
#
# User
#
$user = @(
    "Google.Chrome",
    "Mozilla.Firefox",
    "9NKSQGP7F2NH", #whatsapp
    "Spotify.Spotify", 
    "Telegram.TelegramDesktop",
    "7zip.7zip",
    "VideoLAN.VLC",
    "qBittorrent.qBittorrent"
)
#
# Gamer
#
$gamer = @(
    "Valve.Steam",
    "Discord.Discord",
    "ElectronicArts.Origin",
    "EpicGames.EpicGamesLauncher",
    "Nvidia.GeForceExperience",
    "CPUID.HWMonitor",
    "Guru3D.Afterburner"
)

#
# Developer
#
$dev = @(
    "Notion.Notion",
    "Microsoft.VisualStudioCode",
    "Notepad++.Notepad++",
    "PuTTY.PuTTY",
    "WinSCP.WinSCP",
    "Git.Git",
    "Microsoft.WindowsTerminal",
    "Microsoft.PowerShell",
    "GitHub.GitHubDesktop",
    "GitHub.cli"
    #"Oracle.JDK.22",
    #"JetBrains.IntelliJIDEA.Ultimate",
    #"Microsoft.VisualStudio.2022.Community",
    "Debian.Debian",
    "Oracle.VirtualBox"
)
    

$containers = @(
    "Docker.DockerDesktop",
    "Docker.DockerCLI",
    "Docker.DockerCompose",
    "Kubernetes.kubectl",
    #"Kubernetes.minikube",
    "Helm.Helm",
    #"Mirantis.Lens",
    "ahmetb.kubectx",
    "ahmetb.kubens"
    # "argoproj.argocd"
)

$hashicorp = @(
    "Hashicorp.Packer",
    "Hashicorp.Vagrant",
    "Hashicorp.Terraform"
)


function InstallApps {
    param (
        [string[]]$apps
    )
    # Install Tools
    foreach ($item in $apps) {
        Write-Host "`n"
        $Key = $item
        $Path = "$env:USERPROFILE\Custom\$Key"
        Write-Host "App: $Key,  Path: $Path"
        winget install --location $Path --id $Key -e --accept-package-agreements --force --disable-interactivity --silent  --ignore-security-hash
        Write-Host "`n"
    }
}

if ($installUserApps) {
    InstallApps -apps $user
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0 -PropertyType DWORD -Force
	New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarSmallIcons -Value 1 -PropertyType DWORD -Force

}
if ($installGamerApps) {
    InstallApps -apps $gamer
}
if ($installDevApps) {
    InstallApps -apps $dev
	Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
	# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All -NoRestart
	Enable-WindowsOptionalFeature -Online -FeatureName TelnetClient -NoRestart
	Enable-WindowsOptionalFeature -Online -FeatureName Containers -NoRestart
	Enable-WindowsOptionalFeature -Online -FeatureName Containers-DisposableClientVM -All -NoRestart

}
if ($installContainersApps) {
    InstallApps -apps $containers
}
if ($installHashicorpApps) {
    InstallApps -apps $hashicorp
}

