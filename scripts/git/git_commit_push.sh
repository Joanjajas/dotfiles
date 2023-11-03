#!/usr/bin/env sh

message=$*

if [ -z "$message" ]; then
	printf "Commit message: "
	read -r message
fi

git add .
git commit -m "$message"
git push
