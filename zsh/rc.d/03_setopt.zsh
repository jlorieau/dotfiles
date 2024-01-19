setopt HIST_IGNORE_ALL_DUPS  # remove all earlier duplicate lines
setopt SHARE_HISTORY  # import new commands from the history file also in other zsh-session
setopt HIST_REDUCE_BLANKS  # trim multiple insgnificant blanks in history
setopt HIST_IGNORE_SPACE  # don’t store lines starting with space
unsetopt BEEP  # do not beep on errors
unsetopt NOMATCH  # try to avoid the 'zsh: no matches found...'
