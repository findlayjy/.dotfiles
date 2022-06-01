### ===THEME/PROMPT PERSONALISATION=== ###
# Allow expansion, e.g. of commands, inside prompt definition
setopt PROMPT_SUBST

# Load colour names
autoload -U colors
colors

# Add my custom themes folder to fpath
fpath+=(~/.zsh/themes)

# Initialize the prompt system 
autoload -U promptinit 
promptinit

prompt jyf

# A minimal prompt
# PROMPT='%B%F{240}%1~%f%b %(!.#.>) '

## Loading custom dircolors
# If there is a .dir_colors file, import it
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

### ===ALIASES=== ###
# Source .zshrc file
alias sr='source ~/.zshrc'
# Edit .zshrc file
alias er='vim ~/.zshrc'

# TERMINAL STUFF
# Colorize the ls output 
alias ls='ls --color=auto'
# Use a long listing format
alias ll='ls -la'
# Show hidden files
alias l.='ls -d .*'

# GIT
# A shorter add + commit
gadmit(){git add $1 && git commit -m $2}
# Do this for the whole directory
# alias gadmit='git add . && git commit -m'
# Git status
alias gs='git status'

# NAVIGATION SHORTCUTS
# Switch to local UNLU project dir
alias unlu-l='cd ~/Dropbox/academic/jobs/oslo-unlu-postdoc/project/git-repos/glue-for-UD'
# Switch to remote UNLU dir containing github repos
alias unlu-r='cd ~/foni/unlu/git-repos/glue-for-UD'
# Switch to academic folder in Dropbox
alias academic='cd ~/Dropbox/academic'
# Switch to in-progress folder
alias inprog='cd ~/Dropbox/academic/in-progress'

# POP!_OS SHORTCUTS
# update apps
alias update='sudo apt update && sudo apt upgrade'

# OTHER PROGRAMS
# Make it easier to open emacs clients
# Open in existing emacs server
alias emax='emacsclient -nc'
# Same, but for Windows
alias wemax='emacsclientw.exe'
# 'vi' as an alias for 'vim'
alias vi='vim'

# WSL STUFF
# Copy To Windows (i.e. copy file to Windows Downloads folder)
ctw(){cp "$@" /mnt/c/Users/Jamie/Downloads}
# Move to Windows (i.e. move tile to Windows Downloads folder)
mtw(){mv "$@" /mnt/c/Users/Jamie/Downloads}

### ===KEY BINDS=== ###
## Making some keys behave as expected:
# Home key
bindkey "^[[H" beginning-of-line
# End key
bindkey "^[[F" end-of-line
# Delete key
bindkey "^[[3~" delete-char

# For reasons as yet unknown (possibly just to do with Windows Terminal being what it is), my prompt doesn't display properly when the terminal is first opened, but on second loading it's fine -- so this just cleans that up.
clear

## PYENV (run different versions of Python)
# setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## Load UNLU shortcuts and commands
[ -f $HOME/.unlu ] && source $HOME/.unlu
