#!/bin/sh
# Prüft, dass mstr/index.html der Release-Build aus mbroyer/mstr ist (python3 build.py --release),
# nicht der lesbare Build. Läuft in GitHub Actions bei jedem PR und Push, lokal: sh tools/check-mstr.sh
set -e
F="$(dirname "$0")/../mstr/index.html"
fail(){ echo "FEHLER: $1"; echo "mstr/index.html muss release/index.html aus 'python3 build.py --release' sein, nicht index.html."; exit 1; }
[ -f "$F" ] || fail "Datei fehlt: $F"
head -c 200 "$F" | grep -q 'All rights reserved' || fail "Copyright-Hinweis fehlt am Anfang"
grep -q 'function nativeShare' "$F" && fail "lesbare Funktionsnamen gefunden (nicht verkleinert)"
grep -q "'Describe a beat'\|\"Describe a beat\"" "$F" && fail "lesbare Texte im Code gefunden (nicht verschleiert)"
[ "$(wc -l < "$F")" -le 5 ] || fail "zu viele Zeilen (nicht verkleinert)"
echo "OK: mstr/index.html ist der Release-Build"
