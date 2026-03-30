Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

$EXTENSION_URL_BASE = "https://pages-a3-services.github.io/alf-in3"
$EXTENSION_URL_ZIP  = "/release/alf-in3.zip"

# Build the full ZIP download URL
$zipUrl = "${EXTENSION_URL_BASE}${EXTENSION_URL_ZIP}"

# Paths inside LOCALAPPDATA
$baseDir   = "$env:LOCALAPPDATA\a3\alf-in3"
$zipPath   = Join-Path $baseDir "extension.zip"
$unpackDir = "$baseDir\extension"
$amsEnv    = Join-Path $unpackDir "ams.env"

# Remove the entire directory if it exists and recreate it
if (Test-Path $baseDir) {
    Remove-Item -Recurse -Force -Path $baseDir
}
New-Item -ItemType Directory -Force -Path $baseDir | Out-Null

# Download the ZIP archive
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Extract the ZIP into a clean directory
Expand-Archive -Path $zipPath -DestinationPath $unpackDir -Force

# Copy the extension path to clipboard
[System.Windows.Forms.Clipboard]::SetText($unpackDir)

# Load AMS_ENV variables from ams.env preserving order
$envVars = @()
if (Test-Path $amsEnv) {
    Get-Content $amsEnv | ForEach-Object {
        if ($_ -match "^(.*?)=(.*)$") {
            $envVars += [PSCustomObject]@{
                Key = $matches[1]
                Value = $matches[2]
            }
        }
    }
}

# Build a string with all variables in file order with bullets
$allVarsText = ""
foreach ($var in $envVars) {
    $allVarsText += "      $($var.Key) = $($var.Value)`n"
}

# Show MessageBox with path and all variables
[System.Windows.Forms.MessageBox]::Show(
    "The Alf-in3 is unpacked into:`n`n$unpackDir`n`n$allVarsText`nThe path has been copied to clipboard.",
    "Alf-in3 Rotot 1.1.1",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Information
)

# Immediately exit PowerShell process
exit
