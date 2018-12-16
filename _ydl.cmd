@echo off
setlocal ENABLEDELAYEDEXPANSION

set format=%%(uploader)s - %%(title)s (%%(display_id)s, %%(height)sp).%%(ext)s
set languages=en,de,cs,ru

for /f "tokens=*" %%s in ('date /t') do (
  set year=%%s
  set year=!year:~6,4!
  set month=%%s
  set month=!month:~3,2!
  set day=%%s
  set day=!day:~0,2!
)

for /f "tokens=*" %%s in ('time /t') do (
  set hour=%%s
  set hour=!hour:~0,2!
  set minute=%%s
  set minute=!minute:~3,2!
)

set datetime=%year%-%month%-%day%_%hour%-%minute%

youtube-dl -f "mp4[height<=360]" -a _ydl_360p.txt -o "%format%" --sub-lang %languages% --write-sub --write-auto-sub --embed-subs && rename _ydl_360p.txt _ydl_360p_%datetime%.txt && echo.>>_ydl_360p.txt
youtube-dl -f "bestvideo[height>=720][ext=mp4]+bestaudio[ext=m4a]" -a _ydl_720p.txt -o "%format%" --sub-lang %languages% --write-sub --write-auto-sub --embed-subs && rename _ydl_720p.txt _ydl_720p_%datetime%.txt && echo.>> _ydl_720p.txt
youtube-dl -f "bestaudio[ext=m4a]" -a _ydl_mp3.txt -o "%format%" -x --audio-format "mp3" && rename _ydl_mp3.txt _ydl_mp3_%datetime%.txt && echo.>> _ydl_mp3.txt
