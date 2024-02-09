# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# MacOS specific keybindings
if [[ "${OSTYPE}" = darwin* || ${OSTYPE} = freebsd* ]]; then
  bindkey "^[[3~" delete-char
fi