#!/usr/bin/bash
oldestfile=$(ls -1t '/home/rye/Pictures/Screenshots/' | tail -n 1)
filecount=$($(ls -1 | wc -l)-1)

if [$filecount -le 10]; then
	rm -f $oldestfile
fi

fname=$(ls -1t '/home/rye/Pictures/Screenshots/' | head -n 1)

cp "/home/rye/Pictures/Screenshots/${fname}" .
git add .
git commit -m "feat: ${fname}"
git push

sleep 3
urlfname=$(printf "${fname}" | jq -sRr @uri)
echo "https://raw.githubusercontent.com/northlightz/img-dump/refs/heads/main/${urlfname}" | wl-copy
