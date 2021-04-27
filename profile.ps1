Invoke-Expression (oh-my-posh --init --shell pwsh --config "$(scoop prefix oh-my-posh3)/themes/robbyrussel.omp.json")

Set-Alias vim nvim
Set-Alias e explorer -Force

. $PSScriptRoot/git-alias.ps1
