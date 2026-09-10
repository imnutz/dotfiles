#!/usr/bin/env bash
selected=$(cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qxsF -- "$selected" ~/.tmux-cht-languages; then
    tmux new-window \
        -e "TMUX_CHT_SELECTED=$selected" \
        -e "TMUX_CHT_QUERY=$query" \
        'bash -c '\''query=${TMUX_CHT_QUERY// /+}; url="https://cht.sh/${TMUX_CHT_SELECTED}/${query}/"; printf "curl %s\\n" "$url"; curl "$url"; while :; do sleep 1; done'\'''
else
    tmux new-window \
        -e "TMUX_CHT_SELECTED=$selected" \
        -e "TMUX_CHT_QUERY=$query" \
        'bash -c '\''query=${TMUX_CHT_QUERY// /+}; curl -s -- "https://cht.sh/${TMUX_CHT_SELECTED}~${query}" | less'\'''
fi
