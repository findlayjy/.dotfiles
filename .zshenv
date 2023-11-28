# For adding to PATH if not already present (from here:
# https://superuser.com/a/39995)
pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Some variables
export DEFAULT_USER='jamief'

## ADDING TO $PATH
pathadd "$HOME/.local/bin"

# Emacs
pathadd "$HOME/.emacs.d/bin"
pathadd "$HOME/.config/emacs/bin"

# My homebrew scripts
pathadd "$HOME/Dropbox/git/scripts"
# Running Stanza locally
pathadd "$HOME/stanza-parsing"

# Pyenv
pathadd "$PYENV_ROOT/bin"
pathadd "$HOME/.pyenv/bin"

# Ruby
pathadd "$HOME/.rbenv/bin"

# Go
pathadd "/usr/local/go/bin"

# Hugo
pathadd "$HOME/hugo"

# Spicetify
pathadd "$HOME/.spicetify"

# XLE
export XLEPATH="/home/jamief/.local/bin/xle"
pathadd "${XLEPATH}/bin"
export LD_LIBRARY_PATH=${XLEPATH}/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${XLEPATH}/lib:$DYLD_LIBRARY_PATH
export TCLLIBPATH=${XLEPATH}/tcl/scripts/tcl
export TCL_LIBRARY=${XLEPATH}/tcl/scripts/tcl
export TKLIBPATH=${XLEPATH}/tcl/scripts/tk
export TK_LIBRARY=${XLEPATH}/tcl/scripts/tk

