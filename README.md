# DesktopStreaming
Windows nginx, config, HTML, and basic scripts to get an RTMP server set up with minimal hassle so you can stream your desktop

## Batch scripts

### Start_stream.bat
Starts the nginx service with the provided nginx.conf. Starts ffmpeg with the embedded commandline.

### Stop_stream.bat
Stops the nginx service on Windows, ffmpeg will exit automatically when it can no longer access the RTMP server

## Config

### nginx.conf
Creates an RTMP app and an HLS app to allow for Web stream

## HTML and JS files

### video.html
Provides a basic video player template, has the videojs CDN links already in there, but you can also use the local, minified JS copy

### videojs-contrib-hls.min.js
Contains the JavaScript necessary to render the player. Download the [latest from VideoJS](https://github.com/videojs/videojs-contrib-hls/releases)

## Zip file

### nginx 1.7.11.3 Gryphon.zip
Contains a basic nginx server with the RTMP module built-in
Unzip and copy the contents of conf/ and html/ to their respective directories in the expanded nginx archive

### ffmpeg
Download latest [Windows ffmpeg binaries](https://ffmpeg.zeranoe.com/builds)
Replace the ffmpeg -i video="<your video capture device>" and -i audio="<your audio capture device>"
List your dshow capture devices with "ffmpeg -list_devices true -f dshow -i dummy" 
