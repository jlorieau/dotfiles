A extensible dotfile configuration with clean XDG paths.
Derived from [z0rc's dotfiles](https://github.com/z0rc/dotfiles/blob/main/zsh/env.d/01_zmodload.zsh).

Install
=======
Clone the repo to the desired path

```shell
$ git clone https://github.com/jlorieau/dotfiles <path>
```

Deploy and install the configuration.

```shell
$ ./deploy.sh
```

Plugins
=======

Install
-------

```shell
#  git submodule add --force --depth=1 <repo_url> <path> 
$  git submodule add --force --depth=1 https://github.com/romkatv/powerlevel10k zsh/plugins/powerlevel10k 
```

Update
------

```shell
$ git sync
```

Delete
------

```shell
$ git submodule rm -f <path>
```

Structure
=========

``config/``
: Application configurations. Stored in `${XDG_CONFIG_HOME}` (`~/.config`)

``secrets/``
: Secret application configurations. These entries are not version controlled. Stored in `${XDG_CONFIG_HOME}` (`~/.config`)

``zsh/``
: Zsh Scripts and plugins.

``zsh/env.d``
: Zsh environment variables and early settings

``zsh/fpath``
: Zsh custom functions

``zsh/plugins``
: Zsh plugins stored as git submodules

``zsh/rc.d``
: Zsh and plugin configuration.

