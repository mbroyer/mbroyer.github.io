#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von orbista liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-orbista.sh
set -e
cd "$(dirname "$0")/.."
sh tools/check-release.sh orbista/app.html 'function autoPlan' 'Heute neu auf der Karte' 'python3 build.py --release und python3 web/deploy.py in mbroyer/orbista'
