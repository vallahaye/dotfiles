# vallahaye plugin

## Features

#### zmv

| Alias | Command        | Description                                       |
|-------|----------------|---------------------------------------------------|
| zmv   | noglob zmv     | Move files matching the given pattern             |
| zcp   | noglob zmv -C  | Force `cp` regardless of the name of the function |
| zln   | noglob zmv -L  | Force `ln` regardless of the name of the function |
| zsy   | noglob zmv -Ls | Symbolic, passed down to `ln`                     |

#### YouTube-dl

| Alias | Command                                                                                             | Description                                                           |
|-------|-----------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| ytdl  | youtube-dl -o '%(title)s.%(ext)s' -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 | Download the audio of a YouTube video in the best quality as possible |
