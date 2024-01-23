
# load zsh compiled modules
zmodload -m -F zsh/files b:zf_\*


# Setup paths for MacOS
if [[ $(uname) == "Darwin" ]]; then
	INIT_SCRIPT_DIR=${0:A:h}
	SUBLIME_USERDIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User/"

	# Create the sublime directory
	zf_mkdir -p "${SUBLIME_USERDIR}"

	# Create ln to files
	for filename in ${INIT_SCRIPT_DIR}/*; do
		zf_ln -sf "${filename}" "${SUBLIME_USERDIR}"
	done
fi
unset INIT_SCRIPT_DIR SUBLIME_USERDIR filename
