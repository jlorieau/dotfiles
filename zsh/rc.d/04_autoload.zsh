# Autoload functions

# Ensure add-zsh-hook is loaded, as it's used in rc files
autoload -Uz add-zsh-hook

# Custom personal functions (bottom)
# ${fpath_custom} is set by env.d/03_paths.zsh
autoload -U ${fpath_custom}/*(.:t)