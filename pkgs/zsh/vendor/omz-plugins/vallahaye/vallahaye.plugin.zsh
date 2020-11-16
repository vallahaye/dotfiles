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

# Autoloading Functions
fpath=(~/.zsh.d $fpath)
