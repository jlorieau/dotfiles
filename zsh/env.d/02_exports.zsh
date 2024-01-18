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

# best effort to make tools compliant to XDG basedir spec
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export MPLCONFIGDIR="${XDG_CONFIG_HOME}/matplotlib"
export LESSHISTFILE="${XDG_DATA_HOME}/lesshst"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export WINEPREFIX="${XDG_DATA_HOME}/wine"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export ANSIBLE_LOCAL_TEMP="${XDG_RUNTIME_DIR}/ansible/tmp"
export GOPATH="${XDG_DATA_HOME}/go"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
export GEMRC="${XDG_CONFIG_HOME}/gem/gemrc"
export PERL_CPANM_HOME="${XDG_CACHE_HOME}/cpanm"
export SOLARGRAPH_CACHE="${XDG_CACHE_HOME}/solargraph"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"