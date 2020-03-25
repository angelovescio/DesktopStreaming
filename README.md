# DesktopStreaming
Windows nginx, config, HTML, and basic scripts to get an RTMP server set up with minimal hassle so you can stream your desktop

## Batch scripts

### Start_stream.bat
Starts the nginx service with the provided nginx.conf. Starts ffmpeg with the embedded commandline. Change all paths to suit your nginx and ffmpeg locations, if present.

### Stop_stream.bat
Stops the nginx service on Windows, ffmpeg will exit automatically when it can no longer access the RTMP server. Change all paths to suit your nginx and ffmpeg locations, if present.

## Config

### nginx.conf
Creates an RTMP app and an HLS app to allow for Web stream. Change the config paths to reflect where your directories are. Nginx, on Windows, changes the direction of slashes so "C:\Users\user\Downloads" changes to "C:/Users/user/Downloads". If you do not have an "hls" directory, create one under your nginx html directory.

## HTML and JS files

### video.html
Provides a basic video player template, has the videojs CDN links already in there, but you can also use the local, minified JS copy. You just need to change host:port in the file to your nginx hls host and port, specified in nginx.conf

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
For Windows, you can use gdigrab for the Desktop "-f gdigrab -i desktop" and Stereo Mix for the Audio (assuming you have it set up). For Stereo Mix setup go [here](https://appuals.com/how-to-restore-missing-stereo-mix-on-windows-10/). Replace whatever their Conexant drivers are with what your desktop audio supports, i.e. RealTek or other chipset. For a different type of audio tap go to [here](https://mediarealm.com.au/articles/stereo-mix-setup-windows-10/)
ffmpeg documentation on streaming a Desktop is [here](https://trac.ffmpeg.org/wiki/Capture/Desktop)

## Troubleshooting

### I don't know if ffmpeg is working.
Open up the Start_stream.bat file and remove "-loglevel 0". You can also run the ffmpeg command separately, in another cmd window. If you see a "stream.m3u8" file pop up in the "hls" directory, ffmpeg is creating the stream.

### I don't know if nginx is working
Check the error log in "logs". There should be a default one and one configured in nginx.conf. Open a commandline and type "netstat -ano | findstr 9001", replace "9001" with whatever port(s) nginx is configured to run on.

### I think the video.html page is broken
In Chrome, Brave, or Firefox, open up dev tools and look at the Console for errors. Also check the Network tab for any odd web requests. Then look at the Elements tab, and make sure the host:port of your streaming app is set properly. If everything is working otherwise, you should be able to point VLC to the nginx host and RTMP port in your nginx.conf (by default, the provided nginx.conf uses the standard RTMP port). "rtmp://localhost/show/stream" would be an example of a VLC network stream string.

### I want to broadcast over a network
We all do, and this was the entire point. Change your video.html host to your external IP (or domain name, if you have one set up already pointing to that IP). Note: This IP/Domain name will be something outside of your LAN, likely issued to you by your ISP hence the word "external". Forward the hls application port through your router. Follow whatever instructions are available for your particulare router. Most router admin pages call it "Single port forward". Put the internal IP of your nginx server as the destination IP and the port as the hls port in your nginx.conf. If your server is running on 192.168.1.5, and the hls application port (from nginx.conf) is 9001, you would (in your router config) put 9001 as the port to forward and 192.168.1.5 as the destination.