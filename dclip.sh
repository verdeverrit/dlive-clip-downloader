#!/bin/bash
links=()
for a in "$*"; do 
	links+=($a)
done
for i in ${links[@]}; do
	l=$(echo $i | sed 's/.*\///g')
	echo "FETCHING $l"
	curl --silent $i | sed 's/</\n/g' | grep mp4 | head -n1 | sed 's/^.*https/https/;s/".*//' | xargs curl --progress-bar -O
done
echo "DONE"
