# Zmv
autoload zmv
alias zmv="noglob zmv"
alias zcp="noglob zmv -C"
alias zln="noglob zmv -L"
alias zsy="noglob zmv -Ls"

# YouTube-dl
alias ytdl="youtube-dl -o '%(title)s.%(ext)s' -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"

# Docker and Docker Compose
if (( $+commands[podman] )); then
  alias docker="podman"
fi

if (( $+commands[podman-compose] )); then
  alias docker-compose="podman-compose"
fi

# Set FPATH so it includes user's functions if it exists
if [[ -d ~/.zsh.d ]]; then
  fpath=(~/.zsh.d $fpath)
fi

# Set PATH so it includes user's private bin if it exists
if [[ -d ~/.local/bin ]]; then
  path=(~/.local/bin $path)
else
  if [[ -d ~/bin ]]; then
    path=(~/bin $path)
  fi
fi
