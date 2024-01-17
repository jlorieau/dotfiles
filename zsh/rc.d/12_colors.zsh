# Colors for different CLIs
alias ls="ls --color=auto"
(( ${+commands[grep]} )) && alias grep="grep --color=auto --binary-files=without-match --devices=skip"