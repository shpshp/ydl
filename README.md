# ydl

youtube-dl cmd convenience script, copyright 2017-2018 (c) by Shp

The script downloads YouTube links from text files in different formats depending in which file it was written to (*720p.txt = best quality available (may be 1080p etc), *360p.txt = middle quality, *mp3.txt = music only: ffmpeg is needed!).

Put some YouTube links into the text files (one link per line), run the script and enjoy!

The latest youtube-dl version is needed. To get it, remove the apt-version and install from github:

```bash
sudo apt remove -y youtube-dl
sudo wget https://yt-dl.org/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+x /usr/local/bin/youtube-dl
hash -r
```

To later update youtube-dl do:

```bash
sudo youtube-dl -U
```

To check formats available for the video:

```bash
youtube-dl -F video_url
```
