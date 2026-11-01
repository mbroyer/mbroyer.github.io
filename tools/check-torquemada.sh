#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von torquemada liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-torquemada.sh
set -e
cd "$(dirname "$0")/.."
sh tools/check-release.sh torquemada/spiel/index.html 'function hex2rgb' 'Zuffler Elfer RS' 'python3 web/deploy.py in mbroyer/quartermile'
