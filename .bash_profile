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
alias glb='git reflog show --pretty=format:"%gs ~ %gd" --date=relative | grep checkout | grep -oE "[^ ]+ ~ .*" | awk -F~ "!seen[\$1]++" | tac | awk -F" ~ HEAD@{" "{printf(\"%s: %s\n\", substr(\$3, 1, length(\$2)-1), \$1)}"'
gpp() {
    # Get the name of the currently checked out branch
    current_branch=$(git symbolic-ref --short HEAD)

    # Push the current branch to origin
    git push origin "$current_branch"
}
alias gpa="ga . && gcm .; gpp"
alias gmap="gfmom; ga . && gcm .; gpp"

alias gwap='git reflog show --pretty=format:"%gs ~ %gd" --date=relative | grep checkout | grep -oE "[^ ]+ ~ .*" | awk -F~ "!seen[\$1]++" | head -n 1'

__git_complete g __git_main
__git_complete gco _git_checkout
__git_complete gcb _git_checkout

alias mg="make generate"
alias ml="make lint"

git config --global --add safe.directory /workspaces/persona

alias e="exa --group-directories-first --icons"
alias el="exa -T -L 2 --icons --group-directories-first"

export PATH=$PATH:~/.cargo/bin
alias ops="/workspaces/persona/libs/ops/ops"
