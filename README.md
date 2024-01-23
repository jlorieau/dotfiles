A extensible dotfile configuration with clean XDG paths.
Derived from [z0rc's dotfiles](https://github.com/z0rc/dotfiles/blob/main/zsh/env.d/01_zmodload.zsh).

Features
========
- **No dotfiles manager dependencies**. Free of dotfiles managers--all configuration 
  done by ``deploy.sh``
- **XDG support**. Files are stored using the 
  [XDG base directory specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).
- **Git submodules, plugins, extensions**. Implementation of arbitrary git repositories 
  as submodules and includes zsh plugins and extensions.
- **Configuration in parts**. Settings loaded in parts from the ``zsh/env.d``, 
  ``zsh/rc.d``, ``zsh/fpath`` and ``zsh/plugins`` directories
- **Secrets configs**. Merged ``configs`` and ``secrets`` subdirectories to store 
  configurations in ``${XDG_CONFIG_HOME}``. The directory structure is created and
  directory permissions are set, and the corrresponding files are symlinked
  from the original directory to merge the contents of both. The ``secrets``
  are excluded from version control.
- **configs .init.sh scripts**. Optional initialization scripts (``.init.sh``) that 
  ``deploy.sh`` runs from within configs/secrets directory. These can create additional 
  symlinks and setup. See, for example,  ``configs/sublime/.init.sh``, which creates 
  additional symlinks for MacOS.

Install
=======
Clone the repo to the desired path

```shell
$ git clone https://github.com/jlorieau/dotfiles <path>
```

Deploy and install the configuration. The ``deploy.sh` script is idempotent.

```shell
$ ./deploy.sh
```

When new files are added in ``configs`` or ``secrets``, the ``deploy.sh`` script
should be run again to create the new symlinks.

Plugins
=======

To install new plugins, run the following command:

```shell
#  git submodule add --force --depth=1 <repo_url> <path> 
$  git submodule add --force --depth=1 https://github.com/romkatv/powerlevel10k zsh/plugins/powerlevel10k 
```

To update the current plugins, run the following command:

```shell
$ git sync
```

To delete a plugin, run the following command:

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

