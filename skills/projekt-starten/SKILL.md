---
name: projekt-starten
description: Setzt ein neues Coding-Projekt auf, mit einer einzigen Fragerunde (Stufe, Rollen, Stack, Daten), und legt CLAUDE.md, Dokumente, Schutzregeln und Regeln nach Bereich an. Verwende ihn, wenn jemand ein neues Projekt, eine neue App oder ein neues Repository beginnt oder ein Ordner noch kein Gerüst hat. Nicht für Projekte mit bestehendem Code, dafür gibt es projekt-analysieren.
---

# Projekt starten

Legt das Gerüst an, mit dem jede Sitzung dasselbe Wissen hat. Findest du bestehenden Code, stoppe und nutze `projekt-analysieren`. Überschreibe nichts Vorhandenes.

## Eine Fragerunde

Nimm aus der Nachricht der Projektleitung, was schon dasteht (Produkt, Stack). Frage nur, was fehlt, in einer Runde mit höchstens vier Auswahlfragen, die Empfehlung zuerst.

- Stufe: Standard (empfohlen), Prototyp, Produktiv
- Wer nutzt es: «Nur ich, kein Login», «Team mit gleichen Rechten», «Mehrere Rollen», «Öffentliche Besucher und angemeldete Nutzer»
- Stack: «Ich nenne ihn», «Schlag einen vor»
- Daten: «Keine personenbezogenen», «Personenbezogene», «Besonders schützenswerte»

Alles Weitere nimmst du an und kennzeichnest es mit «(Vorschlag)»: Rollennamen und grobe Rechte, Anmeldung per E-Mail und Passwort, Oberfläche Deutsch (Schweiz), Projektname aus dem Produkttext. Die Projektleitung korrigiert es in der Abschlussfreigabe. Im Prototyp genügen Stufe und ein Satz zum Produkt.

## Anlegen

Ist der Ordner kein Git-Repository, führe `git init -b main` aus. Offenes bleibt als `<…>` stehen.

- `CLAUDE.md` nach `assets/projekt-CLAUDE.md`. Trage in der Zeile `Projektleitung` die Person ein, mit der du arbeitest, falls ihr Name bekannt ist. Sonst entfällt die Zeile, und es gilt, wer mit dem Agenten arbeitet. Nur was bei jeder Aufgabe gilt: Produkt, Stufe, Stack, Befehle, Konventionen, Verbote. Kein Verzeichnisbaum, nichts aus dem README, nicht mit `/init` erzeugen. Bei mehreren Coding Agents steht der Inhalt in `AGENTS.md`, und die CLAUDE.md enthält nur `@AGENTS.md`.
- `docs/features.md`, `docs/architecture.md` (mit Rechtematrix als Vorschlag) und `docs/decisions.md` (Stack als erster Eintrag) nach den Vorlagen in `assets/`
- `docs/specs/` und `docs/reports/` als leere Ordner
- `.claude/settings.json` nach `assets/settings.basis.json`. Sie enthält nur Schutzregeln und gilt sofort. Ergänze Allow-Einträge nur für bekannte, harmlose Befehle (Test, Typecheck, Lint).
- `.claude/rules/` mit `assets/rules/specs.md` und `assets/rules/tests.md`. Passe die Pfade in `tests.md` an den Stack an.
- `.gitignore` mit `.env`, `.env.*`, `secrets/`, `.claude/settings.local.json`, den üblichen Einträgen des Stacks und bei Personendaten lokalen Datendateien

Erst später, als Aufgabe im ersten Feature
- Stop-Hook (`assets/stop-hook.snippet.json`), sobald ein Test läuft. In einem leeren Projekt blockiert er jedes Beenden.
- Migrations-Hook (`assets/migrations-hook.snippet.json`), sobald es Migrationen gibt
- Prüfung der Stack-Pakete vor der ersten Installation

Pushe nichts, solange die Projektleitung es nicht verlangt.

## Abschluss

Melde in höchstens zehn Zeilen: was angelegt ist, die Vorschläge zur Bestätigung (Projektname, Rollen und Rechte, Anmeldung), offene Punkte, was nur die Projektleitung erledigen kann. Dann eine Frage: freigeben oder ändern. Der nächste Schritt ist das erste Feature mit `spec-schreiben`.
