#!/bin/bash

#load the youtube lists URLs to $LINES
youtube-dl -j --flat-playlist "$1" | jq -r '.id' | sed 's_^_https://youtu.be/_' > result.log
readarray -t LINES < "result.log"
rm result.log

for LINE in "${LINES[@]}"; do
    youtube-dl -q --no-warnings $LINE
    INFILE="`ls -1cr | tail -n 1`"
    ffmpeg -loglevel quiet -i "$INFILE" "${INFILE%.*}.mp3"
    OUTFILE="`ls -1cr | tail -n 1`"
    unlink "$INFILE"
    echo $OUTFILE
done

