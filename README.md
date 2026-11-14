# AI Engineering Vorlage

Standard für Coding-Projekte mit Coding Agents, in der schlanken Fassung. Drei Dinge zählen: Der Projektzustand steht in Dokumenten, «fertig» heisst nachweislich geprüft, und die Projektleitung wird selten gefragt und knapp informiert.

Die Skills sind nicht an eine Person gebunden. Wer freigibt und entscheidet, heisst «Projektleitung» und steht pro Projekt in der CLAUDE.md in der Zeile `Projektleitung: <Name>`. Fehlt der Eintrag, gilt die Person, mit der der Agent gerade arbeitet.

Die ausführliche erste Fassung (rund 1'300 Zeilen) bleibt im Zweig `archiv/voll-v1` abrufbar.

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
| `spec-schreiben` | Spec für den langen Weg mit prüfbaren Kriterien sowie Daten und Rechten, höchstens eine Fragerunde |
| `architektur-entwerfen` | Umsetzungsskizze, nur im seltenen Fall, dass der Abschnitt «Daten und Rechte» der Spec nicht reicht |
| `pruefen` | Unabhängige Prüfung durch ein bis drei Sub-Agenten, gebündelt am Ende eines Zugs von Features, kurzer Prüfbericht |

## Ablauf pro Feature

Zwei Wege, gewählt nach der Frage «Ist diese Entscheidung teuer umzudrehen?».

- **Langer Weg** für Datenmodell, Speicherformat, Protokolle, Rechte und Schreibzugriff auf fremde Systeme: Spec mit Abschnitt «Daten und Rechte», Freigabe durch die Projektleitung, Bauen mit Test zuerst
- **Leichter Weg** für alles andere: Ziel und drei bis fünf Kriterien im Chat bestätigen, Bauen, jede technische Entscheidung in einer Zeile festhalten
- **Beide Wege:** Am Ende eines Zugs von Features prüfen Sub-Agenten gebündelt, danach entscheidet die Projektleitung anhand des Prüfberichts

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
