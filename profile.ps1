oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\robbyrussell.omp.json | Invoke-Expression
Invoke-Expression (& { (lua "$HOME\Appdata\Local\z\z.lua" --init powershell) -join "`n" })

Set-Alias vim nvim
Set-Alias e explorer -Force

. $PSScriptRoot/git-alias.ps1

Set-PSReadLineOption -Colors @{ 
  "Parameter"="DarkMagenta"
  "Operator"="DarkMagenta" 
}

