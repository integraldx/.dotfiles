Import-Module oh-my-posh

Set-Theme agnoster

function GitAdd {
    param (
        $OptionalParameters
    )
    git add $OptionalParameters
}

Set-Alias g git
Set-Alias e explorer
Set-Alias ga GitAdd
