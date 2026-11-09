# <Projektname>

Dieses Projekt folgt Marcs AI Engineering Standard (Skill `ai-engineering-standard`). Lade den Skill zu Sitzungsbeginn und halte dich an Ablauf, Nachvollziehbarkeit, Rechtekonzept und Leitplanken. Spezifikationen entstehen mit dem Skill `spec-schreiben`, Prüfungen laufen über den Skill `pruefen`. Für deutsche Texte gilt zusätzlich der Skill `no-slop-marc`.

## Stufe
<Prototyp, Standard oder Produktiv. Ohne Angabe gilt Standard.>

## Produkt
<Drei Sätze. Für wen, welches Problem, was gehört zum MVP und was nicht.>

## Rollen und Rechte
<Wer nutzt das System, in einem Satz pro Rolle. Die volle Rechtematrix steht in `docs/architecture.md`. Falls es keine Rollen gibt, hier festhalten, dass nur Marc das Werkzeug nutzt und kein Login nötig ist.>

## Stack und Befehle
- Stack: <zum Beispiel Next.js, Supabase>
- Starten: `<befehl>`
- Alle Tests: `<befehl>`
- Betroffene Tests: `<befehl>`
- Production-Build oder Startprüfung (bei Stacks ohne Build der Befehl, der beweist, dass die App startet): `<befehl>`
- Benötigte Umgebungsvariablen (nur Namen): <NAME_1, NAME_2>

## Arbeitsweise
Pro Feature gilt Spezifikation, Architektur, Plan, Build, unabhängige Prüfung. Freigaben durch Marc nach Spec, Architektur und Prüfbericht. Vor Freigabe von Spec und Architektur kein Code. Ein Feature, ein Zweig, ein Commit pro erledigter Aufgabe. Commits, Pushes und Deployments nur auf Marcs Wunsch.

Zu Sitzungsbeginn lesen
1. Diese Datei
2. `docs/features.md`
3. Den Plan des aktuellen Features in `docs/plans/`

Dokumente
- `docs/features.md` Status aller Features
- `docs/architecture.md` Gesamtarchitektur, Rechtematrix und Stack-Entscheidungen
- `docs/decisions.md` Entscheidungen mit Begründung und verworfene Ansätze, nicht erneut aufrollen
- `docs/specs/<feature>.md` ein Feature, eine Spec
- `docs/plans/<feature>.md` Aufgaben mit Bezug auf Anforderungs-IDs
- `docs/reports/<feature>.md` Prüfberichte

## Konventionen
- Arbeitssprache Deutsch. «ss» statt «ß», echte Umlaute, keine Gedankenstriche.
- <Benennungen, Ordnerstruktur, Code-Sprache>
- Detailregeln pro Bereich liegen, falls nötig, als Regeldateien (zum Beispiel `.claude/rules/`), nicht hier.

## Nie ohne Rückfrage bei Marc
- Zugangsdaten lesen oder ausgeben
- Git-Historie überschreiben, Datenbanken, Ordner oder Branches löschen
- Auf den Hauptzweig pushen oder deployen
- Neue Abhängigkeiten installieren (zuerst prüfen und in `docs/decisions.md` eintragen)
- <stackspezifische destruktive Befehle>

## Technisch erzwungen
Deny-Regeln, Hooks und geschützte Ordner stehen in `.claude/settings.json` (Bausteine im Skill `projekt-starten`). Diese Datei enthält nur Richtlinien.

## Nur Marc kann
<Dashboard-Einstellungen, API-Keys, Domains. Hier sichtbar halten.>
