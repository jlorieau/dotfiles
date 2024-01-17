# Determine own path if ZDOTDIR isn't set or home symlink exists
# e.g. ZDOTDIR=~/Code/dotfiles
if [[ -z "${ZDOTDIR}" || -L "${HOME}/.zshenv" ]]; then
    local homezshenv="${HOME}/.zshenv"
    ZDOTDIR="${homezshenv:A:h}"
fi

# Disable global zsh configuration
# We're doing all configuration ourselves
unsetopt GLOBAL_RCS

# Source local env files
for envfile in "${ZDOTDIR}"/env.d/*; do
    source "${envfile}"
done
unset envfile