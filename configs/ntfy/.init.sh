
# load zsh compiled modules
zmodload -m -F zsh/files b:zf_\*


# Setup paths for MacOS
if [[ $(uname) == "Darwin" ]]; then
	INIT_SCRIPT_DIR=${0:A:h}
	NTFY_USERDIR="${HOME}/Library/Application Support/ntfy/"

	# Create the sublime directory
	zf_mkdir -p "${NTFY_USERDIR}"

	# Create ln to files
	for filename in ${INIT_SCRIPT_DIR}/*; do
		zf_ln -sf "${filename}" "${NTFY_USERDIR}"
	done
fi
unset INIT_SCRIPT_DIR NTFY_USERDIR filename
