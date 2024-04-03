# human file sizes
(( ${+commands[df]} )) && alias df="df -h"
(( ${+commands[du]} )) && alias du="du -ch"

# listing aliases
(( ${+commands[ls]} )) && alias ll="ls -ahlF"

# tmux
(( ${+commands[tmux]} )) && {
    alias tmux="tmux -f ${XDG_CONFIG_HOME}/tmux/tmux.conf"
    alias stmux="tmux new-session 'sudo --login'"
}

# mpv aliases
(( ${+commands[mpv]} )) && alias mpvr="find . -atime -24h -type f|xargs mpv"
