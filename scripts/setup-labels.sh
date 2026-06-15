#!/usr/bin/env bash
# ============================================================
# setup-labels.sh
# Erstellt alle Labels im GitHub-Repo per gh CLI.
#
# Voraussetzung: GitHub CLI installiert & authentifiziert
#   brew install gh && gh auth login
#
# Verwendung:
#   chmod +x scripts/setup-labels.sh
#   ./scripts/setup-labels.sh
#
# Optionales Argument: REPO (Standard: aktuelles Repo)
#   ./scripts/setup-labels.sh owner/repo-name
# ============================================================

set -euo pipefail

REPO="${1:-}"
GH_FLAGS=""
if [ -n "$REPO" ]; then
  GH_FLAGS="--repo $REPO"
fi

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  echo "  → $name"
  gh label create "$name" \
    --color "$color" \
    --description "$description" \
    --force \
    $GH_FLAGS
}

echo "🏷️  Labels einrichten..."
echo ""

echo "▶ Typ-Labels"
create_label "epic"  "7B68EE" "Größeres Feature oder Initiative"
create_label "task"  "4A90D9" "Sub-Task eines Epics"

echo ""
echo "▶ Status-Labels"
create_label "status: backlog"     "EDEDED" "Noch nicht gestartet"
create_label "status: in progress" "FFA500" "In Bearbeitung"
create_label "status: review"      "9B59B6" "Im Review"
create_label "status: done"        "27AE60" "Abgeschlossen"
create_label "status: blocked"     "E74C3C" "Blockiert"

echo ""
echo "▶ Prioritäts-Labels"
create_label "priority: high"   "E74C3C" "Hohe Priorität"
create_label "priority: medium" "F39C12" "Mittlere Priorität"
create_label "priority: low"    "27AE60" "Niedrige Priorität"

echo ""
echo "▶ Quartals-Labels 2026"
create_label "Q1-2026" "D4E6F1" "Quartal 1 2026 (Jan–Mär)"
create_label "Q2-2026" "A9CCE3" "Quartal 2 2026 (Apr–Jun)"
create_label "Q3-2026" "7FB3D3" "Quartal 3 2026 (Jul–Sep)"
create_label "Q4-2026" "5499C7" "Quartal 4 2026 (Okt–Dez)"

echo ""
echo "▶ Quartals-Labels 2027"
create_label "Q1-2027" "D5F5E3" "Quartal 1 2027 (Jan–Mär)"
create_label "Q2-2027" "A9DFBF" "Quartal 2 2027 (Apr–Jun)"
create_label "Q3-2027" "7DCEA0" "Quartal 3 2027 (Jul–Sep)"
create_label "Q4-2027" "52BE80" "Quartal 4 2027 (Okt–Dez)"

echo ""
echo "✅ Alle Labels erfolgreich erstellt!"
