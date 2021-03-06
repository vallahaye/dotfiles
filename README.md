<img src="https://dotfiles.github.io/images/dotfiles-logo.png" width="250" title="Dotfiles Logo">

Configuration files for Emacs, Git, ZSH and more...

## Managing the dotfiles 

[GNU Make](https://www.gnu.org/software/make/) and [GNU Stow](https://www.gnu.org/software/stow/)
`2.2.2` or newer are required to manage the dotfiles.

Run the following commands to install the dotfiles:

```console
$ cd ~
$ git clone --recurse-submodules https://github.com/vallahaye/dotfiles.git .dotfiles
$ cd .dotfiles
$ make install
```

Run the following `make` command to install a specific set of packages:

```console
$ make PACKAGES="git zsh" install
```

Run the following commands to uninstall the dotfiles:

```console
$ cd ~/.dotfiles
$ make uninstall
```

## GitHub does dotfiles

Why would I want my dotfiles on GitHub?

- **_Backup_**, **_restore_**, and **_sync_** the prefs and settings for your toolbox. Your
dotfiles might be the most important files on your machine.
- **_Learn_** from the community. Discover new tools for your toolbox and new tricks for the ones
you already use.
- **_Share_** what you’ve learned with the rest of us.

More informations here: [GitHub does dotfiles](https://dotfiles.github.io/)
