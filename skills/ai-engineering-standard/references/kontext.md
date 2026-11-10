# Kontext gezielt geben

Quellen sind die ETH-Studie «Evaluating AGENTS.md» (Gloaguen et al., arXiv 2602.11988) und die Claude-Code-Dokumentation.

## Was die Studie zeigt

- Kontextdateien verbessern die Erfolgsquote nicht messbar, weder automatisch erzeugte noch von Hand geschriebene.
- Sie verteuern jede Aufgabe um rund 20 Prozent, weil Agenten jede Anweisung befolgen (mehr Tests, mehr Suchen, längeres Nachdenken).
- Übersichten über das Repository helfen nicht. Automatisch erzeugte Dateien wiederholen meist das README.
- Die Länge allein hatte keinen Einfluss. Es zählt, was drinsteht.
- Genau spezifizierte Aufgaben wurden deutlich häufiger gelöst (bei einem Modell 70,8 statt 57,0 Prozent, als obere Abschätzung).
- Gemessen wurden einzelne Python-Aufgaben, nicht Sicherheit oder Arbeit über viele Sitzungen.

## Was in CLAUDE.md oder AGENTS.md gehört

Hinein: Produkt in ein bis drei Sätzen, Stack, die genauen Befehle, Konventionen, die sich nicht aus dem Code ergeben, was nie ohne Rückfrage passieren darf. Konkret formulieren («Nutze pnpm, nicht npm»).

Nicht hinein: Verzeichnisbaum, Inhalte aus README oder Code, allgemeine Aufforderungen («teste gründlich»), Abläufe mit mehreren Schritten, Stand und Geschichte.

- Von Hand schreiben, nicht mit `/init` erzeugen.
- Jede Zeile braucht einen Anlass (ein beobachteter Fehler). Was nichts ändert, wird gelöscht. Was trotz Wiederholung übergangen wird, gehört in einen Hook.
- Claude Code liest `AGENTS.md` nur, wenn es keine `CLAUDE.md` gibt. Bei beiden beginnt die `CLAUDE.md` mit `@AGENTS.md`.

## Ebenen

| Ebene | Geladen | Wofür |
|---|---|---|
| CLAUDE.md oder AGENTS.md | Immer | Was bei jeder Aufgabe gilt |
| Regeln mit `paths` (`.claude/rules/`) | Wenn passende Dateien gelesen oder geändert werden | Konventionen für einen Dateityp oder Ordner |
| Skills | Beschreibung immer, Inhalt bei Bedarf | Abläufe mit mehreren Schritten |
| Sub-Agenten | Eigener Kontext | Unabhängige Prüfung, breite Suche |
| Projektdokumente | Nur wenn gelesen | Zustand, Specs, Entscheidungen |
| Hooks, Deny-Regeln, CI | Erzwungen | Was ohne Ausnahme gilt |

Regel mit Pfad (einziges ausgewertetes Feld ist `paths`):

```markdown
---
paths:
  - "docs/specs/**"
---
- Kriterien haben stabile IDs.
```

Regeln ohne Pfad werden immer geladen und bleiben die Ausnahme. Auch die Beschreibung jedes Skills wird immer geladen und soll kurz sein.

## Aktuelle Dokumentation

Bei Schnittstellen zu Frameworks und externen Diensten die aktuelle Dokumentation lesen (im installierten Paket, im Web oder über einen Dokumentations-Server) und nicht dem Trainingswissen trauen.
