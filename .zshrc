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
alias er='emacsclient -nc ~/.zshrc'
# Source .zshevn file
alias sv='source ~/.zshenv'
# Edit .zshenv file
alias ev='emacsclient -nc ~/.zshenv'

# TERMINAL STUFF
# Colorize the ls output 
alias ls='ls --color=auto'
# Use a long listing format
alias ll='ls -lah'
# List hidden files only
alias l.='ls -d .*'

# GIT
# A shorter add + commit
gadmit(){git add $1 && git commit -m $2}
# Git status
alias gs='git status'

# NAVIGATION SHORTCUTS
# Switch to academic folder in Dropbox
# alias academic='cd ~/Dropbox/academic'
alias acad='cd ~/Dropbox/academic'
# Switch to in-progress folder
alias inprog='cd ~/Dropbox/academic/in-progress'

# POP!_OS SHORTCUTS
# update apps
alias update='sudo apt update && sudo apt upgrade'

# OTHER PROGRAMS
# Emacs
# Make it easier to open emacs clients
# Open in existing emacs server
alias emax='emacsclient -nc'
# Same, but for Windows
# alias wemax='emacsclientw.exe'
# Debugger for frozen Emacs; from this thread: https://www.reddit.com/r/emacs/comments/cz9w9r/how_to_debug_emacs_when_uses_100_of_one_cpu_core/
alias unfreeze-emacs='killall -s USR2 emacs'

# 'vi' as an alias for 'vim'
alias vi='vim'
# 'python' as an alias for 'python3'
alias python='python3'

# CONNECT TO RASPBERRY PI
alias pi-connect='ssh jamie@pi.local'

# WSL STUFF
# Copy To Windows (i.e. copy file to Windows Downloads folder)
# ctw(){cp "$@" /mnt/c/Users/Jamie/Downloads}
# Move to Windows (i.e. move tile to Windows Downloads folder)
# mtw(){mv "$@" /mnt/c/Users/Jamie/Downloads}

### ===KEY BINDS=== ###
## Making some keys behave as expected:
# Home key
bindkey "^[[H" beginning-of-line
# End key
bindkey "^[[F" end-of-line
# Delete key
bindkey "^[[3~" delete-char

## PYENV (run different versions of Python)
# setup
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## Load UiO config file with work-related shortcuts and commands
[ -f $HOME/.uio ] && source $HOME/.uio

# rbenv initialisation, for Ruby (used for Jekyll)
eval "$(rbenv init - zsh)"

# Add autosuggestions for zsh to shell
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add syntax highlighting for zsh to shell
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
