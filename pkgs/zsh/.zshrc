0="${(%):-%N}"

source "${0:A:h}/antigen/antigen.zsh"

zstyle :omz:plugins:ssh-agent agent-forwarding on

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  colored-man-pages
  command-not-found
  docker
  git
  ssh-agent

  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting

  ${0:A:h}/plugins/vallahaye
EOBUNDLES

antigen theme agnoster

antigen apply
