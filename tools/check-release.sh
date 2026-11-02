#!/bin/sh
# Gemeinsame Prüfung für die Apps: Datei muss der Release-Build sein (verkleinert, verschleiert, mit Copyright-Hinweis).
# Aufruf: sh tools/check-release.sh <datei> '<lesbarer Funktionsname>' '<lesbarer Text>' '<Bauanleitung>'
F="$1"; FN="$2"; TX="$3"; HOW="$4"
fail(){ echo "FEHLER in $F: $1"; echo "$F muss der Release-Build sein: $HOW"; exit 1; }
[ -f "$F" ] || fail "Datei fehlt"
head -c 300 "$F" | grep -q 'All rights reserved' || fail "Copyright-Hinweis fehlt am Anfang"
grep -q 'data-b' "$F" || fail "Wasserzeichen fehlt"
grep -qF -- "$FN" "$F" && fail "lesbare Funktionsnamen gefunden ($FN, nicht verkleinert)"
grep -qF -- "$TX" "$F" && fail "lesbare Texte im Code gefunden ($TX, nicht verschleiert)"
[ "$(wc -l < "$F")" -le 5 ] || fail "zu viele Zeilen (nicht verkleinert)"
echo "OK: $F ist der Release-Build"
