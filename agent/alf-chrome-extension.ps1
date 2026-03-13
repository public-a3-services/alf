Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# URL ZIP rozšírenia
$EXTENSION_URL_BASE = "https://public-a3-services.github.io/alf"
$EXTENSION_URL_ZIP  = "/release/alf.zip"

# Zostav celú URL ZIP súboru
$zipUrl = "${EXTENSION_URL_BASE}${EXTENSION_URL_ZIP}"

# Cesty v LOCALAPPDATA
$baseDir   = "$env:LOCALAPPDATA\a3\alf"
$zipPath   = Join-Path $baseDir "extension.zip"
$unpackDir = "$baseDir\extension"

# Vymaž celý obsah priečinka (ak existuje) a vytvor adresár nanovo
if (Test-Path $baseDir) {
    Remove-Item -Recurse -Force -Path $baseDir
}
New-Item -ItemType Directory -Force -Path $baseDir | Out-Null

# Stiahni ZIP
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# Rozbaľ ZIP do čistého priečinka
Expand-Archive -Path $zipPath -DestinationPath $unpackDir -Force

# Copy path to clipboard
[System.Windows.Forms.Clipboard]::SetText($unpackDir)

# Show MessageBox
[System.Windows.Forms.MessageBox]::Show(
    "    The ALF extension is unpacked into:`n`n    $unpackDir`n`n    The path has been copied to clipboard.",
    "ALF Extension Ready",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Information
)

# Immediately exit PowerShell process
exit
