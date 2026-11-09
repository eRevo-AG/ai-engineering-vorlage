# Architektur

Das Wie des Projekts. Stack-Vorgaben stehen einmal hier und werden nicht pro Feature neu hergeleitet. Entscheidungen mit Alternativen stehen in `docs/decisions.md`. Der Agent liest dieses Dokument vor jeder neuen Architektur, damit er nichts neu erfindet, was es schon gibt.

## Teile
<Oberfläche, Server, Daten und wie sie zusammenhängen.>

## Stack und Befehle
<Stack, Versionen, wie man startet, testet und baut. Die Befehle stehen auch in der CLAUDE.md.>

## Rollen und Rechtematrix
Status <Entwurf oder von Marc freigegeben am Datum>. Neue Rollen oder Datenarten erweitern die Matrix, bevor ein Feature sie nutzt. Ist die Antwort «nur ich, kein Login», steht das hier als Entscheidung.

Anmeldung. <E-Mail und Passwort, Magic Link, Single Sign-on, keine.> Dazu der Schutz gegen Ausprobieren von Passwörtern bei Login und Registrierung <Umsetzung>.

Oberfläche. <Sprache und Formate, zum Beispiel Deutsch (Schweiz), CHF, Datum als 28.08.2026.>

| Datenart | <Rolle 1> | <Rolle 2> | Besucher ohne Anmeldung |
|---|---|---|---|
| <Datenart> | sehen, anlegen, ändern, löschen (nur eigene oder alle) | | |

Verwaltung. <Wer legt Nutzer an, wer vergibt Rollen, was geschieht mit den Daten beim Löschen eines Nutzers.>

Durchsetzung. <Wo die Regeln technisch greifen, zum Beispiel Row Level Security auf der Datenebene.>

## Datenmodell
<Tabellen, Felder, Beziehungen, jeweils mit Zugriffsregeln.>

## Verhalten
<Zustände, Abläufe, Fehlerfälle.>

## Datenschutz
<Welche personenbezogenen Daten werden erhoben, wo gespeichert, wie lange aufbewahrt, wie gelöscht, wer hat Zugriff? Hinweise für Nutzer. Vor echten Nutzerdaten von Marc geklärt. Der Agent ersetzt keine Rechtsberatung.>

## Externe Dienste und Kosten
<Dienste, erwartete Kosten, Limits und Budgetalarme, die Marc setzt.>

## Nur Marc kann
<Dashboard-Einstellungen, API-Keys, Domains, Limits.>

## Abhängigkeiten
<Jede Abhängigkeit mit Verweis auf ihren Eintrag in `docs/decisions.md`.>

## Vorgemerkte Aufgaben für den ersten Plan
<Aufgaben, die beim Projektstart aufgefallen sind und in den ersten Plan gehören, zum Beispiel Stop-Hook aktivieren, Migrations-Hook, Prüfung der Stack-Pakete. Der Plan übernimmt sie und streicht sie hier.>

## Offene Fragen
<Sichtbar, nicht still beantwortet. Wer beantwortet sie?>

## Feature-Abschnitte
<Pro Feature ein Abschnitt, hinzugefügt vom Skill `architektur-entwerfen`.>
