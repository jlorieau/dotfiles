# human file sizes
(( ${+commands[df]} )) && alias df="df --human-readable --print-type"
(( ${+commands[du]} )) && alias du="du --human-readable --total"

# listing aliases
(( ${+commands[ls]} )) && alias ll="ls -ahlF"

# syntax highlighting
(( ${+commands[pygmentize]} )) && alias cat="pygmentize -P style=gruvbox-dark"
(( ${+commands[pygmentize]} )) && alias less='LESSOPEN="| pygmentize -O style=gruvbox-dark %s" less -M -R '
(( ${+commands[pygmentize]} )) && alias more='LESSOPEN="| pygmentize -O style=gruvbox-dark %s" less -M -R '
