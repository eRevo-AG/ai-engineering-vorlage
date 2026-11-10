# AI Engineering Vorlage

Marcs Standard für Coding-Projekte mit Coding Agents. Er beruht auf dem AI Engineering Blueprint von Alex Sprogis (AEB-2026) und ist um Rechtekonzept, Projektstufen, Git und Deployment, technisch erzwungene Leitplanken, Lieferkettenschutz und ein kleines Prüfteam erweitert. Er gilt für alle gemeinsamen Coding-Projekte, bis Marc ihn ausdrücklich widerruft.

Grundgedanke: Der Zustand eines Projekts lebt in Dokumenten und nicht im Chatverlauf. Jede Sitzung beginnt mit dem Lesen der Projektdokumente, jede Anforderung lässt sich von der Spezifikation bis zum Prüfbericht verfolgen, und Prüfer prüfen, ohne den Build gesehen zu haben.

## Inhalt

| Ordner | Zweck |
|---|---|
| `skills/` | Die sechs Skills im Quellformat. Dies ist die einzige Quelle der Wahrheit. |
| `dist/` | Die fertig gepackten `.skill`-Dateien zum Hochladen. |
| `projekt-vorlage/` | Fertiges Projektgerüst zum Kopieren (CLAUDE.md, docs-Ordner, Schutzregeln, Regeln nach Bereich unter `.claude/rules/`). |
| `tools/pack.sh` | Packt die Skills nach `dist/`. |

## Die sechs Skills

| Skill | Aufgabe |
|---|---|
| `ai-engineering-standard` | Das Rahmenwerk mit Ablauf, Stufen, Rechtekonzept, Leitplanken und Referenzen |
| `projekt-starten` | Setzt ein neues Projekt per Auswahlfragen auf und legt das Gerüst an |
| `projekt-analysieren` | Erfasst den Ist-Zustand eines bestehenden Projekts und gewinnt Specs rückwärts |
| `spec-schreiben` | Interviewt Marc und schreibt die Spezifikation eines Features |
| `architektur-entwerfen` | Entwirft das Wie, stellt Entscheidungen als Auswahl und holt die Freigabe |
| `pruefen` | Startet vier unabhängige Prüfer (Anforderungen, Rechte, Skeptiker, Qualität) und führt den Prüfbericht zusammen |

Die Skills hängen voneinander ab (Vorlagen und Ablauf) und werden deshalb zusammen hochgeladen.

## Einspielen

1. Die Dateien aus `dist/` in den Einstellungen des Kontos als Skills hochladen. Gleicher Name ersetzt die alte Version.
2. Optional die Prüfer-Rollen aus `skills/pruefen/agents/` nach `.claude/agents/` eines Projekts oder nach `~/.claude/agents/` kopieren. Ohne Installation übergibt der Skill `pruefen` sie als Auftrag an Sub-Agenten.

## Neues Projekt

Am einfachsten über den Skill `projekt-starten`. Er fragt Stufe, Rollen, Anmeldung, Stack und Werkzeuge ab und legt das Gerüst an.

Alternativ den Inhalt von `projekt-vorlage/` in das neue Repository kopieren und die Platzhalter in `<…>` füllen. Die CLAUDE.md wird von Hand gefüllt und nicht mit `/init` erzeugt. Sie enthält nur, was bei jeder Aufgabe gilt und nirgends sonst steht. Die drei Regeln unter `.claude/rules/` werden nur geladen, wenn der Agent Specs, Pläne, Berichte oder Tests bearbeitet. In `tests.md` die Pfade an den Stack anpassen. Die Datei `.claude/settings.json` enthält nur Schutzregeln. Die Hooks unter `.claude/bausteine/` kommen erst dazu, wenn es Migrationen beziehungsweise einen lauffähigen Check gibt. Vorher mit `/hooks` kontrollieren und in einem Testprojekt ausprobieren.

## Ablauf pro Feature

1. Spezifikation (`spec-schreiben`), Freigabe durch Marc
2. Architektur (`architektur-entwerfen`), Freigabe durch Marc
3. Plan
4. Build, Test zuerst
5. Unabhängige Prüfung (`pruefen`), Freigabe durch Marc nach Lesen des Berichts

## Projektstufen

| Stufe | Wofür |
|---|---|
| Prototyp | Experiment, Wegwerf, Machbarkeit |
| Standard | Alles, was weiterlebt |
| Produktiv | Echte Nutzer, echte Daten |

## Pflege

Änderungen am Standard erfolgen in `skills/`. Danach `tools/pack.sh` ausführen, die Dateien in `dist/` prüfen und neu hochladen. Die Vorlagen in `projekt-vorlage/` sind Kopien aus `skills/projekt-starten/assets/` und müssen bei Änderungen dort nachgezogen werden. Die Konventionen für Specs stehen kurz in der Regel `specs.md` und ausführlich im Skill `spec-schreiben`. Bei Änderungen beide angleichen. Hook-Syntax und Einstellungen ändern sich mit Tool-Updates und werden bei jedem Update geprüft.

## Quellen

- AI Engineering Blueprint von Alex Sprogis (AEB-2026), Grundlage des Ablaufs. Der Text im Repository ist eine eigene Fassung und enthält nicht das Original.
- Offizielle Claude-Code-Dokumentation zu Best Practices (Hooks, Berechtigungen, Sandbox, Sub-Agenten)
- OWASP «Secure Coding with AI Cheat Sheet» (Lieferkette, fremde Inhalte, Regeldateien, Tests, Verantwortung)
- Gloaguen, Mündler-Sasahara, Müller, Raychev, Vechev, «Evaluating AGENTS.md. Are Repository-Level Context Files Helpful for Coding Agents?», ETH Zürich und LogicStar.ai, arXiv 2602.11988 (Inhalt der CLAUDE.md, keine automatisch erzeugten Kontextdateien, Wert genauer Aufgabenbeschreibungen). Zusammenfassung in `skills/ai-engineering-standard/references/kontext.md`.
- Offizielle Claude-Code-Dokumentation zu CLAUDE.md, Regeln und AGENTS.md (Ebenen des Kontexts, Regeln mit Pfad)
