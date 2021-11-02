try {
  oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\robbyrussel.omp.json | Invoke-Expression 2> $null
}
catch {
}

Set-Alias vim nvim
Set-Alias e explorer -Force

. $PSScriptRoot/git-alias.ps1
