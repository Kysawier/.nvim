#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript javascript rust bash" | tr " " "\n")
core_utils=$(echo "test wall watch fold date ncal tail wc reset cp tr sort uniq head bc curl find xargs sed awk" | tr " " "\n")

selected=$(echo -e "$languages\n$core_utils" | fzf)

read -p "GIMMIE YOUR QUERY: " query
if echo "$languages" | grep -qs $selected; then
    tmux split-window -p 32 -h bash -c "curl -s cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else 
    tmux split-window -p 32 -h bash -c "curl -s cht.sh/$selected~$query | less"
fi
