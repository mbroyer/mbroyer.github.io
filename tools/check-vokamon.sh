#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von vokamon liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-vokamon.sh
set -e
cd "$(dirname "$0")/.."
HOW='python3 web/demo.py und node web/verschluesseln.mjs in mbroyer/vokamon'
sh tools/check-release.sh vokamon/demo.html 'function missingTo' 'Eintippen oder einfügen' "$HOW"
n=0; for f in vokamon/listen-*.html; do sh tools/check-release.sh "$f" 'function missingTo' 'Eintippen oder einfügen' "$HOW"; n=$((n+1)); done
[ $n -eq 1 ] || { echo "FEHLER: genau eine vokamon/listen-*.html erwartet, gefunden: $n"; exit 1; }
