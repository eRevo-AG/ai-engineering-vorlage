# AI Engineering Vorlage

Marcs Standard für Coding-Projekte mit Coding Agents, in der schlanken Fassung. Drei Dinge zählen: Der Projektzustand steht in Dokumenten, «fertig» heisst nachweislich geprüft, und Marc wird selten gefragt und knapp informiert.

Die ausführliche erste Fassung (rund 1'300 Zeilen) bleibt unter dem Git-Tag `voll-v1` abrufbar.

## Inhalt

| Ordner | Zweck |
|---|---|
| `skills/` | Die sechs Skills im Quellformat, einzige Quelle der Wahrheit |
| `dist/` | Die gepackten `.skill`-Dateien zum Hochladen |
| `projekt-vorlage/` | Projektgerüst zum Kopieren (CLAUDE.md, Dokumente, Schutzregeln, zwei Regeln nach Bereich) |
| `tools/pack.sh` | Packt die Skills nach `dist/` |

## Skills

| Skill | Aufgabe |
|---|---|
| `ai-engineering-standard` | Ablauf, wann der Agent selbst entscheidet und wann er fragt, Kosten und Kürze, harte Regeln |
| `projekt-starten` | Neues Projekt mit einer Fragerunde aufsetzen |
| `projekt-analysieren` | Ist-Zustand eines bestehenden Projekts erfassen |
| `spec-schreiben` | Spec mit prüfbaren Kriterien, höchstens eine Fragerunde |
| `architektur-entwerfen` | Kurze Umsetzungsskizze, nur wenn Daten, Rollen, Abhängigkeiten oder Dienste betroffen sind |
| `pruefen` | Unabhängige Prüfung durch ein bis drei Sub-Agenten, kurzer Prüfbericht |

## Ablauf pro Feature

1. Spec, bei Bedarf mit Umsetzungsskizze
2. Freigabe 1 durch Marc
3. Bauen, Test zuerst, ohne Rückfragen ausser im Notfall
4. Unabhängige Prüfung
5. Freigabe 2 durch Marc anhand des Prüfberichts

## Einspielen

Die Dateien aus `dist/` in den Einstellungen des Kontos als Skills hochladen. Gleicher Name ersetzt die alte Version. Für ein neues Projekt den Skill `projekt-starten` nutzen oder den Inhalt von `projekt-vorlage/` kopieren und die Platzhalter füllen. Hooks unter `.claude/bausteine/` erst aktivieren, wenn Tests beziehungsweise Migrationen existieren, und vorher mit `/hooks` prüfen.

## Pflege

Änderungen in `skills/` vornehmen, `tools/pack.sh` ausführen, neu hochladen. `projekt-vorlage/` enthält Kopien aus `skills/projekt-starten/assets/`. Neues kommt nur hinein, wenn ein beobachtetes Problem es verlangt, und ersetzt möglichst etwas Bestehendes.

## Quellen

- AI Engineering Blueprint von Alex Sprogis (Grundlage des Ablaufs, eigene Fassung)
- Claude-Code-Dokumentation zu Best Practices, CLAUDE.md, Regeln und Hooks
- OWASP «Secure Coding with AI Cheat Sheet»
- Gloaguen et al., «Evaluating AGENTS.md», ETH Zürich, arXiv 2602.11988
- Arbeitsweise im Repository Company-OS (Autonomiestufen und Sammelfragen des Skills `steward`)
