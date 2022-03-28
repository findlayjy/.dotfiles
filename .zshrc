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

# WSL STUFF
# Copy To Windows (i.e. copy file to Windows Downloads folder)
ctw(){cp "$1" /mnt/c/Users/Jamie/Downloads}
# Move to Windows (i.e. move tile to Windows Downloads folder)
mtw(){cp "$1" /mnt/c/Users/Jamie/Downloads}

# UNLU STUFF
# Switch to local UNLU project dir
alias unlu-l="cd ~/Dropbox/academic/jobs/oslo-unlu-postdoc/project/git-repos/glue-for-UD"
# Switch to remote UNLU dir containing github repos
alias unlu-r="cd ~/foni/unlu/git-repos/glue-for-UD"
# Login to foni server and switch to zsh
# alias foni="ssh jamief@foni.uio.no -t '/bin/zsh'"
alias foni="ssh jamief@foni.uio.no -J jamief@login.uio.no -t '/bin/zsh'"
# Mount/unmount remote drive on foni server
# alias foni-mnt="sshfs jamief@foni.uio.no: ~/foni"
alias foni-mnt="sshfs jamief@foni.uio.no: ~/foni -o ssh_command='ssh -J jamief@login.uio.no'"
alias foni-umnt="fusermount3 -u ~/foni"
# Run UNLU pipeline (runs in a subshell so you stay in your current directory; also assumes foni drive is mounted)
RULESFILE="heads.dat"

# Without full log info
pipeline() {
	(cd ~/foni/unlu/git-repos/container && ./run_pipeline.sh ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/$RULESFILE  ~/foni/unlu/git-repos/glue-for-UD/chopRules.dat 2> /dev/null)
}
# With full log info
pipeline-verbose() {
	(cd ~/foni/unlu/git-repos/container && ./run_pipeline.sh ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/$RULESFILE  ~/foni/unlu/git-repos/glue-for-UD/chopRules.dat)
}
# With explanation
pipeline-explain() {
	(cd ~/foni/unlu/git-repos/container && ./run_pipeline.sh -e ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/$RULESFILE  ~/foni/unlu/git-repos/glue-for-UD/chopRules.dat)
}
# Output to a file called 'output' for comparison
pipeline-compare() {
	(cd ~/foni/unlu/git-repos/container && ./run_pipeline.sh -o ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/heads.dat  ~/foni/unlu/git-repos/glue-for-UD/chopRules.dat 1> ~/foni/unlu/git-repos/glue-for-UD/output 2> /dev/null)
}

# Compare results
compare-results() {
(cd ~/foni/unlu/git-repos/container &&  python compare_results.py ~/foni/unlu/git-repos/glue-for-UD/"$1" ~/foni/unlu/git-repos/glue-for-UD/test.conllu.output >~/foni/unlu/git-repos/glue-for-UD/comparison 2>~/foni/unlu/git-repos/glue-for-UD/log)
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

## PYENV (run different versions of Python)
# setup
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

## Initialising git-subrepo (https://github.com/ingydotnet/git-subrepo)
# source ~/git-subrepo/.rc
