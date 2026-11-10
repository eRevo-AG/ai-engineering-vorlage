---
name: spec-schreiben
description: Interviewt Marc und schreibt daraus die Spezifikation für ein Feature oder eine Funktion, mit prüfbaren Akzeptanzkriterien, Rollen und Rechten, Randfällen, Prioritäten und offenen Fragen. Teil des AI Engineering Standards, Schritt 1 pro Feature. Verwende diesen Skill immer, wenn Marc ein neues Feature, eine Funktion, eine Änderung am Verhalten oder ein neues Projekt beschreibt, wenn er «Spec», «Spezifikation», «Anforderungen», «Akzeptanzkriterien» oder «schreib das Feature auf» sagt, und bevor Code für etwas Neues entsteht, auch wenn er keine Spec ausdrücklich verlangt.
---

# Spec schreiben

Dieser Skill macht aus einer Idee eine Spezifikation, die ein Test prüfen kann. Er läuft im Hauptchat, weil er Marc Fragen stellen muss. Sub-Agenten können das nicht.

Warum es die Spec gibt: Ohne sie weiss niemand, was «fertig» heisst, und der Agent füllt Lücken mit Annahmen. Mit ihr kann Marc ohne Code beurteilen, ob ein Feature stimmt, und der Agent kann während des Bauens selbst nachprüfen, ob er das Ziel erreicht hat.

## Vorbereitung

1. Lies die CLAUDE.md des Projekts (Stufe, Rollen), `docs/features.md` und, falls vorhanden, `docs/architecture.md` mit der Rechtematrix.
2. Prüfe, ob die Anfrage zu einem bestehenden Feature gehört. Dann erweiterst du dessen Spec, es entsteht keine neue. Ein Feature, eine Spec.
3. Arbeite im Plan Mode, falls verfügbar. Du schreibst nur das Dokument und baust nichts.
4. Gibt es noch keine Rollen und Rechte im Projekt, kläre sie zuerst mit Marc und halte sie in der Architektur fest, bevor die Spec entsteht.

## Das Interview

Stelle Fragen in Runden mit höchstens drei bis vier Fragen. Bei Auswahlfragen nutze AskUserQuestion. Schlage selbst Antworten vor, wo du sinnvolle Standardwerte kennst, damit Marc nur bestätigen oder korrigieren muss. Erfinde nichts. Was unklar bleibt, kommt als offene Frage ins Dokument.

Themen in dieser Reihenfolge

1. Wer nutzt das Feature, und welches Problem löst es?
2. Wie läuft es aus Sicht der Nutzer ab, Schritt für Schritt?
3. Welche Rollen dürfen es nutzen, und was ausdrücklich nicht? Welches Verbot muss gelten?
4. Woran erkennt man, dass es fertig und korrekt ist? Daraus entstehen die Akzeptanzkriterien.
5. Randfälle. Schlage selbst vor: leere Daten, Fehler, doppelter Klick, fehlende Rechte, Abbruch mittendrin, Verbindungsabbruch. Marc bestätigt, streicht oder ergänzt.
6. Was gehört ausdrücklich nicht dazu?
7. Priorität pro Kriterium, Muss, Soll oder Kann. Was gehört zum MVP?
8. Gibt es Referenzen? Screenshots des gewünschten Designs, Beispielcode, bestehende Dokumentation. Lege sie unter `docs/specs/<feature>/referenzen/` ab und verweise in der Spec darauf.
9. Welche Entscheidungen sind schon getroffen, und warum?

Im Prototyp genügt eine Runde: Ziel, drei bis fünf Kriterien, die Rechtefrage in einem Satz.

## Schreiben

Nutze die Vorlage `assets/spec.md` und speichere unter `docs/specs/<feature>.md`.

- Kriterien tragen stabile IDs im Muster `<ABK>-<nr>-AK<nr>` und folgen dem Muster Ausgangslage, Handlung, erwartetes Ergebnis.
- Keine Technik, kein Code, kein Status, kein Datum. Die Spec beschreibt das Was. Ausnahmen: Bei reinen API-Produkten dürfen Pfad und Methode in den Kriterien stehen, weil sie das Verhalten ausmachen. Bei rückwärts gewonnenen Specs (Skill `projekt-analysieren`) steht in der Kopfzeile der Vermerk «Herkunft: rückwärts gewonnen, ungeprüft».
- Jedes «Darf» und jedes «Darf nicht» der Rollentabelle bekommt ein eigenes Kriterium mit ID und steht in der Spalte «Kriterium». Rechte und Verbote ohne ID lassen sich weder planen noch prüfen.
- Sichtbare Texte, die geprüft werden sollen (Fehlermeldungen, Hinweise in der Oberfläche), stehen wörtlich in der Spec. Sonst prüfen Tests das Verhalten und nicht den Wortlaut.
- Mindestens ein Kriterium beschreibt den Verbotsfall (zum Beispiel «Nutzer B sieht die Daten von Nutzer A nicht»).
- Bei Erweiterung einer bestehenden Spec bleiben alte IDs unverändert. Neue Kriterien bekommen neue Nummern. Entfallene werden als «entfallen» markiert.
- Schreibe auf Deutsch nach den Regeln von `no-slop-marc`, falls verfügbar.

Im Projekt liegt eine Regel `.claude/rules/specs.md` mit denselben Konventionen. Sie gilt auch, wenn jemand eine Spec ohne diesen Skill ändert. Weichen Regel und Skill voneinander ab, melde es Marc.

## Fehler und kleine Änderungen

Nicht jede Anfrage braucht ein Interview. Für einen Fehlerbericht oder eine kleine Änderung an einem bestehenden Feature fragst du diese sechs Punkte ab und trägst das Ergebnis in die bestehende Spec ein (neues Kriterium oder neuer Randfall mit neuer ID, bei Fehlern mit Verweis auf die verletzte ID).

1. Beschreibung in ein bis zwei Sätzen
2. Schritte zum Nachstellen, minimal und wirklich ausgeführt
3. Erwartetes Verhalten
4. Tatsächliches Verhalten
5. Spezifikation, falls sich Verhalten ändert (Eingaben, Grenzen, Ausgaben, Fehlerfälle)
6. Weitere Angaben (Logs, Screenshots)

Eine genaue Beschreibung der Aufgabe wirkt stärker als jede Kontextdatei. In der ETH-Studie zu Kontextdateien lösten Agenten mit klar strukturierten, genau spezifizierten Beschreibungen deutlich mehr Aufgaben als mit den ursprünglichen.

## Selbstprüfung vor der Freigabe

Gehe jedes Kriterium durch und prüfe

- Lässt es sich mit Ja oder Nein beantworten, ohne dass jemand interpretieren muss?
- Steckt eine Zahl, ein Zustand oder ein sichtbares Ergebnis drin, das ein Test prüfen kann?
- Ist der Verbotsfall abgedeckt, und gibt es mindestens ein Muss-Kriterium?
- Stehen alle Unklarheiten bei den offenen Fragen und nicht stillschweigend im Text?

## Freigabe

Schreibe die Freigabe-Zusammenfassung in Alltagssprache (was wird freigegeben, was ändert sich für Nutzer, Risiken und offene Punkte, was ist unklar) und frage Marc, ob er freigibt, ändert oder ablehnt. Nach der Freigabe setzt du in `docs/features.md` den Status «Spec freigegeben». Danach ändert sich die Spec während des Builds nicht mehr, ausser Marc gibt es frei.

Als nächster Schritt folgt die Architektur.
