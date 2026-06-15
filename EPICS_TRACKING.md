# Epic & Task Tracking — docs-test

Dieses Repo nutzt GitHub Issues + Labels + Actions für strukturiertes Epic-Tracking.

---

## Schnellstart

### 1. Labels einrichten (einmalig)

```bash
# GitHub CLI installieren falls nötig: brew install gh
gh auth login

chmod +x scripts/setup-labels.sh
./scripts/setup-labels.sh
```

### 2. Erstes Epic erstellen

→ **Issues → New Issue → "Epic" auswählen**

Felder ausfüllen: Titel, Beschreibung, Quartal (z.B. `Q2-2026`), Priorität.  
GitHub setzt automatisch das Label `epic` + das gewählte Quartals-Label.

### 3. Sub-Tasks erstellen

→ **Issues → New Issue → "Task" auswählen**

Referenz auf das Parent-Epic angeben (z.B. `#3`).

### 4. Epics pro Quartal zählen

→ **Actions → "Epics pro Quartal zählen" → Run workflow**

Optional: Jahr eingeben (Standard = aktuelles Jahr).  
Ergebnis erscheint in der Action-Summary als Tabelle.

---

## Label-System

| Label | Bedeutung |
|-------|-----------|
| `epic` | Übergeordnete Initiative |
| `task` | Sub-Task eines Epics |
| `Q1-2026` … `Q4-2027` | Ziel-Quartal |
| `status: backlog / in progress / review / done / blocked` | Aktueller Status |
| `priority: high / medium / low` | Priorität |

---

## Workflow-Action

**Datei:** `.github/workflows/count-epics-per-quarter.yml`

| Trigger | Beschreibung |
|---------|-------------|
| Manuell (`workflow_dispatch`) | Sofort ausführen, optional Jahr angeben |
| Automatisch (jeden Montag 08:00 UTC) | Wöchentlicher Report |

Die Action zählt alle Issues mit Label `epic` + Quartals-Label und gibt eine Tabelle aus:

```
Quartal    | Fertig | Offen | Gesamt
-----------|--------|-------|-------
Q1 2026   |      3 |     1 |      4
Q2 2026   |      0 |     5 |      5
Q3 2026   |      0 |     2 |      2
Q4 2026   |      0 |     0 |      0
-----------|--------|-------|-------
Gesamt     |      3 |     8 |     11
```

---

## Dateistruktur

```
.github/
├── ISSUE_TEMPLATE/
│   ├── epic.yml          # Epic-Formular
│   └── task.yml          # Task-Formular
├── labels.yml            # Label-Definitionen (Referenz)
└── workflows/
    └── count-epics-per-quarter.yml   # Workflow-Action

scripts/
└── setup-labels.sh       # Labels per gh CLI einrichten

EPICS_TRACKING.md         # Diese Datei
```
