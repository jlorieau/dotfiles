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
#zf_mkdir -p "${XDG_CONFIG_HOME}"/{matplotlib,}
zf_mkdir -p "${XDG_CACHE_HOME}"/{zsh,}
zf_mkdir -p "${XDG_DATA_HOME}"/{zinit,zsh}
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

# Link configs/secrets files
zf_mkdir -p ./secrets
for configsdir ("configs" "secrets"); do
  print "Processing ${configsdir} directory..."
  configsfiles=(`cd ${configsdir} && find . -type f | sed 's|^./||'`)
  configssubdirs=()
  for configsfile in ${configsfiles}; do
    configssubdirs+=(`dirname ${configsfile}`)
  done

  # Create needed directories and set permissions
  for configssubdir in ${(u)configssubdirs[@]}; do  # iterate array with unique items
    print "  ...create and set permissions for '${XDG_CONFIG_HOME}/${configssubdir}'"
    [ -L ${XDG_CONFIG_HOME}/${configssubdir} ] && rm "${XDG_CONFIG_HOME}/${configssubdir}"
    zf_mkdir -p ${XDG_CONFIG_HOME}/${configssubdir}
    zf_chmod 700 ${XDG_CONFIG_HOME}/${configssubdir}
  done

  # Create symbolic links
  for configsfile in ${configsfiles}; do
    print "  ...create symlink for '${XDG_CONFIG_HOME}/${configsfile}'"
    zf_ln -sf ${SCRIPT_DIR}/${configsdir}/${configsfile} ${XDG_CONFIG_HOME}/${configsfile}
  done

  unset configsdir configsfiles configssubdirs configsubdir
done


# Make sure submodules are installed
print "Syncing submodules..."
git submodule sync > /dev/null
git submodule update --init --recursive > /dev/null
git clean -ffd
print "  ...done"

print "Compiling zsh plugins..."
{
    emulate -LR zsh
    setopt local_options extended_glob
    autoload -Uz zrecompile
    for plugin_file in ${SCRIPT_DIR}/zsh/plugins/**/*.zsh{-theme,}(#q.); do
        zrecompile -pq "${plugin_file}"
    done
}
print "  ...done"

# OS-specific installations and setup
if [[ "$(uname)" == "Darwin" ]]; then  # MacOS
  print "Setting up MacOS dependencies..."

  # Install brew (https://github.com/Homebrew/brew)
  if test ! $(which brew); then
    print "  Installing Homebrew (requires admin permission)..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo
  fi

  # Install items in the Brewfile bundle (see ./Brewfile)
  print "  Installing Brewfile bundle"
  brew tap homebrew/bundle
  brew bundle --file ./Brewfile

fi

# Set correct permissions for dotfiles
print "Setting dotfiles directory permissions..."
chmod -R o-rwx `dirname $0`