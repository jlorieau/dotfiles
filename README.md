A extensible dotfile configuration with clean XDG paths.
Derived from [z0rc's dotfiles](https://github.com/z0rc/dotfiles/blob/main/zsh/env.d/01_zmodload.zsh).

Features
========
- **No dotfiles manager dependencies**. Free of dotfiles managers--all configuration 
  done by ``deploy.sh``. 
  - Dotfile managers introduce an extra dependancy
  - Dotfile managers commonly require that you place new settings in at least
    two places--in a directory containing the setting and in an initialize file.
    The ``deploy.sh`` script here just symlinks what's available in the
    configs/secrets directories.
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

Supported Configurations
------------------------
Tested on MacOS

- [Visual Studio Code](https://github.com/microsoft/vscode)
- [emacs](https://www.gnu.org/software/emacs/)
- [git](https://git-scm.com)
- [gnupg](https://www.gnupg.org)
- [matplotlib](https://matplotlib.org)
- [mpv](https://mpv.io)
- [python3](https://www.python.org)
- [sublime](https://www.sublimetext.com)

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

Upgrading
=========
Pull the repo and run ``deploy.sh``

```shell
$ git pull
$ ./dploy.sh
```

Plugins and Tools
=================

To install new plugins or tools, run the following command:

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

