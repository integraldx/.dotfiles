oh-my-posh --init --shell pwsh --config $HOME/.dotfiles/local/theme.omp.json | Invoke-Expression

Set-Alias vim nvim
Set-Alias e explorer -Force

. $PSScriptRoot/git-alias.ps1

Set-PSReadLineOption -Colors @{ 
  "Parameter"="DarkMagenta"
  "Operator"="DarkMagenta" 
}

