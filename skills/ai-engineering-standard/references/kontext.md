# Kontext gezielt geben

Dieser Teil ergänzt Baustein 01. Er beschreibt, welche Information auf welche Ebene gehört, damit der Agent genau den Kontext hat, den er für die aktuelle Aufgabe braucht. Grundlage sind die Studie der ETH Zürich zu Kontextdateien (Gloaguen, Mündler-Sasahara, Müller, Raychev, Vechev, «Evaluating AGENTS.md», arXiv 2602.11988) und die offizielle Claude-Code-Dokumentation zu CLAUDE.md, Regeln und AGENTS.md. Syntax und Ladeverhalten ändern sich mit Tool-Updates und werden bei Updates gegengeprüft.

Inhalt: Was die Studie zeigt, Folgen für die CLAUDE.md, Die Ebenen, Regeln nach Bereich, Dateien lesen statt raten, MCP-Server, Gute Aufgabenbeschreibungen, Pflege der Anweisungen

---

## Was die Studie zeigt

Untersucht wurden vier Kombinationen aus Coding Agent und Modell (darunter Claude Code) auf 300 Aufgaben aus SWE-bench Lite und 138 neuen Aufgaben aus 12 Repositories mit von Entwicklern geschriebenen Kontextdateien. Verglichen wurden drei Fälle: ohne Kontextdatei, mit automatisch erzeugter und mit von Entwicklern geschriebener.

- Kontextdateien verbessern die Erfolgsquote nicht messbar. Automatisch erzeugte senken sie im Schnitt leicht (0,5 und 2 Prozentpunkte), von Entwicklern geschriebene heben sie leicht (2,4 Prozentpunkte). Beides ist statistisch nicht gesichert. Gesichert ist nur, dass geschriebene besser abschneiden als erzeugte.
- Sie verteuern jede Aufgabe, weil der Agent mehr Schritte macht. Mit erzeugten Dateien stiegen die Kosten im Schnitt um 20 bis 23 Prozent, mit geschriebenen um bis zu 19 Prozent. Dieser Anstieg ist statistisch gesichert.
- Der Grund ist, dass Agenten die Anweisungen befolgen. Sie testen mehr, suchen und lesen mehr Dateien und denken länger nach. Ein in der Datei genanntes Werkzeug wird fast nur dann benutzt, wenn es dort steht. Jede Zeile wird also bei jeder Aufgabe ausgeführt und bezahlt.
- Übersichten über das Repository helfen nicht. Agenten finden die relevanten Dateien mit Übersicht nicht schneller als ohne.
- Erzeugte Dateien wiederholen meist, was schon in README und Dokumentation steht. Nur wenn es sonst keine Dokumentation gibt, helfen sie (plus 2,7 Prozentpunkte).
- Die Länge der Datei hatte für sich keinen messbaren Einfluss. Es zählt, was drinsteht, nicht wie viel.
- Stärkere Modelle erzeugen keine besseren Kontextdateien, und der Prompt zum Erzeugen macht kaum einen Unterschied.

Empfehlung der Autoren: automatisch erzeugte Kontextdateien vorerst weglassen. Von Hand geschriebene enthalten nur, was der Agent braucht und was nicht schon im Repository steht (besondere Konventionen, nicht funktionale Anforderungen, nicht übliche Werkzeuge), und werden auf ihre Wirkung geprüft.

Grenzen der Studie. Sie misst nur, ob eine einzelne, gut beschriebene Aufgabe gelöst wird, und nur in Python. Sicherheit, Wartbarkeit und Arbeit über viele Sitzungen wurden nicht gemessen. Die Regeln dieses Standards zu Rechten, Leitplanken und Projektzustand in Dokumenten sind von dem Ergebnis deshalb nicht widerlegt. Sie gehören aber, wo immer möglich, in erzwungene Konfiguration oder in Dokumente, die nur bei Bedarf geladen werden, und nicht in die Datei, die immer geladen wird.

---

## Folgen für die CLAUDE.md

Jede Zeile der CLAUDE.md wird in jeder Sitzung geladen und befolgt. Deshalb gilt für jede Zeile die Frage: Muss der Agent das bei jeder Aufgabe wissen, und steht es nirgends sonst?

Hinein gehört
- Produkt in ein bis drei Sätzen
- Stack und die genauen Befehle (starten, testen, bauen), besonders wenn sie vom Üblichen abweichen. Schreibe konkret («Nutze pnpm, nicht npm») statt allgemein.
- Der Arbeitsablauf dieses Standards und der Ort der Projektdokumente
- Konventionen, die sich nicht aus dem Code ergeben, und was nie ohne Rückfrage passieren darf

Nicht hinein gehört
- Ein Verzeichnisbaum oder eine Beschreibung der Ordner. Das findet der Agent selbst, und es hilft nachweislich nicht.
- Was schon in README, Dokumentation oder Code steht
- Regeln, die nur für einen Bereich gelten (dafür gibt es Regeln nach Bereich)
- Mehrstufige Abläufe (dafür gibt es Skills)
- Allgemeine Aufforderungen wie «teste gründlich» oder «prüfe alles». Sie werden befolgt und kosten bei jeder Aufgabe Schritte. Wann welche Tests laufen, regelt Baustein 05.
- Geschichte, Notizen und Stand einzelner Features

Weitere Regeln
- Die CLAUDE.md wird von Hand geschrieben oder aus Marcs Antworten gefüllt. Sie wird nicht mit `/init` oder einem ähnlichen Befehl automatisch aus dem Code erzeugt. Bei bestehenden Projekten enthält sie nur geprüfte Befehle und Marcs Regeln, keine aus dem Code abgeleitete Übersicht. Die abgeleitete Beschreibung steht in `docs/ist-zustand.md` und wird nur bei Bedarf gelesen.
- Als Richtwert gilt eine Seite, höchstens 200 Zeilen (so auch die offizielle Dokumentation). Die Zeilenzahl ist aber nur ein Hilfsmass. Eine kurze Datei mit unnötigen Anweisungen ist schlechter als eine etwas längere mit lauter nötigen.
- Widersprüche zwischen Anweisungsdateien vermeiden. Bei zwei widersprüchlichen Anweisungen wählt der Agent eine beliebige.
- Importe mit `@pfad` ordnen eine lange Datei, senken ihre Kosten aber nicht, weil importierte Dateien mitgeladen werden.

---

## Die Ebenen

| Ebene | Wann geladen | Wofür |
|---|---|---|
| CLAUDE.md im Projekt | Immer, zu Sitzungsbeginn | Was bei jeder Aufgabe gilt (siehe oben) |
| CLAUDE.md in Unterordnern | Erst wenn der Agent dort eine Datei liest oder ändert | Besonderheiten eines Teilbereichs in grossen Projekten |
| Globale CLAUDE.md (`~/.claude/CLAUDE.md`) | Immer, in allen Projekten | Persönliche Vorgaben, die überall gelten. Sehr sparsam halten. |
| Regeln mit Pfad (`.claude/rules/`) | Wenn der Agent eine passende Datei liest oder ändert | Konventionen für einen Dateityp oder Ordner, unabhängig davon, welcher Skill gerade läuft |
| Regeln ohne Pfad | Immer | Wie eine Verlängerung der CLAUDE.md. Nur in Ausnahmen, sonst entsteht das Problem aus der Studie erneut. |
| Skills | Beschreibung immer, Inhalt erst bei Aufruf oder wenn der Agent ihn für passend hält | Mehrstufige Abläufe und Arbeitsanleitungen (Spec, Architektur, Prüfung) |
| Sub-Agenten | Eigener, frischer Kontext | Abgegrenzte Teilaufgaben, parallele Arbeit, unabhängige Prüfung. Zurück kommt nur eine Zusammenfassung. |
| MCP-Server | Werkzeuge bei Bedarf | Zugriff auf externe Systeme und aktuelle Dokumentation |
| Projektdokumente (`docs/`) | Nur wenn der Agent sie liest | Zustand des Projekts (Features, Specs, Architektur, Entscheidungen, Pläne, Berichte) |
| Einstellungen, Hooks, Sandbox | Erzwungen, ausserhalb des Kontexts | Was ohne Ausnahme gelten muss (siehe `leitplanken-technik.md`) |

Faustregeln für die Wahl der Ebene
- Gilt es bei jeder Aufgabe? Dann CLAUDE.md. Gilt es nur für bestimmte Dateien? Dann eine Regel mit Pfad.
- Ist es ein Ablauf mit mehreren Schritten? Dann ein Skill.
- Gilt eine Konvention für mehrere Skills (zum Beispiel der Aufbau von Specs)? Dann einmal als Regel mit Pfad, damit sie auch gilt, wenn kein Skill läuft, und nicht in jedem Skill einzeln gepflegt werden muss.
- Muss es ohne Ausnahme gelten? Dann Hook oder Deny-Regel.
- Ist es Zustand oder Wissen über das Projekt? Dann ein Dokument unter `docs/`.

Mehrere Coding Agents. Claude Code liest eine `AGENTS.md` nur, wenn es keine `CLAUDE.md` im Projekt gibt. Gibt es beide, liest es nur die `CLAUDE.md`. Für eine gemeinsame Quelle gibt es zwei saubere Wege. Entweder existiert nur die `AGENTS.md`, oder die `CLAUDE.md` importiert sie mit der Zeile `@AGENTS.md` und enthält sonst nur, was allein für Claude Code gilt.

---

## Regeln nach Bereich

Eine Regel ist eine Markdown-Datei unter `.claude/rules/`. Mit dem Feld `paths` im Kopf gilt sie nur für passende Dateien und wird erst geladen, wenn der Agent eine solche Datei liest oder ändert.

```markdown
---
paths:
  - "docs/specs/**"
---

# Konventionen für Spezifikationen

- Kriterien folgen dem Muster Ausgangslage, Handlung, erwartetes Ergebnis.
```

`paths` ist das einzige Feld, das Claude Code aus dem Kopf liest. Ist der Kopf fehlerhaft, wird die Regel ohne Einschränkung geladen, also immer. Deshalb nach dem Anlegen kurz prüfen.

Der Skill `projekt-starten` liefert drei Regeln mit, die er nach `.claude/rules/` kopiert.

- `specs.md` für `docs/specs/**` mit den Konventionen für Spezifikationen
- `plaene-und-berichte.md` für `docs/plans/**` und `docs/reports/**`
- `tests.md` für Testdateien (die Pfade werden an den Stack angepasst)

Eine Regel pro Thema, wenige Zeilen, konkret formuliert. Mehr als eine Handvoll Regeln ohne Pfad sind ein Zeichen, dass Dinge in die falsche Ebene geraten sind.

---

## Dateien lesen statt raten

Der Agent liest eine Datei neu, bevor er sie ändert oder sich bei einer Entscheidung auf ihren Inhalt stützt. Er verlässt sich nicht darauf, dass er sie früher in der Sitzung gelesen hat. Nach einer Verdichtung des Verlaufs oder nach vielen Zwischenschritten ist der Inhalt oft nicht mehr vollständig im Kontext, und der Agent füllt die Lücke mit Annahmen. Kann er eine Information nicht nachlesen, sagt er das und fragt, statt zu raten.

Das gilt besonders für Specs, Architektur, Rechtematrix und Entscheidungsprotokoll.

---

## MCP-Server

MCP-Server geben dem Agenten Zugriff auf externe Systeme. Sie sind nützlich und zugleich eine Angriffsfläche (siehe `leitplanken-technik.md`, Abschnitt zu nicht vertrauenswürdigen Inhalten). Jeder Server ist eine Entscheidung und steht in `docs/decisions.md`.

- Aktuelle Dokumentation. Modelle kennen Bibliotheken auf dem Stand ihres Trainings. Bei Schnittstellen zu Frameworks und externen Diensten holt der Agent die aktuelle Dokumentation (über die offizielle Dokumentation im Web oder einen Dokumentations-Server wie Context7) und verlässt sich nicht auf sein Trainingswissen. Das vermeidet Fehler durch veraltete Schnittstellen.
- Datenbank und Backend (zum Beispiel Supabase). Nur gegen ein Entwicklungs- oder Staging-Projekt, nie gegen Produktion, und mit den geringsten nötigen Rechten. Änderungen am Datenbankaufbau laufen weiterhin als Migrationen im Repository und nicht als direkte Eingriffe über den Server, damit sie nachvollziehbar bleiben.
- Design (zum Beispiel Figma). Entwürfe dienen als Referenz für die Spec. Der Verweis steht im Abschnitt «Referenzen» der Spec.
- Zugangsdaten für Server stehen nie in Dateien, die ins Repository gelangen.

---

## Gute Aufgabenbeschreibungen

Ein Nebenergebnis der Studie stützt den Kern dieses Standards. Mit klar strukturierten, genau spezifizierten Aufgabenbeschreibungen lösten die Agenten deutlich mehr Aufgaben als mit den ursprünglichen Beschreibungen (bei einem Modell 70,8 statt 57,0 Prozent, bei einem anderen 46,9 statt 30,3). Die Beschreibungen wurden allerdings in Kenntnis der Lösung erstellt, die Zahl ist also eine obere Abschätzung. Die Richtung ist trotzdem deutlich: Eine gute Beschreibung der Aufgabe bringt weit mehr als eine Kontextdatei.

Für Fehlerberichte und kleine Änderungen, die keine neue Spec brauchen, gilt deshalb diese Struktur.

1. Beschreibung in ein bis zwei Sätzen
2. Schritte zum Nachstellen, minimal und wirklich ausgeführt
3. Erwartetes Verhalten
4. Tatsächliches Verhalten
5. Spezifikation, falls sich Verhalten ändert (Eingaben, Grenzen, Ausgaben, Fehlerfälle), mit Verweis auf die betroffenen Spec-IDs
6. Weitere Angaben (Logs, Screenshots)

Sichtbare Texte, die geprüft werden sollen (Fehlermeldungen, Hinweise in der Oberfläche), stehen wörtlich in der Spec. Sonst prüfen Tests das Verhalten und nicht den genauen Wortlaut.

---

## Pflege der Anweisungen

- Jede neue Zeile in CLAUDE.md oder einer Regel braucht einen Anlass, zum Beispiel einen beobachteten Fehler, den sie verhindert. Zeilen «auf Vorrat» kosten bei jeder Aufgabe und nützen nicht.
- Wirkung prüfen. Ändert eine Zeile nichts am Verhalten, wird sie gelöscht. Wird sie trotz Wiederholung übergangen, gehört sie in einen Hook.
- Bei der Pflege (Baustein 08) werden CLAUDE.md, Regeln und Skills auf Veraltetes, Doppeltes und Widersprüche durchgesehen. Neuere Versionen von Claude Code bieten dafür `/doctor prompt-audit`.
- Änderungen an Regeldateien brauchen Marcs Freigabe (siehe `leitplanken-technik.md`).
