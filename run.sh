#!/bin/bash

notify() {
  local title="$1"
  local body="$2"
  printf '\e]777;notify;%s;%s\a' "$title" "$body"
}

ss progress 0.5 レビュー中

docker run --rm -it \
  -e COPILOT_GITHUB_TOKEN="$COPILOT_GITHUB_TOKEN" \
  --tmpfs /home/node/.copilot \
  -v "$HOME/.copilot/session-state:/home/node/.copilot/session-state" \
  -v "$PWD:/work" \
  -w /work \
  safe-copilot-cli \
  copilot --no-auto-update --yolo -p "このリポジトリは何をやっている？"

ss wait
notify "レビューが完了しました"
