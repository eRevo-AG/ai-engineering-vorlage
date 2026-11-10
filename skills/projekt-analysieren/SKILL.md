---
name: projekt-analysieren
description: Erfasst den Ist-Zustand eines bestehenden Coding-Projekts (Stack, Befehle, Daten, Rechte, Abhängigkeiten, Tests, Sicherheit) in einem kurzen Dokument, ohne Code zu ändern. Verwende ihn beim Einstieg in ein Repository mit vorhandenem Code ohne Dokumentation, oder wenn Marc «analysier das Projekt», «Ist-Zustand» oder «was kann das System» sagt.
---

# Bestehendes Projekt analysieren

Zuerst verstehen. Der Standard wird einem Projekt nicht übergestülpt. Dieser Skill liest und dokumentiert, er ändert keinen Anwendungscode. Was er aus dem Code ableitet, ist eine Hypothese, bis Marc sie bestätigt.

Hat das Projekt schon Anweisungen und Dokumente (AGENTS.md, Roadmap, ADRs, Feature-Dokumente, CI), nutze sie als Grundlage, lege nichts Paralleles an und melde nur, was fehlt oder veraltet ist.

## Eine Fragerunde

Höchstens vier Auswahlfragen, nur was sich nicht aus dem Repository ergibt.

- Ziel: «Neues Feature bauen», «Umbauen oder bereinigen», «Absichern vor Livegang», «Nur Überblick»
- Läuft es mit echten Nutzern und Daten? Ja oder nein
- Marcs Annahme zu Rechten: «Rollen mit unterschiedlichen Rechten», «Alle dürfen alles», «Nur Angemeldete», «Weiss ich nicht»
- Stufe: Standard (empfohlen), Prototyp, Produktiv

## Analyse

Nur lesen, gezielt suchen statt alles laden, Fundstellen als `Datei:Zeile`. Für breite Suchen einen Sub-Agenten mit kleinem Modell.

1. Stack, Versionen und die echten Befehle (starten, testen, bauen). Was nicht funktioniert, melden, nicht raten.
2. Datenmodell und ob das Schema wirklich angewendet wird
3. Rechte. Was erzwingt der Code auf der Datenebene, was nur die Oberfläche. Abweichung zu Marcs Annahme benennen.
4. Abhängigkeiten. Lockfile, ungenutzte, veraltete und verdächtige Pakete (nur aus den Metadaten der Registry bewerten, nicht installieren)
5. Tests. Wie viele, laufen sie, was ist abgedeckt
6. Sicherheit. Zugangsdaten im Code (nur Datei und Art nennen), fehlende `.gitignore`-Einträge, ungeschützte Schnittstellen, fehlende Eingabeprüfung
7. Verhalten kurz ausprobieren, in einer Kopie ausserhalb des Projekts, die du danach löschst. Auffälligkeiten festhalten.

Lies keine `.env`-Dateien und gib keine Zugangsdaten aus.

## Ergebnis

- `docs/ist-zustand.md` nach `assets/ist-zustand.md`, höchstens zwei Seiten
- Fehlt eine Anweisungsdatei, lege eine CLAUDE.md nach dem Muster aus `projekt-starten` an, nur mit geprüften Befehlen und Marcs Regeln. Keine aus dem Code abgeleitete Übersicht und kein Verzeichnisbaum.
- Fehlen Schutzregeln, lege `.claude/settings.json` mit `settings.basis.json` aus `projekt-starten` an (gilt sofort) und ergänze die `.gitignore`.
- Specs entstehen erst, wenn an einem Feature gearbeitet wird, dann mit `spec-schreiben` und dem Vermerk «rückwärts gewonnen». Fehler werden zu offenen Fragen, nicht zu Soll-Anforderungen.
- Vor einem Umbau halten Tests das heutige Verhalten fest, auch das fehlerhafte (als «bekannter Fehler» markiert). Sie sind sofort grün. Belege deshalb an einer kurz geänderten Kopie, dass sie fehlschlagen können.

## Abschluss

Melde in höchstens zwölf Zeilen: Zustand in einem Satz, die drei bis fünf grössten Risiken mit Schweregrad, Abweichungen zu Marcs Annahme, was angelegt wurde, der empfohlene nächste Schritt. Einzelheiten stehen in `docs/ist-zustand.md`.
