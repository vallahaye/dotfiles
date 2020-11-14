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

# usage: extract <file>
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.bz2) bunzip2 "$1";;
      *.gz) gunzip "$1";;
      *.rar) unrar x "$1";;
      *.tar) tar xf "$1";;
      *.tar.bz2) tar xjf "$1";;
      *.tbz2) tar xjf "$1";;
      *.tar.gz) tar xzf "$1";;
      *.tgz) tar xzf "$1";;
      *.zip) unzip "$1";;
      *.Z) uncompress "$1";;
      *.7z) 7z x "$1";;
      *) echo "'$1' can't be extracted via extract()";;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
