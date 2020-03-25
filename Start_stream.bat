@echo off
rem Replace the ffmpeg -i video="<your video capture device>" and -i audio="<your audio capture device>"
rem list your dshow capture devices with "ffmpeg -list_devices true -f dshow -i dummy" 
rem Download latest Windows ffmpeg binaries from ffmpeg.zeranoe.com/builds
title Start Stream
cd /d "<c:\path\to\nginx>"
start nginx
start <c:\path\to\ffmpeg\ffmpeg.exe> -loglevel 0 -thread_queue_size 32768 -f dshow -i video="Game Capture HD60 Pro (Video) (#01)":audio="Game Capture HD60 Pro (Audio) (#01)"  -vcodec libx264 -preset fast -break_non_keyframes 1 -profile:v high444 -x264-params "nal-hrd=cbr" -b:v 260k -acodec aac -b:a 32k -map_metadata -1 -s 1280x720 -f flv rtmp://localhost/show/stream
exit