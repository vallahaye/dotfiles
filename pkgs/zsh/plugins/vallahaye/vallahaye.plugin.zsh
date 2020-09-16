# zmv
autoload zmv
alias zmv="noglob zmv"
alias zcp="noglob zmv -C"
alias zln="noglob zmv -L"
alias zsy="noglob zmv -Ls"

# YouTube-dl
if (( $+commands[youtube-dl] )); then
  alias ytdl="youtube-dl -o '%(title)s.%(ext)s' -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0"
fi

# Podman
if (( $+commands[podman] )); then
  alias docker="podman"
fi

# Podman Compose
if (( $+commands[podman-compose] )); then
  alias docker-compose="podman-compose"
fi
