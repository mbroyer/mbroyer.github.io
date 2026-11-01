# mbroyer.github.io
## Apps: nur Release-Builds

Die Apps liegen hier nur als Release-Build (verkleinert, verschleiert, Domain- und iframe-Sperre, Wasserzeichen `data-b`, Copyright-Hinweis), nie als lesbarer Build. Gebaut wird im jeweiligen Quell-Repo:

| Ordner | Quell-Repo | Befehl |
|---|---|---|
| `mstr/` | `mbroyer/mstr` | `python3 build.py --release` |
| `orbista/` | `mbroyer/orbista` | `python3 build.py --release`, dann `python3 web/deploy.py` |
| `numnum/` | `mbroyer/numnum` | `python3 build.py --release`, dann `python3 web/deploy.py` |
| `torquemada/spiel/` | `mbroyer/quartermile` | `python3 web/deploy.py` |
| `vokamon/` | `mbroyer/vokamon` | `python3 web/demo.py`, `node web/verschluesseln.mjs` |
| `readster/` | `mbroyer/readster` | `python3 tools/deploy.py` |

Je App prüft eine GitHub Action (`tools/check-<app>.sh`, gemeinsame Regeln in `tools/check-release.sh`) jeden PR und Push. Schlägt sie fehl, ist der lesbare Build hereingerutscht.
