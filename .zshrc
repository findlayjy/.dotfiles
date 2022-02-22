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
alias sr="source ~/.zshrc"
# Edit .zshrc file
alias er="vim ~/.zshrc"

# TERMINAL STUFF
# Colorize the ls output 
alias ls='ls --color=auto'
# Use a long listing format
alias ll='ls -la'
# Show hidden files
alias l.='ls -d .*'

# OTHER PROGRAMS
# Make it easier to open emacs clients
alias emax='emacsclient -nc'

# UiO STUFF
# Switch to local UNLU project dir
alias unlu-l="cd ~/Dropbox/academic/jobs/oslo-unlu-postdoc/project"
# Switch to remote UNLU dir containing github repos
alias unlu-r="cd ~/foni/unlu/git-repos"
# Login to foni server and switch to zsh
alias foni="ssh jamief@foni.uio.no -t '/bin/zsh'"
# Mount/unmount remote drive on foni server
alias foni-mont="sshfs jamief@foni.uio.no: ~/foni"
alias foni-umnt="fusermount3 -u ~/foni"
# Run UNLU pipeline (runs in a subshell so you stay in your current directory; also assumes foni drive is mounted)
pipeline() {
	(cd ~/foni/unlu/git-repos/container && ./run_pipeline.sh ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/heads.dat  ~/foni/unlu/git-repos/glue-for-UD/chopRules.dat)
}

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
