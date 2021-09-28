#! /usr/bin/env bash
ffmpeg -i input_video.mp4 -ss 00:00:30 -t 00:00:10 -c copy cropped.mp4
convert -background none -depth 8 -resize 50% plate.svg plate.png
ffmpeg -i cropped.mp4 -i plate.png -filter_complex "[0:v][1:v]overlay=0:446:enable=between(t\,1\,9)" -c:a copy plated.mp4
ffmpeg -i plated.mp4 -vf drawtext="enable=between(t\,2\,9): fontfile=Arial.ttf: fontsize=36: fontcolor=black: x=200: y=476: text='Some Text!' " -c:a copy result.mp4