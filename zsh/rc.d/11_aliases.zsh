# human file sizes
(( ${+commands[df]} )) && alias df="df -h"
(( ${+commands[du]} )) && alias du="du -h"

# listing aliases
(( ${+commands[ls]} )) && alias ll="ls -ahlF"

# mpv aliases
(( ${+commands[mpv]} )) && alias mpvr="find . -cmin -600 -type f|xargs mpv"
