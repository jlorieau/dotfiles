# Human file sizes
(( ${+commands[df]} )) && alias df="df --human-readable --print-type"
(( ${+commands[du]} )) && alias du="du --human-readable --total"

# listing aliases
(( ${+commands[ls]} )) && alias alias ll='ls -alF'
