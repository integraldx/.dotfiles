# This refers to https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh

function GitMainBranch {
    if (git branch --list main) {
        return "main"
    }
    else {
        return "master"
    }

}
function GitAdd([Parameter(ValueFromRemainingArguments)] $params) { git add $params }
function GitAddAll([Parameter(ValueFromRemainingArguments)] $params) { git add --all $params }
function GitAddPatch([Parameter(ValueFromRemainingArguments)] $params) { git add --patch $params }
function GitAddUpdate([Parameter(ValueFromRemainingArguments)] $params) { git add --update $params }
function GitAddVerbose([Parameter(ValueFromRemainingArguments)] $params) { git add --verbose $params }
function GitApply([Parameter(ValueFromRemainingArguments)] $params) { git apply $params }
function GitApplyTriple([Parameter(ValueFromRemainingArguments)] $params) { git apply --3way $params }

function GitBranch([Parameter(ValueFromRemainingArguments)] $params) { git branch $params }
function GitBranchAll([Parameter(ValueFromRemainingArguments)] $params) { git branch -a $params }
function GitBranchDelete([Parameter(ValueFromRemainingArguments)] $params) { git branch -d $params }
function GitBranchDeleteAll {
    git branch --no-color --merged |
    grep -vE "^(\+|\*|\s*(master|main|development|develop|devel|dev)\s*$)" |
    xargs -n 1 git branch -d
}
function GitBranchDeleteForce([Parameter(ValueFromRemainingArguments)] $params) { git branch -D $params }
function GitBlame([Parameter(ValueFromRemainingArguments)] $params) { git blame -b -w $params }
function GitBranchNoMerged([Parameter(ValueFromRemainingArguments)] $params) { git branch --no-merged $params}
function GitBranchRemote([Parameter(ValueFromRemainingArguments)] $params) { git branch --remote $params}
function GitBisect([Parameter(ValueFromRemainingArguments)] $params) { git bisect $params }
function GitBisectBad([Parameter(ValueFromRemainingArguments)] $params) { git bisect bad $params}
function GitBisectGood([Parameter(ValueFromRemainingArguments)] $params) { git bisect good $params}
function GitBisectReset([Parameter(ValueFromRemainingArguments)] $params) { git bisect reset $params}
function GitBisectStart([Parameter(ValueFromRemainingArguments)] $params) { git bisect start $params}

function GitCommit([Parameter(ValueFromRemainingArguments)] $params) { git commit -v $params }
function GitCommitAmend([Parameter(ValueFromRemainingArguments)] $params) { git commit -v --amend $params }
function GitCommitAmendNoedit([Parameter(ValueFromRemainingArguments)] $params) { git commit -v --no-edit --amend $params }
function GitCommitAll([Parameter(ValueFromRemainingArguments)] $params) { git commit -v -a $params }
function GitCommitAmendAll([Parameter(ValueFromRemainingArguments)] $params) { git commit -v -a --amend $params }
function GitCommitAmendAllNoedit([Parameter(ValueFromRemainingArguments)] $params) { git commit -v -a --no-edit --amend $params }
function GitCommitAmendAllNoeditSignoff([Parameter(ValueFromRemainingArguments)] $params) { git commit -v -a -s --no-edit --amend $params }
function GitCommitAllMessage([Parameter(ValueFromRemainingArguments)] $params) { git commit -a -m $params }
function GitCommitSignoffMessage([Parameter(ValueFromRemainingArguments)] $params) { git commit -s -m $params }
function GitCheckoutBranch([Parameter(ValueFromRemainingArguments)] $params) { git checkout -b $params }
function GitConfigList([Parameter(ValueFromRemainingArguments)] $params) { git config --list $params }
function GitClone([Parameter(ValueFromRemainingArguments)] $params) { git clone --recurse-submodules $params }
function GitClean([Parameter(ValueFromRemainingArguments)] $params) { git clean -id $params }
function GitPristine { git reset --hard ; git clean -dffx}
function GitCheckoutMain([Parameter(ValueFromRemainingArguments)] $params) { git checkout (GitMainBranch) $params }
function GitCheckoutDevelop([Parameter(ValueFromRemainingArguments)] $params) { git checkout develop $params}
function GitCommitMessage([Parameter(ValueFromRemainingArguments)] $params) { git commit -m $params }
function GitCheckout([Parameter(ValueFromRemainingArguments)] $params) { git checkout $params }
function GitCount([Parameter(ValueFromRemainingArguments)] $params) { git shortlog -sn $params }
function GitCherrypick([Parameter(ValueFromRemainingArguments)] $params) { git cherry-pick $params}
function GitCherrypickAbort([Parameter(ValueFromRemainingArguments)] $params) { git cherry-pick --abort $params}
function GitCherrypickContinue([Parameter(ValueFromRemainingArguments)] $params) { git cherry-pick --continue $params}
function GitCommitSign([Parameter(ValueFromRemainingArguments)] $params) { git commit -S $params}

function GitStatus([Parameter(ValueFromRemainingArguments)] $params) { git status $params }

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
Set-Alias gc! GitCommitAmend -Force
Set-Alias gcn! GitCommitAmendNoedit -Force
Set-Alias gca GitCommitAll -Force
Set-Alias gca! GitCommitAmendAll -Force
Set-Alias gcan! GitCommitAmendAllNoedit -Force
Set-Alias gcans! GitCommitAmendAllNoeditSignoff -Force
Set-Alias gcam GitCommitAllMessage -Force
Set-Alias gcsm GitCommitSignoffMessage -Force
Set-Alias gcb GitCheckoutBranch -Force
Set-Alias gcf GitConfigList -Force
Set-Alias gcl GitClone -Force
Set-Alias gclean GitClean -Force
Set-Alias gpristine GitPristine -Force
Set-Alias gcm GitCheckoutMain -Force
Set-Alias gcd GitCheckoutDevelop -Force
Set-Alias gcmsg GitCommitMessage -Force
Set-Alias gco GitCheckout -Force
Set-Alias gcount GitCount -Force
Set-Alias gcp GitCherrypick -Force
Set-Alias gcpa GitCherrypickAbort -Force
Set-Alias gcpc GitCherrypickContinue -Force
Set-Alias gcs GitCommitSign -Force

Set-Alias gst GitStatus -Force
