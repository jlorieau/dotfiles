# Preferred editor and pager
export EDITOR=vim
export PAGER=less

# XDG basedir spec compliance
if [[ ! -v XDG_CONFIG_HOME ]]; then
    export XDG_CONFIG_HOME"=${HOME}/.config"
fi
if [[ ! -v XDG_CACHE_HOME ]]; then
    export XDG_CACHE_HOME="${HOME}/.cache"
fi
if [[ ! -v XDG_DATA_HOME ]]; then
    export XDG_DATA_HOME="${HOME}/.local/share"
fi
if [[ ! -v XDG_STATE_HOME ]]; then
    export XDG_STATE_HOME="${HOME}/.local/state"
fi
if [[ ! -v XDG_RUNTIME_DIR ]]; then
    export XDG_RUNTIME_DIR="${TMPDIR:-/tmp}/runtime-${USER}"
fi

# Load NMRPipe environment variables
nmrpipe_locs=('/opt/NMRPipe' '~/NMRPipe')

for nmrpipe_loc in "${nmrpipe_locs[@]}"; do
    if [[ -d $nmrpipe_loc ]]; then
       export NMR_IO_TIMEOUT=0
       export NMR_IO_SELECT=0

       export NMR_CHECKARGS=ALL
       export NMR_FSCHECK=NO
       export NMRBASE=$nmrpipe_loc
       export NMRBINTYPE=mac11_64
       export NMRTXT=${nmrpipe_loc}/nmrtxt
       export NMRBIN=${nmrpipe_loc}/nmrbin.mac11_64
       export TCLPATH=${nmrpipe_loc}/com
       export TALOS_DIR=${nmrpipe_loc}/talos
       export TALOSP_DIR=${nmrpipe_loc}/talosplus
       export TALOSN_DIR=${nmrpipe_loc}/talosn
       export SPARTAP_DIR=${nmrpipe_loc}/spartaplus
       export PROMEGA_DIR=${nmrpipe_loc}/promega

       export NMR_TCLTK8=TRUE
       export TCL_LIBRARY=${nmrpipe_loc}/nmrtcl/tcl8.4
       export TK_LIBRARY=${nmrpipe_loc}/nmrtcl/tk8.4
       export BLT_LIBRARY=${nmrpipe_loc}/nmrtcl/blt2.4
       export NMRPIPE_TCL_LIB=${nmrpipe_loc}/nmrtcl/tcl8.4
       export NMRPIPE_TK_LIB=${nmrpipe_loc}/nmrtcl/tk8.4
       export NMRPIPE_BLT_LIB=${nmrpipe_loc}/nmrtcl/blt2.4

       export PATH=${nmrpipe_loc}/nmrbin.mac11_64:${PATH}
       export LD_LIBRARY_PATH=/opt/X11/lib/flat_namespace:${nmrpipe_loc}/nmrbin.mac11_64/lib:${LD_LIBRARY_PATH}
    fi
done

# Disable zsh sessions used by MacOS
export SHELL_SESSIONS_DISABLE=1

# Enable terminal colors and customize colors
export CLICOLOR=1

# The following codes are used by LSCOLORS
# a     black
# b     red
# c     green
# d     brown
# e     blue
# f     magenta
# g     cyan
# h     light grey
# A     bold black, usually shows up as dark grey
# B     bold red
# C     bold green
# D     bold brown, usually shows up as yellow
# E     bold blue
# F     bold magenta
# G     bold cyan
# H     bold light grey; looks like bright white
# x     default foreground or background
#
# The order of attributes is as follows:
# 1.   directory
# 2.   symbolic link
# 3.   socket
# 4.   pipe
# 5.   executable
# 6.   block special
# 7.   character special
# 8.   executable with setuid bit set
# 9.   executable with setgid bit set
# 10.  directory writable to others, with sticky bit
# 11.  directory writable to others, without sticky bit
export LSCOLORS="ExGxcxdxcxegedabagacad"

# best effort to make tools compliant to XDG basedir spec
export ANSIBLE_LOCAL_TEMP="${XDG_RUNTIME_DIR}/ansible/tmp"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export GOPATH="${XDG_DATA_HOME}/go"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export LESSHISTFILE="${XDG_DATA_HOME}/lesshst"
export MPLCONFIGDIR="${XDG_CONFIG_HOME}/matplotlib"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export PERL_CPANM_HOME="${XDG_CACHE_HOME}/cpanm"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonstartup.py"
export SOLARGRAPH_CACHE="${XDG_CACHE_HOME}/solargraph"
export WINEPREFIX="${XDG_DATA_HOME}/wine"