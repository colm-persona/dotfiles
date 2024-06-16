set fish_greeting ""
set theme_color_scheme terminal-dark

# Shorten go run
alias rr "go run ."
alias bb "go build ."

# Shorten Git actions
alias g "git"
alias ga "git add"
alias gaa "git add -A"
alias gs "git status"
alias gc "git commit"
alias gcm "git commit -m"
alias gd "git diff"
alias gl "git log"
alias gp "git push -u origin main"
alias gf "git fetch"
alias gfmom "git fetch; git merge origin/main"
# worktrees
alias gcb "git clone --bare"
alias gwa "git worktree add"

# Shorthand for npm development
alias nerd "npm run dev"

# simplify ssh tao
alias tao "ssh tao"

# Simplify the add all and commit command
function gca
	git add -A
	git commit -m $argv
end

# Change ls to use exa in grid mode and show icons
alias ls "exa -G --icons --group-directories-first"
alias la "exa -G --icons --group-directories-first -a"

# Change ll to use exa with customizations
alias ll "exa -T -L 2 -b --git -h --no-permissions --no-user --icons -l --git-ignore -a"

# Change vim and vi to use neovim
alias vi "nvim"
alias vim "nvim"

# ssh into the debain guest os (assuming that it is running)
alias deb "ssh localhost"

# Shorten ssh griffin
alias gr "ssh griffin"
# Shorten xv6 boot
alias mq "make qemu"

# Autograder
fish_add_path ~/autograder/
fish_add_path /Users/colmlang/.cargo/bin
fish_add_path /usr/local/opt/riscv-gnu-toolchain/bin
fish_add_path ~/.rbenv/shims

# mta-upload
fish_add_path ~/s/cs601/manga-text-analytics/mta-upload/

# Add the go path
fish_add_path ~/go/bin

function tst
  grade test -p $(pwd | rev | cut -f1 -d'/' - | rev | cut -f1 -d'-' -) $argv
end

function crb 
  echo "git checkout -b cr-colm" 
  git checkout -b cr-colm
end

function gpcr
  git coa 'cr: add code review comments'
  git push -u origin cr-colm
end
