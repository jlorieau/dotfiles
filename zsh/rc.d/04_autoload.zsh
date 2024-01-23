# Autoload functions

# Ensure add-zsh-hook is loaded, as it's used in rc files
autoload -Uz add-zsh-hook

# Ctrl+W stops on path delimiters
autoload -Uz select-word-style
select-word-style bash

# Custom personal functions (bottom)
# ${fpath_custom} is set by env.d/03_paths.zsh
autoload -U ${fpath_custom}/*(.:t)