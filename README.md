# you2mp3.sh
Bash script to download a youtube playlist directly to mp3

First you need to install some tools

http://ytdl-org.github.io/youtube-dl/download.html

sudo apt autoinstall sed jq youtube-dl ffmpeg

Then you create an empty directory for the new playlist

mkdir playlist
cd playlist

copy the playlist's list variable (https://www.youtube.com/watch?v=XXXXXXXXXXX&list= LISTLISTLISTL &start_radio=1)

./you2mp3.sh LISTLISTLISTL
