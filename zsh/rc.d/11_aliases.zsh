# human file sizes
(( ${+commands[df]} )) && alias df="df --human-readable --print-type"
(( ${+commands[du]} )) && alias du="du --human-readable --total"

# listing aliases
(( ${+commands[ls]} )) && alias ll="ls -ahlF"

# mpv aliases
(( ${+commands[mpv]} )) && alias mpvr="find . -cmin -600 -type f|xargs mpv"
