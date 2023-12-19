# Install-Module -Name Microsoft.WinGet.Client

# Install-WindowsFeature -Name Telnet-Client -IncludeAllSubFeature

# dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# wsl --install Debian

# winget install example --version 1.2.3 --location $env:USERPROFILE\Custom\Git



# Install applications using winget with specified versions

# Applications
$apps = @{
    "Google.Chrome" = "88.0.4324.182";
    "Microsoft.VisualStudioCode" = "1.60.2";
    "Notepad++" = "8.1.9";
    "Docker" = "20.10.10";
    "Git.Git" = "2.33.0";
    "GitHub.GitHubDesktop" = "2.9.4";
    "7zip.7zip" = "19.00";
    "Discord" = "0.0.308";
    "Steam" = "2.10.91.91";
    "qbittorrent.qbittorrent" = "4.3.8";
    "VLC" = "3.0.12";
    "Postman" = "9.11.5";
    "Notion" = "2.10.11";
    "NVIDIAGeForceExperience.NVIDIAGeForceExperience" = "3.24.0.70";
    "Amazon.AWSCLI" = "2.2.38";
    "Google.CloudSDK" = "361.0.0";
    "Microsoft.AzureCLI" = "2.28.0"
}

# Development Tools
$tools = @{
    "Node.Nodejs" = "14.17.6";
    "Golang.Go" = "1.17.1";
    "Python.Python" = "3.9.7";
    "OpenJDK.JavaRuntime" = "11.0.12";
    "Rustlang.Rust" = "1.55.0";
    "Ruby.Ruby" = "3.0.2"
}

# IDEs
$ides = @{
    "JetBrains.CLion" = "2021.1.3";
    "JetBrains.DataGrip" = "2021.1.3";
    "JetBrains.GoLand" = "2021.2.3";
    "JetBrains.IdeaU" = "2021.1.2";
    "JetBrains.Rider" = "2021.1.5";
    "JetBrains.PhpStorm" = "2021.1";
    "JetBrains.PyCharm.Professional" = "2021.2.2";
    "JetBrains.RubyMine" = "2021.1.2";
    "JetBrains.WebStorm" = "2021.1.3"
}

# # Install Applications
# foreach ($app in $apps.GetEnumerator()) {
#     Write-Host "$app.Key"
#     winget install --location "$env:USERPROFILE\Custom\$app.Key" --id $app.Key --version $app.Value -e
# }

# # Install Development Tools
# foreach ($tool in $tools.GetEnumerator()) {
#     Write-Host "$tool.Key"
#     winget install --location "$env:USERPROFILE\Custom\$tool.Key" --id $tool.Key --version $tool.Value -e
# }

# Install IDEs
foreach ($ide in $ides.GetEnumerator()) {
    $ideKey = $ide.Key
    $ideValue = $ide.Value
    $idePath = "$env:USERPROFILE\Custom\$ideKey"
    Write-Host "IDE: $ideKey, Version: $ideValue, Path: $idePath"
    winget install --location $idePath --id $ideKey --version $ideValue -e
}


