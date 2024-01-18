# zinit (plug-in management)
ZINIT_ROOT="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_ROOT ] && zf_mkdir -p "$(dirname $ZINIT_ROOT)"
[ ! -d $ZINIT_ROOT/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_ROOT"
source "${ZINIT_ROOT}/zinit.zsh"

# zinit plugins
zinit_plugins=(
  lucid wait light-mode
    # git aliases (https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
    OMZP::git
    # python aliases (https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract)
    OMZP::python
    # rustc completion (https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/rust)
    OMZP::rust
    # https://github.com/zdharma-continuum/fast-syntax-highlighting
    zdharma-continuum/fast-syntax-highlighting
  lucid depth"1"
  # fancy terminal theme (https://github.com/romkatv/powerlevel10k)
    romkatv/powerlevel10k
)

zinit for "${zinit_plugins[@]}"

