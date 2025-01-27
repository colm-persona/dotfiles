alias g="git"
alias ga="git add"
alias gaa="git add -A"
alias gs="git status"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
alias gl="git log"
alias gp="git pull"
alias gf="git fetch"
alias gfmom="git fetch; git merge origin/main"
alias gom="git checkout main"
alias glb='git reflog show --pretty=format:"%gs ~ %gd" --date=relative | grep checkout | grep -oE "[^ ]+ ~ .*" | awk -F~ "!seen[\$1]++" | head -n 10 | awk -F" ~ HEAD@{" "{printf(\"%s: %s\n\", substr(\$2, 1, length(\$2)-1), \$1)}"'
gpp() {
    # Get the name of the currently checked out branch
    current_branch=$(git symbolic-ref --short HEAD)

    # Push the current branch to origin
    git push origin "$current_branch"
}

alias gwap='git reflog show --pretty=format:"%gs ~ %gd" --date=relative | grep checkout | grep -oE "[^ ]+ ~ .*" | awk -F~ "!seen[\$1]++" | head -n 1'

__git_complete g __git_main
__git_complete gco _git_checkout
__git_complete gcb _git_checkout

alias mg="make generate"

git config --global --add safe.directory /workspaces/persona
