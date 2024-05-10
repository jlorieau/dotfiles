# load zsh compiled modules
zmodload -m -F zsh/files b:zf_\*


# Setup paths for MacOS
if [[ $(uname) == "Darwin" ]]; then
	INIT_SCRIPT_DIR=${0:A:h}
	HATCH_USERDIR="${HOME}/Library/Application Support/hatch/"

	# Create the sublime directory
	zf_mkdir -p "${HATCH_USERDIR}"

	# Create ln to files
	for filename in ${INIT_SCRIPT_DIR}/*; do
		print "    ...create symlink for '${filename}'"
		zf_ln -sf "${filename}" "${HATCH_USERDIR}"
	done
fi
unset INIT_SCRIPT_DIR HATCH_USERDIR filename
