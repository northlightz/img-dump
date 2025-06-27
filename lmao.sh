#!/usr/bin/bash
fname=$(ls -1t '/home/rye/Pictures/Screenshots/' | head -n 1)

cp "/home/rye/Pictures/Screenshots/${fname}" .
git add .
git commit -m "feat: ${fname}"
git push
