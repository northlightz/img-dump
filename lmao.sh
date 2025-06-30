#!/usr/bin/env bash
set -euo pipefail

screenshot_dir="/home/rye/Pictures/Screenshots"
target_dir="."
max_files=10

mapfile -t screenshots < <(ls -1t "$screenshot_dir")

## I assume you might also want to do this recursively till there is <= 10 files in the dir. not JUST delete the last one
filecount=$(find "$target_dir" -maxdepth 1 -type f | wc -l)
if (( filecount > max_files )); then
  oldest="${screenshots[-1]}"
  rm -f "$screenshot_dir/$oldest"
  echo "removed file $oldest"
fi

newest="${screenshots[0]}"
cp "$screenshot_dir/$newest" "$target_dir"

git add "$newest"
git commit -m "feat: ${newest}"
git push

urlfname=$(printf "%s" "$newest" | jq -sRr @uri)
echo "https://raw.githubusercontent.com/northlightz/img-dump/refs/heads/main/${urlfname}" | wl-copy
