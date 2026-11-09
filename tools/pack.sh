#!/usr/bin/env bash
# Packt jeden Skill-Ordner unter skills/ als dist/<name>.skill (ZIP mit Ordner an der Wurzel).
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
for dir in skills/*/; do
  name="$(basename "$dir")"
  rm -f "dist/$name.skill"
  (cd skills && zip -qr "../dist/$name.skill" "$name" -x '*/.DS_Store')
  echo "gepackt dist/$name.skill"
done
