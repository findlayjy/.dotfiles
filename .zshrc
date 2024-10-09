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

### ===END OF THEME/PROMPT PERSONALISATION=== ###


## Loading custom dircolors
# If there is a .dir_colors file, import it
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# EDITING/RELOADING CONFIG FILES
# Edit .zshrc file
alias er='emax ~/.zshrc'
# alias er='nvim ~/.zshrc'

# Source .zshrc file
alias sr='source ~/.zshrc'

# Edit .zshenv file
alias ev='emax ~/.zshenv'
# alias ev='nvim ~/.zshenv'

# Source .zshenv file
alias sv='source ~/.zshenv'

# Edit tmux config
alias et='emax ~/.config/tmux/tmux.conf'

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
alias sys-update='sudo apt update && sudo apt upgrade'

# PYTHON VIRTUAL ENVIRONMENT MANAGEMENT
# Create a virtual environment in a directory .venv
alias venv-create='python -m venv .venv'
# Activate that environment
alias venv-activate='source .venv/bin/activate'
# Just for parallelism
alias venv-deactivate='deactivate'

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
# WARNING: sacrilege
# 'vim' as an alias for terminal emacs
alias vim='emacsclient -nw'
# 'vim' as an alias for neovim
# alias vim='nvim'
# 'python' as an alias for 'python3'
alias python='python3'

# DUMB STUFF
# Hollywood hacker screen
alias hacker='sudo docker run --rm -it bcbcarl/hollywood'

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
# eval "$(rbenv init - zsh)"

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '/home/jamief/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# ANTIGEN PACKAGE MANAGER #######################
source ~/.zsh/antigen.zsh

# Load the oh-my-zsh's library. See the list here: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
antigen use oh-my-zsh

## Some bundles
# Adds autocompletion for pip
antigen bundle pip
# Suggests what package to install to use command if it is not available
antigen bundle command-not-found
# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# Auto-suggestions
antigen bundle zsh-users/zsh-autosuggestions
# More completions
antigen bundle zsh-users/zsh-completions
# Search history substrings (needs to be loaded last?)
antigen bundle zsh-users/zsh-history-substring-search

# Tell Antigen that you're done with bundles
antigen apply

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up # or '\eOA'
bindkey '^[[B' history-substring-search-down # or '\eOB'
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# END OF ANTIGEN PACKAGE MANAGER SETTINGS ########


# ghcup-env (Haskell)
[ -f "/home/jamief/.ghcup/env" ] && source "/home/jamief/.ghcup/env"

# opam configuration
[[ ! -r /home/jamief/.opam/opam-init/init.zsh ]] || source /home/jamief/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null


## CONDA
# Update conda
alias conda-update='conda update --name base --channel defaults --yes conda'
alias mamba-update='mamba update --name base --yes mamba'

## MAMBA
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jamief/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jamief/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/jamief/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jamief/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/jamief/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/jamief/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<
