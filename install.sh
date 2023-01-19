#!/usr/bin/env bash
set -euo pipefail

declare -a SCRIPTS=(
	"flv2mp4"
	"toalac"
	"tom4a"
	"tomp4"
	"tomp4-hq"
	"tomp4-robust"
	"topng"
)

mkdir -p "$HOME/opt/bin"

for fname in "${SCRIPTS[@]}"; do
	set +e
	cp -i "./$fname" "$HOME/opt/bin/$fname"
	set -e
	chmod +x "$HOME/opt/bin/$fname"
done
