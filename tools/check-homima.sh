#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von homima liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-homima.sh
set -e
cd "$(dirname "$0")/.."
sh tools/check-release.sh homima/index.html 'function renderSuggest' 'Keine Verbindung. Du siehst' 'python3 build.py, dann node tools/release.mjs in mbroyer/homima'
