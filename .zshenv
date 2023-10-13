export DEFAULT_USER=jamief

export PATH="${PATH}:$HOME/.local/bin"

# Emacs
export PATH="${PATH}:$HOME/.emacs.d/bin"
export PATH="${PATH}:$HOME/.config/emacs/bin"

# My homebrew scripts
export PATH="${PATH}:$HOME/Dropbox/git/scripts"

# Pyenv
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

# Ruby
export PATH="${PATH}:$HOME/.rbenv/bin"

# Spicetify
export PATH=$PATH:/home/jamief/.spicetify

# XLE
export XLEPATH="/home/jamief/.local/bin/xle"
export PATH=${XLEPATH}/bin:$PATH
export LD_LIBRARY_PATH=${XLEPATH}/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=${XLEPATH}/lib:$DYLD_LIBRARY_PATH
export TCLLIBPATH=${XLEPATH}/tcl/scripts/tcl
export TCL_LIBRARY=${XLEPATH}/tcl/scripts/tcl
export TKLIBPATH=${XLEPATH}/tcl/scripts/tk
export TK_LIBRARY=${XLEPATH}/tcl/scripts/tk
