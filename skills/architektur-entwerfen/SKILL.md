---
name: architektur-entwerfen
description: Entwirft die Architektur eines Features nach einer freigegebenen Spec, im Plan Mode. Liest Ist-Zustand, Rechtematrix und Entscheidungsprotokoll, schlägt Teile, Datenmodell mit Zugriffsregeln, Verhalten und Abhängigkeiten vor, stellt Entscheidungen als Auswahlfragen, weist nach, dass jede Anforderung abgedeckt ist, und holt Marcs Freigabe. Teil des AI Engineering Standards, Schritt 2 pro Feature. Verwende diesen Skill immer, wenn eine Spec freigegeben ist und das Feature gebaut werden soll, wenn Marc «Architektur», «Datenmodell», «wie bauen wir das», «Technik», «Datenbank» oder «Systemdesign» sagt, und bevor Code für ein neues Feature oder eine neue Abhängigkeit entsteht.
---

# Architektur entwerfen

Dieser Skill legt das Wie fest, bevor Code entsteht. Marc soll es lesen und freigeben können, ohne Entwickler zu sein. Er endet mit einer Frage an Marc und nicht mit dem Build.

Warum es ihn gibt: Der Agent kennt sonst nur das Feature, nicht das Projekt. Er erfindet Tabellen neu, die es schon gibt, schlägt Bibliotheken vor, die das Projekt nicht nutzt, und baut Strukturen, die mit dem Rest brechen. Der Ist-Zustand muss deshalb vor jedem Entwurf gelesen werden.

Arbeite im Plan Mode, falls verfügbar. Du schreibst nur Dokumente und baust nichts. Marc beantwortet Entscheidungen lieber als Auswahl. Nutze AskUserQuestion mit der empfohlenen Option zuerst und je einem Satz zu Vor- und Nachteilen. Ist AskUserQuestion nicht verfügbar, stelle die Auswahl im Text mit nummerierten Optionen und Empfehlung.

## Voraussetzungen

Prüfe vor dem Start und stoppe bei einem Fehlen.

- Die Spec des Features ist freigegeben (Status in `docs/features.md`). Sonst verweise auf `spec-schreiben`.
- `docs/architecture.md` mit Stack und Rechtematrix existiert. Sonst verweise auf `projekt-starten` oder `projekt-analysieren`.
- Die Rechtematrix trägt einen Freigabevermerk von Marc. Trägt sie nur den Status «Entwurf», stelle Marc zuerst diese Auswahlfrage, bevor du weiterarbeitest: «Matrix zuerst separat freigeben» oder «Matrix gemeinsam mit der Architektur zur Freigabe vorlegen» (empfohlen). Baue nie stillschweigend auf einem Entwurf auf. In beiden Fällen gilt die Architektur erst als freigegeben, wenn die Matrix freigegeben ist.

## Ist-Zustand lesen

Lies in dieser Reihenfolge und nenne Marc kurz, was du gefunden hast.

1. `docs/architecture.md` mit Teilen, Stack, Rechtematrix und Datenmodell
2. `docs/decisions.md`. Vorschläge, die dort als verworfen stehen, machst du nicht noch einmal.
3. Das tatsächliche Datenmodell und die Struktur im Code (Migrationen, Modelle, Ordner), soweit sie schon existieren. Stimmen Dokument und Code nicht überein, melde das, bevor du weiterarbeitest. Gibt es noch keinen Code, erwähne das nur kurz.
4. Die Spec des Features mit allen IDs, Rollen und Verbotskriterien
5. Die Zeilen in `docs/features.md`. Überschneidet sich die Spec mit einer anderen Zeile (zum Beispiel ein MVP-Feature, das schon in dieser Spec steckt), trage das als offene Frage ein.

## Wenn die Spec nicht passt

- Setzt die Spec etwas voraus, das nirgends spezifiziert ist (zum Beispiel «angemeldet», ohne dass es eine Anmeldung gibt), stoppe die Architektur für diesen Teil, melde es Marc und schlage ein eigenes Feature mit eigener Spec vor (ein Feature, eine Spec). Im Abdeckungsnachweis steht dazu die Zeile «Voraussetzung nicht abgedeckt». Den Rest des Features entwirfst du weiter, die fehlende Voraussetzung beschreibst du nur als Schnittstelle (zum Beispiel «angemeldeter Akteur» in den Teilen). In der Freigabefrage entscheidet Marc, ob der Plan vor der Spec des fehlenden Features starten darf. Eine Zeile «Entwurf» für das vorgeschlagene Feature kommt in `docs/features.md` erst nach Marcs Zustimmung. Du erweiterst die freigegebene Spec nicht selbst.
- Widerspricht die Rechtematrix der Spec, gilt für dieses Feature die Spec. Der Widerspruch steht in der Liste der Matrix-Änderungen, und Marc entscheidet.
- Enthält die Spec Rechte oder Verbote ohne ID (zum Beispiel nur in der Rollentabelle), melde das als Lücke der Spec. Ändern darf sie nur Marc. Im Abdeckungsnachweis führst du diese Punkte mit Beschreibung statt ID auf, damit sie nicht untergehen.
- Prioritäten der Spec (Muss, Soll, Kann) ändern nichts daran, dass Zugriffsregeln immer vollständig durchgesetzt werden.

## Entwurf

Ergänze `docs/architecture.md` um einen Abschnitt für das Feature nach `assets/architektur-abschnitt.md`. Baue nur, was die Spec verlangt, und nicht mehr.

- Teile. Welche bestehenden Teile werden berührt, welche kommen neu hinzu, und wie hängen sie zusammen? Schnittstellen zu anderen Features und der Akteur (wer ist angemeldet) gehören hierher.
- Datenmodell. Neue oder geänderte Tabellen und Felder mit Beziehungen und Zugriffsregeln. Präzise genug, dass niemand raten muss, aber kein Code. Das Datenmodell nennt fachliche Namen und keine Bezeichner aus dem Code. Prüfe zuerst, ob es eine passende Tabelle schon gibt.
- Rechte. Welche Rollen aus der Rechtematrix nutzen das Feature, und wo wird jede Regel auf der Datenebene durchgesetzt? Nummeriere die Zeilen (R1, R2) und im Verhalten die Punkte (V1, V2), damit der Abdeckungsnachweis auf stabile Elemente verweist. Braucht das Feature eine neue Rolle oder Datenart, schreibst du das als Änderung in die Liste im Abschnitt. Die Rechtematrix selbst änderst du erst, nachdem Marc zugestimmt hat.
- Verhalten. Zustände, Abläufe und was im Fehlerfall passiert, passend zu den Randfällen der Spec.
- Abhängigkeiten. Jede neue Abhängigkeit ist eine Entscheidung. Prüfe vor dem Vorschlag, ob das Paket existiert, wer es pflegt, wie alt es ist, wie viele Versionen es gibt, ob bekannte Projekte es nutzen und welche Lizenz gilt. Downloadzahlen oder Repository-Aktivität nennst du nur, wenn du sie wirklich ermittelt hast, sonst schreibst du «nicht gemessen». Prüfe auch die Ähnlichkeit zu bekannten Paketnamen. Als Mindestprüfung gleichst du den Namen mit den Abhängigkeiten bekannter Projekte ab und fragst die zwei bis drei nächstliegenden Schreibweisen (Tippfehler, Bindestrich statt Unterstrich, Zahlenanhang) in der Registry ab. Transitive Pakete prüfst du nicht einzeln. Lockfile und Audit-Werkzeug decken sie ab, und du vermerkst das. Ein Paket ohne Nutzungsgeschichte oder mit auffällig ähnlichem Namen schlägst du nicht vor. Bevorzuge, was das Projekt schon nutzt. Gehören Pakete zusammen, darfst du sie in einem Eintrag des Entscheidungsprotokolls bündeln. Ein Eintrag, der als «noch nicht geprüft» steht (zum Beispiel E01 beim Projektstart), wird nicht verändert. Die Prüfung bekommt einen eigenen Eintrag, der auf ihn verweist. Hast du die Pakete eines solchen Eintrags hier schon geprüft, vermerkst du das dort, und die Plan-Aufgabe reduziert sich auf eine erneute Versionsprüfung vor der Installation.
- Externe Dienste und Kosten. Was kostet das, und welche Limits und Budgetalarme muss Marc setzen?
- Nur Marc kann. Schlüssel, Dashboard-Einstellungen, Domains, Limits. Sichtbar auflisten, damit niemand erst beim Livegang davon erfährt.
- Annahmen (zum Beispiel Pflichtfelder, Sortierung) trägst du unter offene Fragen ein, damit sie nicht still gelten.

## Entscheidungen als Auswahl

Wo es echte Alternativen gibt (Datenhaltung, Bibliothek, Ablauf), stelle sie Marc als Auswahlfrage. Nenne pro Option Vor- und Nachteile in Alltagssprache und markiere deine Empfehlung. Trage jede Entscheidung mit Begründung und verworfenen Alternativen in `docs/decisions.md` ein, mit dem Status «vorgeschlagen». Mit Marcs Freigabe der Architektur wird er zu «gilt».

## Abdeckungsnachweis

Füge dem Feature-Abschnitt eine Tabelle hinzu: pro Spec-ID, welches Element der Architektur sie abdeckt. Eine Anforderung ohne Abdeckung ist eine Lücke. Schliesse sie vor der Freigabe oder melde sie als offene Frage. Das gilt auch für Verbotskriterien, die durch Zugriffsregeln abgedeckt sein müssen, sowie für Rechte und Verbote ohne ID (siehe oben).

## Freigabe

Schreibe die Freigabe-Zusammenfassung in Alltagssprache.

- Was wird gebaut, und was ändert sich am bestehenden System?
- Was sind die wichtigsten Entscheidungen und ihre Gründe?
- Risiken, Kosten und offene Punkte
- Was muss Marc selbst erledigen? Dazu gehören die Freigabe der Rechtematrix und die Antworten auf offene Fragen.
- Gibt es unabgedeckte Anforderungen oder Lücken in der Spec?

Frage Marc, ob er freigibt, ändern will oder ablehnt. Nach der Freigabe

1. setzt du in `docs/features.md` den Status «Architektur freigegeben»,
2. änderst du in `docs/decisions.md` die Status der Entscheidungen von «vorgeschlagen» zu «gilt»,
3. übernimmst du übergreifende Entscheidungen (zum Beispiel Oberfläche, Durchsetzung der Rechte, Datenhaltung) in die globalen Abschnitte von `docs/architecture.md` und löschst die dortigen Platzhalter,
4. ersetzt du im Feature-Abschnitt die Zeile «Freigabe durch Marc ausstehend.» durch «Freigegeben am <Datum> durch Marc.»

Als nächster Schritt folgt der Plan.
