#!/usr/bin/env bash
set -euo pipefail

declare -a SCRIPTS=(
	"flv-to-mp4"
	"toalac"
	"tomp4"
	"tomp4hq"
	"tomp4robust"
)

mkdir -p "$HOME/opt/bin"

for fname in "${SCRIPTS[@]}"; do
	set +e
	cp -i "./$fname" "$HOME/opt/bin/$fname"
	set -e
	chmod +x "$HOME/opt/bin/$fname"
done
