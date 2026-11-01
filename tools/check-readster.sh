#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von readster liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-readster.sh
set -e
cd "$(dirname "$0")/.."
HOW='python3 tools/deploy.py in mbroyer/readster'
sh tools/check-release.sh readster/index.html 'function carImg' 'Tippe auf Zuhören' "$HOW"
sh tools/check-release.sh readster/rennen/strip402.html 'function hex2rgb' 'Zuffler Elfer RS' "$HOW"
