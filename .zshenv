## SOME PATH SETTING FUNCTIONS

# ADD NEW ELEMENTS TO A PATH VARIABLE, AVOIDING DUPLICATES
xpathadd() {
    local VAR="$1"
    local DIR="$2"
    if [ -d "$DIR" ] && [[ ":${(P)VAR}:" != *":$DIR:"* ]]; then
        eval "export $VAR=\"${(P)VAR:+\"\$$VAR:\"}$DIR\""
    fi
}

# SPECIFICALLY, ADD ELEMENTS TO $PATH
pathadd() {
    xpathadd "PATH" "${1}"
}

## OLD VERSION WITH PATH HARD-CODED (from here: https://superuser.com/a/39995)
# pathadd() {
#     if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
#         export PATH="${PATH:+"$PATH:"}$1"
#     fi
# }

# ADD ELEMENTS TO $MANPATH, including a leading colon if $MANPATH is empty, so that we don't overwrite the defaults available from `manpath`.
manadd() {
    # Check if $MANPATH has a value already; if it doesn't, then we add the initial colon before adding the new value
    if [ -n "$MANPATH" ]; then
        xpathadd "MANPATH" "${1}"
    else
        export MANPATH=":${1}"
    fi
}

infoadd() {
    # Check if $INFOPATH has a value already; if it doesn't, then we add the initial colon before adding the new value
    if [ -n "$INFOPATH" ]; then
        xpathadd "INFOPATH" "${1}"
    else
        export INFOPATH=":${1}"
    fi
}

# Some variables
export DEFAULT_USER='jamief'

## ADDING TO $PATH
# local bin file
pathadd "$HOME/.local/bin"

# Emacs
pathadd "$HOME/.emacs.d/bin"
pathadd "$HOME/.config/emacs/bin"

# My homebrew scripts
pathadd "$HOME/Dropbox/git/scripts"
# Running Stanza locally
pathadd "$HOME/stanza-parsing"

# TeX Live
manadd "/usr/local/texlive/2023/texmf-dist/doc/man"
infoadd "/usr/local/texlive/2023/texmf-dist/doc/info"
pathadd "/usr/local/texlive/2023/bin/x86_64-linux"

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

