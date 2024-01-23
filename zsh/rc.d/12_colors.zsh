# Colors for different CLIs
alias ls="ls --color=auto"
(( $+commands[grep] )) && alias grep="grep --color=auto --binary-files=without-match --devices=skip"

# bat colorization
if (( $+commands[bat] )); then
	# -h/--help colorizer
	alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
	alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

	# man colorizer
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi
