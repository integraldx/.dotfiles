
Import-Module oh-my-posh

Set-Theme agnoster

Set-Alias e explorer -Force

Invoke-Expression -Command (Get-Content -Path (Join-Path $PSScriptRoot .\git-alias.ps1) | Out-String)
