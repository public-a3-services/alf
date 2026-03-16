#Install-Module -Name PS2EXE -Scope CurrentUser -Force -AllowClobber

Invoke-PS2EXE -InputFile "alf-chrome-extension-agent.ps1" `
              -OutputFile "alf-chrome-extension-agent.exe" `
              -NoConsole `
              -STA `
              -NoOutput