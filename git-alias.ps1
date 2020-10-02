# This refers to https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

function GitAdd($params) { git add $params }
function GitAddAll($params) { git add --all $params }
function GitAddPatch($params) { git add --patch $params }
function GitAddUpdate($params) { git add --update $params }
function GitAddVerbose($params) { git add --verbose $params }
function GitApply($params) { git apply $params }
function GitApplyTriple($params) { git apply --3way $params }

function GitBranch($params) { git branch $params }
function GitBranchAll($params) { git branch -a $params }
function GitBranchDelete($params) { git branch -d $params }
function GitBranchDeleteAll {
    git branch --no-color --merged |
    grep -vE "^(\+|\*|\s*(master|main|development|develop|devel|dev)\s*$)" |
    xargs -n 1 git branch -d
}
function GitBranchDeleteForce($params) { git branch -D $params }
function GitBlame($params) { git blame -b -w $params }
function GitBranchNoMerged($parmas) { git branch --no-merged $params}
function GitBranchRemote($params) { git branch --remote $params}
function GitBisect($params) { git bisect $params }
function GitBisectBad($params) { git bisect bad $params}
function GitBisectGood($params) { git bisect good $params}
function GitBisectReset($params) { git bisect reset $params}
function GitBisectStart($params) { git bisect start $params}

function GitCommit([Parameter(ValueFromRemainingArguments)] $params) { git commit $params }
function GitStatus($params) { git status $params }

Set-Alias g git -Force
Set-Alias ga GitAdd -Force
Set-Alias gaa GitAddAll -Force
Set-Alias gapa GitAddPatch -Force
Set-Alias gau GitAddUpdate -Force
Set-Alias gav GitAddVerbose -Force
Set-Alias gap GitApply -Force
Set-Alias gapt GitApplyTriple -Force

Set-Alias gb GitBranch -Force
Set-Alias gba GitBranchAll -Force
Set-Alias gbd GitBranchDelete -Force
Set-Alias gbda GitBranchDeleteAll -Force
Set-Alias gbD GitBranchDeleteForce -Force
Set-Alias gbl GitBlame -Force
Set-Alias gbnm GitBranchNoMerged -Force
Set-Alias gbr GitBranchRemote -Force
Set-Alias gbs GitBisect -Force
Set-Alias gbsb GitBisectBad -Force
Set-Alias gbsg GitBisectGood -Force
Set-Alias gbsr GitBisectReset -Force
Set-Alias gbss GitBisectReset -Force

if (Get-Alias gc)
{
    Remove-Alias gc -Force
}

Set-Alias gc GitCommit -Force
Set-Alias gst GitStatus -Force
