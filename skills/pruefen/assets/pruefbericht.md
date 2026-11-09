# Prüfbericht <Feature>

Die Prüfer arbeiten nur mit Spec und laufender App, ohne Kenntnis des Build-Verlaufs. Prüfer reparieren nicht. Ergebnisse stehen so da, wie die Prüfer sie gemeldet haben.

Erstellt mit `<Werkzeug und Modell>`. Verantwortlich für die Freigabe ist Marc.

Durchlauf 1. Geprüft gegen `docs/specs/<feature>.md`, App gestartet mit `<befehl>`, Stufe `<Stufe>`.
Prüfer in diesem Durchlauf `<Anforderungen, Rechte, Skeptiker, Qualität>`.

## Ergebnis pro Anforderung (Prüfer Anforderungen)
Bestanden, nicht bestanden (mit Weg zum Nachstellen) oder nicht prüfbar (mit Grund).

| Spec-ID | Priorität | Ergebnis | Nachweis oder Weg zum Nachstellen |
|---|---|---|---|
| ABK-01-AK01 | Muss | bestanden | |
| ABK-01-AK02 | Soll | nicht bestanden | 1. … 2. … 3. … |

## Regression
Dazu Teststand (Anzahl gegenüber dem Hauptzweig, gelöschte oder abgeschwächte Tests) und Geltungsbereich (geänderte Dateien ohne Bezug zur Spec). Befehl, Anzahl gelaufener, bestandener und fehlgeschlagener Tests, Ergebnis des Production-Builds, Stichproben bestehender Funktionen.

## Rechte (Prüfer Rechte)
Geprüft mit je einem Testkonto pro Rolle, nicht nur mit dem Admin. Gezielt versucht, fremde Daten zu lesen und zu ändern.

| Rolle | Erlaubter Zugriff funktioniert | Verbotener Zugriff wird verweigert | Bemerkung |
|---|---|---|---|
| | ja, nein oder nicht prüfbar | ja, nein oder nicht prüfbar | |

Weitere Sicherheitsfunde

## Sonderfälle (Prüfer Skeptiker)
Versuchte Sonderfälle und Funde. Jeder Fund mit Art (verletzt Spec-ID oder Lücke in der Spec), Weg zum Nachstellen, Schweregrad und Status (reproduziert oder vermutet).

Vorschläge für neue Randfälle in der Spec, über die Marc entscheidet

## Qualität (Prüfer Qualität, nur Stufe Produktiv)
Nachvollziehbarkeit (jede Spec-ID hat einen Test) und Funde mit Datei und Zeile.

## Blocker der Prüfung
Was die Prüfer nicht prüfen konnten, und warum (zum Beispiel fehlendes Testkonto).

## Zusammenfassung für Marc
Freigabe-Zusammenfassung in Alltagssprache.

- Was gibst du frei?
- Was ändert sich für die Nutzer?
- Risiken und offene Punkte
- Was konnte nicht geprüft werden?
- Frage an Marc: freigeben, ändern oder ablehnen?

Freigabe durch Marc nach Lesen des Berichts.
