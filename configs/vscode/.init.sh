
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

# Install extensions
extensions=(
	# Python IntelliSense (Pylance), Linting, Debugging, code formatting, refactoring,
	ms-python.python
	# A performant, feature-rich language server for Python in VS Code
	ms-python.vscode-pylance
	# Remotely browse and edit any Azure Repos
	ms-vscode.azure-repos
	# Remotely browse and edit git repositories
	ms-vscode.remote-repositories
	# Rust language support for Visual Studio Code
	rust-lang.rust-analyzer
	# Remotely browse and edit any GitHub repository
	GitHub.remotehub
	# Pull Request and Issue Provider for GitHub
	GitHub.vscode-pull-request-github
	# Hard word wrapping for comments and other text at a given column
	stkb.rewrap
	# Easily switch between projects
	alefragnani.project-manager
)

if (( ${+commands[code]} )); then
	for extension in ${extensions}; do
		print "      ...installing VS extension '${extension}'"
		code --install-extension ${extension} >& /dev/null
	done
fi
unset extension extensions