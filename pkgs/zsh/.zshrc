_DOTFILES_ZSH_VENDOR_DIR="${${(%):-%N}:A:h}/vendor"
source "$_DOTFILES_ZSH_VENDOR_DIR/antigen/antigen.zsh"

zstyle :omz:plugins:ssh-agent agent-forwarding on

antigen use oh-my-zsh

antigen bundles <<EOF
  colored-man-pages
  colorize
  command-not-found
  docker
  docker-compose
  extract
  git
  git-extras
  ssh-agent

  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting

  $_DOTFILES_ZSH_VENDOR_DIR/omz-plugins/vallahaye
EOF

antigen theme agnoster

antigen apply
