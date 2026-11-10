---
name: spec-schreiben
description: Schreibt die Spezifikation eines Features mit prüfbaren Kriterien, Rollen und Randfällen, mit höchstens einer Fragerunde an Marc. Verwende ihn, wenn Marc ein neues Feature, eine Verhaltensänderung oder einen Fehler beschreibt oder «Spec», «Anforderungen» oder «Akzeptanzkriterien» sagt, und bevor Code für etwas Neues entsteht.
---

# Spec schreiben

Die Spec legt fest, was «fertig» heisst, so dass ein Test es prüfen kann. Sie ist der Vertrag für Bauen und Prüfen. Eine genaue Spec wirkt stärker als jede Kontextdatei.

## Vorgehen

1. Lies die Projektanweisungen und, soweit vorhanden, Feature-Übersicht und Rechte. Gehört die Anfrage zu einem bestehenden Feature, erweitere dessen Spec. Ein Feature, eine Spec.
2. Schreibe zuerst einen Entwurf aus dem, was Marc gesagt hat und was im Projekt steht. Fülle Lücken mit vernünftigen Annahmen und kennzeichne sie mit «(Annahme)».
3. Frage nur, was fachlich bei Marc liegt und sich nicht sinnvoll annehmen lässt (Verhalten, Rechte, Kosten). Höchstens eine Runde mit höchstens vier Auswahlfragen, die Empfehlung zuerst. Reicht der Entwurf, frage gar nicht.
4. Lege die Spec zur Freigabe vor, zusammen mit der Umsetzungsskizze, falls eine nötig ist.

## Inhalt

Vorlage `assets/spec.md`, höchstens eine Seite. Ablage unter `docs/specs/<feature>.md` oder am Ort, den das Projekt dafür hat.

- Wer und warum, in ein bis zwei Sätzen
- Rollen. Wer darf es nutzen, wer nicht
- Kriterien mit stabiler ID (`<ABK>-<nr>-AK<nr>`), jeweils Ausgangslage, Handlung, erwartetes Ergebnis, mit Ja oder Nein prüfbar
- Mindestens ein Kriterium für den Verbotsfall, sobald es Rollen oder fremde Daten gibt
- Randfälle. Schlage selbst vor: leere Daten, Fehler, Doppelklick, fehlende Rechte, Abbruch
- Was nicht dazugehört
- Annahmen und offene Fragen

Regeln
- Keine Technik und kein Code. Bei reinen Schnittstellen dürfen Pfad und Methode in den Kriterien stehen.
- IDs nie umnummerieren oder wiederverwenden. Entfallenes als «entfallen» markieren.
- Sichtbare Texte, die geprüft werden sollen, stehen wörtlich in der Spec.
- Nach der Freigabe ändert sich die Spec nur mit Marcs Zustimmung.

## Fehler und kleine Änderungen

Kein Interview. Halte fest: Beschreibung, Schritte zum Nachstellen, erwartetes und tatsächliches Verhalten. Trage das Ergebnis als neues Kriterium oder neuen Randfall in die bestehende Spec ein, bei Fehlern mit Verweis auf die verletzte ID.

## Freigabe

Lege Marc in höchstens acht Zeilen vor: was gebaut wird, was sich für Nutzer ändert, die Annahmen, die offenen Fragen als Auswahl. Gib den Inhalt der Spec nicht wieder, verweise auf die Datei.
