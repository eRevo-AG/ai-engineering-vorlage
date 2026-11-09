---
name: projekt-starten
description: Setzt ein neues Coding-Projekt nach Marcs AI Engineering Standard auf. Fragt per Auswahlfragen Stufe, Rollen und Rechte, Anmeldung, Stack und Werkzeuge ab und legt dann CLAUDE.md, docs-Gerüst (Features, Architektur, Entscheidungen, Specs, Pläne, Berichte) und die Projekteinstellungen mit Deny-Regeln und Hooks an. Verwende diesen Skill immer, wenn Marc ein neues Projekt, eine neue App oder ein neues Repository beginnt, wenn er «neues Projekt», «starte ein Projekt», «setz das auf», «Gerüst» oder «Projekt anlegen» sagt, und wenn ein Ordner oder Repository noch keine CLAUDE.md und kein docs-Gerüst hat und gebaut werden soll. Nicht für bestehende Projekte mit Code, dafür gibt es projekt-analysieren.
---

# Projekt starten

Dieser Skill legt das Fundament, auf dem der AI Engineering Standard läuft. Ohne dieses Gerüst muss der Agent in jeder Sitzung raten, wie das Projekt funktioniert. Mit ihm startet jede Sitzung mit demselben Wissen.

Marc beantwortet Entscheidungen lieber als Auswahl. Nutze deshalb AskUserQuestion mit klaren Optionen, setze die empfohlene Option an die erste Stelle und frage Freitext nur dort, wo eine Auswahl nicht reicht.

## Vorbereitung

1. Prüfe, ob der Ordner leer ist oder nur Gerüst enthält. Findest du bestehenden Code, stoppe und biete `projekt-analysieren` an.
2. Prüfe, ob eine CLAUDE.md oder ein `docs/`-Ordner teilweise existiert. Ergänze Fehlendes und überschreibe nichts ohne Rückfrage.
3. Prüfe, ob der Ordner ein Git-Repository ist. Wenn nicht, frage Marc in Runde 1 per Auswahl, ob du `git init` ausführen sollst («Ja», «Nein, das Repository kommt von mir»). Du führst dann `git init -b main` aus. Der Standard setzt Git voraus (ein Zweig pro Feature, Commit pro Aufgabe).

## Interview

Stelle die Fragen in Runden mit höchstens vier Fragen pro Runde.

Runde 1
- Stufe: Prototyp, Standard (empfohlen) oder Produktiv. Erkläre jede Option in einem Satz (siehe Stufentabelle im Skill `ai-engineering-standard`).
- Rollen und Rechte: «Nur ich, kein Login», «Ich und Mitarbeitende mit gleichen Rechten», «Mehrere Rollen mit unterschiedlichen Rechten», «Öffentliche Besucher und angemeldete Mitglieder». Bei mehreren Rollen lässt du Marc die Rollennamen nennen.
- Stack: Frage nach dem Stack des Projekts, mit den Optionen «Ich nenne ihn selbst», «Du schlägst einen vor, ich gebe frei» und, falls bekannt, einer typischen Wahl. Der Stack ist pro Projekt verschieden und wird nie vorausgesetzt.
- Werkzeuge: «Nur Claude Code» oder «Mehrere Coding Agents». Bei mehreren liegt die gemeinsame Quelle in AGENTS.md, und die CLAUDE.md verweist darauf.

Runde 2
- Produkt in freien Worten: für wen, welches Problem, was gehört zum MVP und was ausdrücklich nicht. Fasse es danach selbst in drei Sätze. Marc bestätigt diese Sätze in der Abschlussfreigabe mit, es braucht keine eigene Runde dafür.
- Daten: «Keine personenbezogenen Daten», «Personenbezogene Daten von Nutzern», «Besonders schützenswerte Daten». Das bestimmt Datenschutzaufgaben in der Architektur.
- Externe Dienste mit Kosten (KI-Schnittstellen, E-Mail, Zahlung): ja oder nein. Bei ja werden Limits als Aufgabe «nur Marc» geplant.
- Sprache der Oberfläche: Deutsch (Schweiz), mehrsprachig oder andere.

Runde 3 (nur bei Stufe Standard oder Produktiv und mehr als «Nur ich, kein Login»)
- Anmeldung: «E-Mail und Passwort», «Magic Link per E-Mail», «Single Sign-on», «Weiss ich noch nicht».
- Ist jedes Mitglied ein Nutzer mit Anmeldung? Frage das nur, wenn eine Rolle «Mitglied» vorkommt («Ja, jedes Mitglied hat ein Konto», «Nein, nur ausgewählte», «Weiss ich noch nicht»).
- Grobe Rechte pro Rolle, jeweils eine Frage pro Rolle (bei mehr als drei Rollen gruppierst du ähnliche): «Nur eigene Daten», «Alle Daten lesen», «Alle Daten lesen und ändern», «Alles inklusive Verwaltung der Nutzer». Marc bekommt nie eine Matrix vorgesetzt, die er nicht mit beantwortet hat.

Bei Stufe Prototyp genügt Runde 1 und ein Satz zum Produkt.

## Gerüst anlegen

Lege folgende Dateien an und fülle sie mit den Antworten. Alles, was nicht aus den Antworten oder einer Entscheidung Marcs stammt, ist Entwurf oder bleibt offen.

Regeln für Platzhalter und offene Punkte
- Ein Befehl gilt als bekannt, wenn Marc ihn genannt hat oder das Standardwerkzeug des Stacks eindeutig ist (zum Beispiel `pytest`, `npm test`). Der Startbefehl bleibt offen, bis die Projektstruktur steht.
- Offene Stellen ersetzt du durch das Literal `<…>`. Die Hinweistexte der Vorlage entfallen, und du schreibst keine eigenen Hinweise in die Klammern. Die offenen Punkte stehen als Liste in der Abschlussfreigabe. Abschnitte, die nur Anweisungen enthalten (zum Beispiel «Feature-Abschnitte»), bekommen «Noch keine.»
- Befehle mit Argument trägst du als Muster ein, zum Beispiel `pytest <Testdatei>`. Das zählt nicht als offen.
- Den Projektnamen leitest du aus dem Produkttext ab und lässt ihn in der Abschlussfreigabe bestätigen.
- Rechtematrix und Datenschutz enthalten nur Bekanntes. Alles, was du vorschlägst, trägst du mit dem Zusatz «(Vorschlag)» ein, auch Verbote (Zellen «nicht»). Aufbewahrung, Löschung und Informationspflicht bleiben offen, bis Marc sie klärt.
- Die Rechtematrix leitest du aus den Rollen und den groben Rechten ab, die Marc genannt hat. Jede Zelle, die darüber hinausgeht, kennzeichnest du als «Vorschlag». Die Matrix gilt erst, wenn Marc sie freigibt.

Dateien

- `CLAUDE.md` nach `assets/projekt-CLAUDE.md`. Stufe, Rollen, Stack, Befehle und Konventionen eintragen. Unter 150 Zeilen bleiben. Bei mehreren Coding Agents ergänze den Satz «Die gemeinsame Quelle liegt in AGENTS.md.» Bei «Nur Claude Code» entfällt er. Trage die Ordnerkonvention für Migrationen (`migrations/`) in die Konventionen ein, wenn der Stack Migrationen kennt.
- `docs/features.md` nach `assets/features.md`. Trage die MVP-Features aus dem Produkttext als Zeilen ein, mit Status «Entwurf» und leerem Kürzel (es entsteht erst mit der Spec). Features ausserhalb des MVP trägst du nicht ein.
- `docs/architecture.md` nach `assets/architecture.md`, mit Rollen, Anmeldung, Datenschutz-Hinweis aus Runde 2 und der Rechtematrix als Entwurf. Aufgaben, die in den ersten Plan gehören (Stop-Hook aktivieren, Migrations-Hook, Paketprüfung, Migrationen ja oder nein), schreibst du in den Abschnitt «Vorgemerkte Aufgaben für den ersten Plan». Dort findet sie der Plan, und sie stehen nicht nur im Chat.
- `docs/decisions.md` nach `assets/decisions.md`. Trage die Stack-Entscheidung als E01 ein. Die Prüfung der Stack-Pakete (Existenz, Betreuer, Verbreitung, Lizenz) geschieht vor der ersten Installation. Bis dahin steht in E01 «noch nicht geprüft», und die Prüfung ist eine Aufgabe im ersten Plan.
- Leere Ordner `docs/specs/`, `docs/plans/`, `docs/reports/` (mit `.gitkeep`)
- `.claude/settings.json` nach `assets/settings.basis.json`. Sie enthält nur Schutzregeln (Rückfrage bei Commit und Push, Deny für Secrets und Force-Push) und ist ohne Platzhalter sofort gültig.
  - Ergänze Allow-Einträge für harmlose Befehle des Stacks (Test, Typecheck, Linter, Start), aber nur für Befehle, die bekannt sind, und nie für Installation oder Löschen.
  - Füge den Migrations-Hook aus `assets/migrations-hook.snippet.json` hinzu, sobald die Architektur entschieden hat, dass es Migrationen gibt. Der Ordner heisst `migrations/`.
  - Der Stop-Hook aus `assets/stop-hook.snippet.json` wird erst aktiviert, wenn ein lauffähiger Check existiert. In einem leeren Projekt würde er jedes Beenden blockieren, weil Tests und Code fehlen. Notiere deshalb unter «Vorgemerkte Aufgaben für den ersten Plan» in `docs/architecture.md` die Aufgabe «Stop-Hook aktivieren, sobald die erste Testdatei läuft». Mehrere Befehle stehen in Klammern: `(a && b) 1>&2 || exit 2`.
  - Hooks und Allow-Einträge mit unbekanntem Befehl lässt du weg, du setzt keine Platzhalter ein.
  - Vor dem Einsatz mit `/hooks` kontrollieren.
- `.gitignore`: ergänze `.env`, `.env.*`, `secrets/` und `.claude/settings.local.json`, dazu die üblichen Einträge des Stacks (Caches, virtuelle Umgebungen, Build-Ordner). Bei personenbezogenen Daten (Runde 2) gehören lokale Datendateien wie `*.db` dazu.
- Bei mehreren Coding Agents zusätzlich `AGENTS.md` als gemeinsame Quelle, auf die CLAUDE.md verweist.

Bei Stacks ohne Build (zum Beispiel Python) trägst du unter «Production-Build» den Befehl ein, der beweist, dass die App startet, oder lässt die Zeile offen, bis er feststeht.

Committe und pushe nichts, solange Marc es nicht ausdrücklich verlangt.

## Abschluss

Schreibe eine Freigabe-Zusammenfassung in Alltagssprache.

- Was wurde angelegt?
- Die drei Sätze zum Produkt, mit der Bitte um Bestätigung
- Die Rechtematrix als Entwurf, gekennzeichnet, was von Marc stammt und was Vorschlag ist
- Der Projektname, abgeleitet aus dem Produkttext, mit Bitte um Bestätigung
- Offene Punkte als Liste (Befehle, Umsetzung der Anmeldung und Schutz gegen Passwort-Ausprobieren, Migrationen ja oder nein, Datenschutzfragen, Schlüssel, Domains)
- Was muss Marc selbst erledigen?

Frage Marc, ob er so freigibt oder ändern will. Danach ist der nächste Schritt das erste Feature mit dem Skill `spec-schreiben`.

Bei Stufe Standard oder Produktiv ist die Rechtematrix vor dem ersten Feature von Marc freigegeben. Bei «Nur ich, kein Login» steht das als Entscheidung in `docs/decisions.md`.
