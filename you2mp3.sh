#!/bin/bash
youtube-dl -j --flat-playlist "$1" | jq -r '.id' | sed 's_^_https://youtu.be/_' > result.log
while IFS='' read -r LINE || [ -n "${LINE}" ]; do
    echo "processing line: ${LINE}"
    youtube-dl -q --no-warnings --extract-audio --audio-format mp3 ${LINE}
done < result.log
rm result.log
