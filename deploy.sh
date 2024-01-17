#!/usr/bin/env zsh

# Modified from https://github.com/z0rc/dotfiles

# Exit script if any command returns a non-successful error code
set -e

# load zsh compiled modules
zmodload -m -F zsh/files b:zf_\*

# Get the current path
SCRIPT_DIR="${0:A:h}"
cd ${SCRIPT_DIR}

# Default XDG paths (https://wiki.archlinux.org/title/XDG_Base_Directory)
XDG_CONFIG_HOME="${HOME}/.config"  # user configurations (analogous to /etc)
XDG_CACHE_HOME="${HOME}/.cache"  # user non-essential (cached) data (analogous to /var/cache)
XDG_DATA_HOME="${HOME}/.local/share"  # user data files (analogous to /usr/share)
XDG_STATE_HOME="${HOME}/.local/state"  # user state files (analogous to /var/lib)

# Create required directories
print "Creating required directory tree..."
zf_mkdir -p "${XDG_CONFIG_HOME}"/{matplotlib,}
zf_mkdir -p "${XDG_CACHE_HOME}"/{zsh,}
zf_mkdir -p "${XDG_DATA_HOME}"/{zinit,}
zf_mkdir -p "${XDG_STATE_HOME}"
zf_mkdir -p "${HOME}"/.local/{bin,etc}
print "  ...done"

# Link zshenv if needed, which sets ZDOTDIR
print "Checking for ZDOTDIR env variable..."
if [[ "${ZDOTDIR}" = "${SCRIPT_DIR}/zsh" ]]; then
    print "  ...present and valid, skipping .zshenv symlink"
else
    ln -sf "${SCRIPT_DIR}/zsh/.zshenv" "${ZDOTDIR:-${HOME}}/.zshenv"
    print "  ...failed to match this script dir, symlinking .zshenv"
fi

# Link config files
print "Linking config files..."
for conffile in "${SCRIPT_DIR}"/configs/*; do
    zf_ln -sf "${conffile}" "${XDG_CONFIG_HOME}"
    print "  ...linking ${conffile}"
done
unset conffile

# Link secret config files
print "Linking secret config files..."
for conffile in "${SCRIPT_DIR}"/secrets/*; do
    zf_ln -sf "${conffile}" "${XDG_CONFIG_HOME}"
    print "  ...linking ${conffile}"
done
unset conffile