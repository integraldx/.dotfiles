# These refers to https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
# Thanks to @simnalamburt for support

# Removing predefined aliases
if (Test-Path alias:gc) {
    Remove-Alias gc -Force
}

if (Test-Path alias:gp) {
    Remove-Alias gp -Force
}

if (Test-Path alias:gm) {
    Remove-Alias gm -Force
}

if (Test-Path alias:gl) {
    Remove-Alias gl -Force
}

if (Test-Path alias:gcm) {
    Remove-Alias gcm -Force
}

# Git aliases
function GitMainBranch {
    if (git branch --list main) {
        return "main"
    }
    else {
        return "master"
    }
}

function GitCurrentBranch {
    return (git rev-parse --abbrev-ref HEAD)
}

function g { git @args }
function ga { git add @args }
function gaa { git add --all @args }
function gapa { git add --patch @args }
function gau { git add --update @args }
function gav { git add --verbose @args }
function gap { git apply @args }
function gapt { git apply --3way @args }

function gb { git branch @args }
function gba { git branch -a @args }
function gbd { git branch -d @args }
function gbda {
    git branch --no-color --merged |
    grep -vE "^(\+|\*|\s*($(GitMainBranch)|development|develop|devel|dev)\s*$)" |
    xargs -n 1 git branch -d
}
function gbD { git branch -D @args }
function gbl { git blame -b -w @args }
function gbnm { git branch --no-merged @args }
function gbr { git branch --remote @args }
function gbs { git bisect @args }
function gbsb { git bisect bad @args }
function gbsg { git bisect good @args }
function gbsr { git bisect reset @args }
function gbss { git bisect start @args }

function gc { git commit -v @args }
function gc! { git commit -v --amend @args }
function gcn! { git commit -v --no-edit --amend @args }
function gca { git commit -v -a @args }
function gca! { git commit -v -a --amend @args }
function gcan! { git commit -v -a --no-edit --amend @args }
function gcans! { git commit -v -a -s --no-edit --amend @args }
function gcam { git commit -a -m @args }
function gcsm { git commit -s -m @args }
function gcb { git checkout -b @args }
function gcf { git config --list @args }
function gcl { git clone --recurse-submodules @args }
function gclean { git clean -id @args }
function gpristine { git reset --hard ; git clean -dffx }
function gcm { git checkout (GitMainBranch) @args }
function gcd { git checkout develop @args }
function gcmsg { git commit -m @args }
function gco {
    [CmdletBinding()]
    param (
        $TargetBranch
    )
    git checkout $TargetBranch @args
}
$BranchList = {
    param($commandName,$parameterName,$stringMatch)
    (git for-each-ref --format='%(refname:short)' refs/ | Out-String).Split([Environment]::NewLine) | Select-String -Pattern $stringMatch
}
Register-ArgumentCompleter -CommandName gco -ParameterName TargetBranch -ScriptBlock $BranchList
function gcount { git shortlog -sn @args }
function gcp { git cherry-pick @args }
function gcpa { git cherry-pick --abort @args }
function gcpc { git cherry-pick --continue @args }
function gcs { git commit -S @args }

function gd { git diff @args }
function gdca { git diff --cached @args }
function gdcw { git diff --cached --word-diff @args }
function gdct { git describe --tags (git rev-list --tags --max-count=1 | Out-String) }
function gds { git diff --staged @args }
function gdt { git diff-tree --no-commit-id --name-only -r @args }
function gdw { git diff --word-diff @args }
function gdnolock { git diff $args[0] ":(exclude)package-lock.json" ":(exclude)*.lock"}
function gdv { git diff -w "$($args[0])" | view - }

function gf { git fetch @args }
function gfa { git fetch --all --prune @args }
function gfo { git fetch origin @args }
function gfg { git ls-files | grep @args }

function gg { git gui citool @args }
function gga { git gui citool --amend @args }
function ggpull { git pull origin (GitCurrentBranch) @args }
function ggpush { git push origin (GitCurrentBranch) @args }
function ggsup { git branch --set-upstream-to=origin/(GitCurrentBranch) @args }
function gpsup { git push --set-upstream origin (GitCurrentBranch) @args }

function ghh { git help @args }

function gignore { git update-index --assume-unchanged @args }
function gignored { git ls-flies -v | grep "^[[:lower:]]" }

function gk { gitk --all --branches @args }
function gke { gitk --all (git log -g --pretty=%h) @args }

function gl { git pull @args }
function glg { git log --stat @args }
function glgp { git log --stat -p @args }
function glgg { git log --graph @args }
function glgga { git log --graph --decorate --all @args }
function glgm { git log --graph --max-count=10 @args }
function glo { git log --oneline --decorate @args }
function glol { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' @args }
function glols { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat @args }
function glod { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' @args }
function glods { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short @args }
function glola { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all @args }
function glog { git log --oneline --decorate --graph @args }
function gloga { git log --oneline --decorate --graph --all @args }

function gm { git merge @args }
function gmom { git merge origin/(GitMainBranch) @args }
function gmt { git mergetool --no-prompt @args }
function gmtvim { git mergetool --no-prompt --tool=vimdiff @args }
function gmum { git merge upstream/(GitMainBranch) @args }
function gma { git merge --abort @args }

function gp { git push @args }
function gpd { git push --dry-run @args }
function gpf { git push --force-with-lease @args }
function gpf! { git push --force @args }
function gpoat { git push origin --all && git push origin --tags }
function gpu { git push upsteam @args }
function gpv { git push -v @args }

function gr { git remote @args }
function gra { git remote add @args }
function grb { git rebase @args }
function grba { git rebase --abort @args }
function grbc { git rebase --continue @args }
function grbd { git rebase develop @args }
function grbi { git rebase -i @args }
function grbm { git rebase (GitMainBranch) @args }
function grbs { git rebase --skip @args }
function grev { git revert @args }
function grh { git reset @args }
function grhh { git reset --hard @args }
function groh { git reset origin/(GitCurrentBranch) --hard @args }
function grm { git rm @args }
function grmc { git rm --cached @args }
function grmv { gir remote rename @args }
function grrm { git remote remove @args }
function grs { git restore @args }
function grsassets { git restore **/*.spriteatlas **/*.prefab **/*.asset @args }
function grset { git remote set-url @args }
function grss { git restore --source @args }
function grt { Set-Location "$((git rev-parse --show-toplevel || Write-Output .))"}
function gru { git reset -- @args }
function grup { git remote update @args }
function grv { git remote -v @args }

function gsb { git status -sb @args }
function gsd { git svn dcommit @args }
function gsh { git show @args }
function gsi { git submodule init @args }
function gsps { git show --pretty=short --show-signature @args }
function gsr { git svn rebase @args }
function gss { git status -s @args }
function gst { git status @args }

function gsta { git stash save @args }
function gstaa { git stash apply @args }
function gstc { git stash clear @args }
function gstd { git stash drop @args }
function gstl { git stash list @args }
function gstp { git stash pop @args }
function gsts { git stash show --text @args }
function gstu { git stash --include-untracked @args }
function gstall { git stash --all @args }
function gsu { git stash --include-untracked @args }
function gsw { git switch @args }
function gswc { git switch -c @args }

function gts { git tag -s @args }
function gtv { git tag | Sort-Object -V }
function gtl { git tag --sort=-v:refname -n -l "$($args[0])*" }

function gunignore { git update-index --no-assume-unchanged @args }
function gunwip { git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1 }
function gup { git pull --rebase @args }
function gupv { git pull --rebase -v @args }
function gupa { git pull --rebase --autostash @args }
function gupav { git pull --rebase --autostash -v @args }
function glum { git pull upstream (GitMainBranch) @args }

function gwch { git whatchanged -p --abbrev-commit --pretty=medium @args }
function gwip { git add -A; git rm (git ls-files --deleted | Out-String) 2>&1 Out-Null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"}

function gam { git am @args }
function gamc { git am --continue @args }
function gams { git am --skip @args }
function gama { git am --abort @args }
function gamscp { git am --show-current-patch @args }

function grename($oldbranch, $newbranch) {
    git branch -m $oldbranch $newbranch
    if (git push origin :"$($oldbranch)") {
        git push --set-upstream origin "$($newbranch)"
    }
}

# git-flow aliases
function gfl { git flow @args }
