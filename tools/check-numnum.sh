#!/bin/sh
# Prüft, dass auf der Website nur der Release-Build von numnum liegt, nie der lesbare Build.
# Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-numnum.sh
set -e
cd "$(dirname "$0")/.."
sh tools/check-release.sh numnum/app.html 'function tasksFor' 'Num ist auf der höchsten Stufe' 'python3 build.py --release und python3 web/deploy.py in mbroyer/numnum'
