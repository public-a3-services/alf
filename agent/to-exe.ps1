#Install-Module -Name PS2EXE -Scope CurrentUser -Force -AllowClobber

Invoke-PS2EXE -InputFile "alf-chrome-extension.ps1" `
              -OutputFile "alf-chrome-extension.exe" `
              -NoConsole `
              -STA `
              -NoOutput