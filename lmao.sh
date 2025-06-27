!#/usr/bin/bash
$fname = ls -1t ~/Pictures/Screenshots/ | head -n 1

cp ~/Pictures/Screenshots/${fname} .
git add .
git commit -m "feat: ${fname}"
git push
