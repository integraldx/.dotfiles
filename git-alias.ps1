# These refers to https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git/git.plugin.zsh
# Thanks to @simnalamburt for support

# Removing predefined aliases
Remove-Alias gc -Force

# Git aliases
function GitMainBranch {
    if (git branch --list main) {
        return "main"
    }
    else {
        return "master"
    }
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
    grep -vE ("^(\+|\*|\s*({0}|development|develop|devel|dev)\s*$)" -f (GitMainBranch)) |
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
function gco { git checkout @args }
function gcount { git shortlog -sn @args }
function gcp { git cherry-pick @args }
function gcpa { git cherry-pick --abort @args }
function gcpc { git cherry-pick --continue @args }
function gcs { git commit -S @args }

function gst { git status @args }
