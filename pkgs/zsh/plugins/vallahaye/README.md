# Documentation

## Aliases

### Zmv

| Alias | Command          | Description                                       |
|-------|------------------|---------------------------------------------------|
| `zmv` | `noglob zmv`     | Move files matching the given pattern             |
| `zcp` | `noglob zmv -C`  | Force `cp` regardless of the name of the function |
| `zln` | `noglob zmv -L`  | Force `ln` regardless of the name of the function |
| `zsy` | `noglob zmv -Ls` | Symbolic, passed down to `ln`                     |

### YouTube-dl

| Alias  | Command | Description |
|--------|---------|-------------|
| `ytdl` | `youtube-dl -o '%(title)s.%(ext)s' -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0` | Download audio from a YouTube video in the best possible quality |

### Docker and Docker Compose

The `docker` and `docker-compose` commands are aliased to `podman` and `podman-compose`
respectively if they are installed.

## Autoloading Functions

The `fpath` variable is set to automatically load the function definitions in `~/.zsh.d`.
