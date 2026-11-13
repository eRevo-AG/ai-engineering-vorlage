# Git, parallele Arbeit, Livegang

Regelt das Projekt diese Punkte selbst (AGENTS.md, eigener Skill, CI), gelten dessen Regeln.

## Git

- Ein Feature, ein Zweig. Nie direkt auf den Hauptzweig, nie Force-Push auf geteilte Zweige.
- Kleine Commits, die Spec-ID in der Nachricht. Ein Pull Request pro Feature mit Verweis auf Spec und Prüfbericht.
- Der Hauptzweig bleibt lauffähig. Angewendete Migrationen werden nie geändert, es gibt eine neue.
- Vor dem Pull Request den Hauptzweig einbringen und die Prüfbefehle des Projekts laufen lassen.

## Parallele Sitzungen

- Jede Sitzung arbeitet in einem eigenen Zweig und einer eigenen Arbeitskopie (Worktree).
- Parallel läuft nur, was verschiedene Dateien betrifft. Fortlaufende Nummern in Dateinamen vermeiden, weil parallele Zweige dieselbe Nummer vergeben.
- Mehr Sitzungen verbrauchen das Nutzungslimit schneller.

## Livegang (Stufe Produktiv)

Offene Punkte als Liste an die Projektleitung.

- Prüfberichte der enthaltenen Features freigegeben
- Production-Build läuft, alle Tests grün mit Anzahl
- Umgebungsvariablen der Produktion gesetzt (Namen abgleichen, Werte nicht lesen)
- Rechte mit je einem Testkonto pro Rolle geprüft
- Datenschutz geklärt (welche Daten, wo, wie lange, Löschung, Hinweis für Nutzer). Keine Rechtsberatung.
- Backup eingerichtet und Wiederherstellung einmal getestet
- Fehler-Tracking aktiv, keine Passwörter oder Personendaten in Logs
- Schutz gegen Ausprobieren von Passwörtern, Rate-Limits für öffentliche Schnittstellen
- Abhängigkeiten gescannt, Lizenzen geklärt
- Kostenlimits und Budgetalarme gesetzt
- Rückweg (Rollback) beschrieben
- Was nur die Projektleitung erledigen kann (Domains, DNS, Schlüssel), ist erledigt
