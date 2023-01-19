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

echo "Cleaning up scripts renamed in 54d73252..."

declare -a OLDSCRIPTS=(
	"flv-to-mp4"
	"tomp4hq"
	"tomp4robust"
)

for fname in "${OLDSCRIPTS[@]}"; do
	if [ -f "$HOME/opt/bin/$fname" ]; then
		set +e
		rm -i "$HOME/opt/bin/$fname"
		set -e
	fi
done
