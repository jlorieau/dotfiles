# Only allow unique paths
typeset -U path PATH

# Add custom functions and completions
fpath_custom=${ZDOTDIR}/fpath
fpath=($fpath_custom ${fpath})

# Local paths (add to front)
path=(/usr/local/bin /usr/local/sbin ${path})

if [[ "${OSTYPE}" = darwin* ]]; then
    # Check whether homebrew available under new path (Apple silicon)
    if (( ! ${+commands[brew]} )) && [[ -x /opt/homebrew/bin/brew ]]; then
        path=(/opt/homebrew/bin ${path})
    fi

    if (( ${+commands[brew]} )); then
        eval $(brew shellenv)
    fi
fi

# Enable local binaries and man pages
path=(${HOME}/.local/bin ${path})
# MANPATH="${XDG_DATA_HOME}/man:${MANPATH}"

# Paths for NMRPipe
nmrpipe_locs=('/opt/NMRPipe' '~/NMRPipe')

for nmrpipe_loc in "${nmrpipe_locs[@]}"; do
    if [[ -d $nmrpipe_loc ]]; then
      path+=(${nmrpipe_loc}/nmrbin.linux9/)
      path+=(${nmrpipe_loc}/com/)
      path+=(${nmrpipe_loc}/nmrtxt/)
      path+=(${nmrpipe_loc}/nmrtcl/)
      path+=(${nmrpipe_loc}/dynamo/tcl/)
      path+=(${nmrpipe_loc}/dynamic/com/)
    fi
done
