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
alias gp="git push -u origin main"
alias gf="git fetch"
alias gfmom="git fetch; git merge origin/main"
alias gom="git checkout main"
gpp() {
    # Get the name of the currently checked out branch
    current_branch=$(git symbolic-ref --short HEAD)

    # Push the current branch to origin
    git push origin "$current_branch"
}

__git_complete g __git_main
__git_complete gco _git_checkout
__git_complete gcb _git_checkout

