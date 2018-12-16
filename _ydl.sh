#!/bin/bash
format="%(uploader)s - %(title)s (%(display_id)s, %(height)sp).%(ext)s"
languages=en,de,cs,ru
datetime="$(date +%Y-%m-%d_%H-%M-%S)"

youtube-dl -f "bestvideo[height<=360]" -a _ydl_360p.txt -o "$format" --sub-lang $languages --write-sub --write-auto-sub --embed-subs && mv _ydl_360p.txt _ydl_360p_$datetime.txt && touch _ydl_360p.txt
youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]" --merge-output-format mp4 -a _ydl_720p.txt -o "$format" --sub-lang $languages --write-sub --write-auto-sub --embed-subs && mv _ydl_720p.txt _ydl_720p_$datetime.txt && touch _ydl_720p.txt
youtube-dl -f "bestaudio[ext=m4a]" -a _ydl_mp3.txt -o "$format" -x --audio-format "mp3" && mv _ydl_mp3.txt _ydl_mp3_$datetime.txt && touch _ydl_mp3.txt
