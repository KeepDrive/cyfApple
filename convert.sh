#!/bin/bash
if [[ ! -d "pngapple" ]]; then
  mkdir pngapple
fi
if [[ "$(ls -A pngapple 2>/dev/null)" ]]; then
  echo "pngapple folder is not empty, skipping frame extraction"
else
  ffmpeg -i $1 -vf scale="640:480",format=gray pngapple/image-%04d.png
fi
if [[ ! -d "Audio" ]]; then
  mkdir Audio
fi
if [[ -f "Audio/badapple.ogg" ]]; then
  echo "badapple.ogg exists, skipping"
else
  ffmpeg -i $1 -vn Audio/badapple.ogg
fi
if [[ ! -d "Sprites" ]]; then
  mkdir Sprites
fi
if [[ "$(ls -A Sprites 2>/dev/null)" ]]; then
  echo "Sprites folder is not empty, exiting script"
  exit 1
else
  python3 compress.py
fi
