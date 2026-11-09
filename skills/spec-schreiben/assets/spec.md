# Spezifikation <Feature>

Feature-Kürzel `<ABK-01>` (ASCII, vier Grossbuchstaben). Ein Feature, eine Spec. Änderungen erweitern dieses Dokument. Keine Technik, kein Code, kein Status, kein Datum.

## Wer und warum
<Wer nutzt das Feature, welches Problem löst es, aus Sicht der Nutzer.>

## Rollen
Welche Rollen aus der Rechtematrix dürfen dieses Feature nutzen, und was genau darf jede?

| Rolle | Darf | Darf nicht | Kriterium |
|---|---|---|---|
| | | | Jede Zeile verweist auf ein Akzeptanzkriterium mit ID |

## Akzeptanzkriterien
Jedes Kriterium mit Ja/Nein prüfbar. IDs bleiben stabil. Entfallene Kriterien werden als «entfallen» markiert, nie gelöscht. Priorität ist Muss, Soll oder Kann. Mindestens ein Kriterium beschreibt den Verbotsfall.

| ID | Priorität | Ausgangslage | Handlung | Erwartetes Ergebnis |
|---|---|---|---|---|
| ABK-01-AK01 | Muss | | | |
| ABK-01-AK02 | Soll | | | |
| ABK-01-AK03 | Muss | Nutzer ohne Berechtigung | Versucht, fremde Daten zu lesen oder zu ändern | Zugriff verweigert, keine Daten sichtbar |

## Randfälle
| ID | Priorität | Situation | Erwartetes Verhalten |
|---|---|---|---|
| ABK-01-RF01 | Soll | Fehler, leere Daten, doppelter Klick, fehlende Rechte | |

## Nicht dabei
<Was ausdrücklich nicht zum Feature gehört.>

## Referenzen
<Screenshots des gewünschten Designs, Beispielcode, bestehende Dokumentation. Ablage unter `docs/specs/<feature>/referenzen/`, hier mit Dateiname und einem Satz, wofür sie dienen.>

## Offene Fragen
<Sichtbar, nicht still beantwortet. Jede Frage bekommt eine ID `<ABK>-01-OF<nr>`. Wird sie beantwortet, entsteht daraus ein Kriterium oder Randfall, und die OF-ID wird als «entfallen» markiert.>

## Entscheidungen
| Entscheidung | Begründung |
|---|---|
| | |
