
# load zsh compiled modules
zmodload -m -F zsh/files b:zf_\*


# Setup paths for MacOS
if [[ $(uname) == "Darwin" ]]; then
	INIT_SCRIPT_DIR=${0:A:h}
	USERDIR="${HOME}/Library/Application Support/Code/User/"

	# Create the sublime directory
	zf_mkdir -p "${USERDIR}"

	# Create ln to files
	for filename in ${INIT_SCRIPT_DIR}/*; do
		zf_ln -sf "${filename}" "${USERDIR}"
	done
fi
unset INIT_SCRIPT_DIR USERDIR filename
