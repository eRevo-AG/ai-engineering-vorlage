---
name: projekt-analysieren
description: Analysiert ein bestehendes Coding-Projekt, bevor der AI Engineering Standard darübergelegt wird. Erfasst den Ist-Zustand (Stack, Befehle, Struktur, Datenmodell, Rechte, Abhängigkeiten, Testlage, Auffälligkeiten), gewinnt Features und Anforderungen rückwärts aus dem Code, macht einen Sicherheits-Schnellcheck und legt Gerüst und Charakterisierungstests als Plan an. Verwende diesen Skill immer, wenn Marc in einem Repository mit vorhandenem Code einsteigt, wenn er «analysier das Projekt», «bestehende App», «übernimm das Projekt», «was kann das System schon», «Ist-Zustand» oder «hol die Specs aus dem Code» sagt, und bevor ein Umbau oder eine Erweiterung an Code ohne Dokumentation beginnt.
---

# Bestehendes Projekt analysieren

Bei einem bestehenden Projekt gilt zuerst Verstehen. Der Standard darf dem Projekt nicht übergestülpt werden, denn er würde Anforderungen vorgeben, die der Code nie hatte, und einen Stack ersetzen, den das Projekt schon hat.

Dieser Skill ändert keinen Anwendungscode. Er liest, dokumentiert und schlägt vor. Rückwärts gewonnene Anforderungen sind Hypothesen und gelten erst, wenn Marc sie bestätigt hat.

Marc beantwortet Entscheidungen lieber als Auswahl. Nutze AskUserQuestion mit klaren Optionen, die empfohlene Option zuerst.

## Vorbereitung

Frage Marc in einer kurzen Runde (AskUserQuestion)

- Ziel der Analyse: «Neues Feature bauen», «Bestehendes umbauen oder bereinigen», «Absichern vor Livegang», «Nur Überblick».
- Stufe, nach der das Projekt geführt werden soll: Prototyp, Standard oder Produktiv.
- Läuft das Projekt bereits mit echten Nutzern und Daten? Ja oder nein. Bei ja gelten Änderungen als besonders riskant, und der Agent plant zuerst Absicherung.
- Was glaubt Marc über Rechte? «Es gibt Rollen mit unterschiedlichen Rechten», «Alle dürfen alles», «Nur angemeldete Nutzer», «Weiss ich nicht». Seine Annahme brauchst du, um Abweichungen zwischen Annahme und Code zu erkennen.

## Analyse (nur lesen)

Arbeite in dieser Reihenfolge und halte Fundstellen im Format `Datei:Zeile` fest.

1. Stack und Werkzeuge. Sprache, Framework, Paketverwaltung, Versionen. Befehle zum Starten, Testen und Bauen aus Skripten, Readme oder CI-Dateien. Befehle, die nicht stimmen, meldest du, du rätst keine.
2. Struktur. Wichtigste Ordner, Einstiegspunkte, Aufteilung in Oberfläche, Server und Daten.
3. Datenmodell. Tabellen oder Modelle, Felder, Beziehungen, Migrationen. Ob das Schema wirklich angewendet wird, prüfst du mit.
4. Rollen und Rechte im Ist-Zustand. Was erzwingt der Code wirklich (zum Beispiel Row Level Security, serverseitige Prüfungen) und was nur die Oberfläche? Vergleiche mit Marcs Annahme aus der Vorbereitung und nenne Abweichungen.
5. Abhängigkeiten. Pakete, Lockfile vorhanden, ungenutzte, auffällig veraltete oder unbekannte Pakete. Prüfe verdächtige Namen auf Existenz, Alter, Betreuer und Verbreitung. Darf nichts installiert werden, bewertest du ein verdächtiges Paket nur aus den Metadaten der Registry und liest oder installierst es nicht. Lizenzen, soweit erkennbar.
6. Testlage. Welche Tests gibt es, laufen sie (führe sie aus, falls der Befehl bekannt und ungefährlich ist), wie viele laufen, was ist abgedeckt?
7. Externe Dienste und Kosten. Schnittstellen, Schlüssel (nur Namen, nie Werte), Limits.
8. Verhalten ausprobieren, soweit gefahrlos in einer Testumgebung. Fehler und Unstimmigkeiten, die keine Sicherheitsfunde sind (zum Beispiel Daten, die nicht gespeichert werden), kommen in den Abschnitt «Auffälligkeiten im Verhalten».
9. Sicherheits-Schnellcheck. Zugangsdaten im Code oder in versionierten Dateien (nur melden, nicht ausgeben), fehlende `.gitignore`-Einträge, ungeschützte Schnittstellen, fehlende Eingabeprüfung, Schutz gegen Passwort-Ausprobieren.

Lies keine `.env`-Dateien und gib keine Zugangsdaten aus. Findest du welche, nenne nur Datei und Art. Alles, was du zum Ausprobieren installierst oder erzeugst (virtuelle Umgebung, Kopie der App, Datenbankdatei), entsteht im Scratchpad oder in einem Temp-Ordner ausserhalb des Projekts und wird danach gelöscht.

## Dokumente anlegen

Lege an oder ergänze, ohne Vorhandenes zu überschreiben.

- `docs/ist-zustand.md` nach `assets/ist-zustand.md` mit den Ergebnissen der Analyse
- `docs/features.md` mit den erkannten Features. Der Status ist «Bestand (ungeprüft)», bis ein Prüfbericht vorliegt. Vorlage im Skill `projekt-starten`.
- Pro erkanntem Kernfeature (nicht pro Funktion) eine Spec als Entwurf unter `docs/specs/`, nach der Vorlage im Skill `spec-schreiben`. Das ID-Schema ist das des Standards (`<KÜRZEL>-<Featurenummer>-AK<nr>`). In der Kopfzeile steht der Vermerk «Herkunft: rückwärts gewonnen, ungeprüft». Das ist die Ausnahme von der Regel, dass die Spec keinen Status enthält. Kriterien beschreiben das Verhalten, das der Code tatsächlich zeigt. Bei reinen API-Produkten dürfen Pfad und Methode in den Kriterien stehen, weil sie das Verhalten ausmachen. Bei Fehlern oder Auffälligkeiten schreibst du keine Soll-Anforderung, sondern eine offene Frage an Marc (`<ABK>-01-OF<nr>`). Die Pflicht der Spec-Vorlage zu einem Verbotskriterium gilt hier nicht. Fehlt im Ist-Zustand jede Verweigerung, hältst du das als Ist-Verhalten fest (zum Beispiel «Zugriff ohne Anmeldung erlaubt») und verweist auf die offene Frage dazu.
- `docs/architecture.md` mit Teilen, Datenmodell und der Rechtematrix im Ist-Zustand, Status «Entwurf, nicht freigegeben». Gewünschte Abweichungen gehören in offene Fragen.
- `docs/decisions.md` mit den erkennbaren Stack-Entscheidungen, Status «vorgeschlagen» (bis Marc sie bestätigt), Quelle «aus dem Code abgeleitet», Grund «nicht überliefert», wo er sich nicht ermitteln lässt.
- `CLAUDE.md` nach dem Muster aus dem Skill `projekt-starten`, mit den echten Befehlen. Es gelten dieselben Regeln für Platzhalter wie dort: Befehle, die nicht ermittelt sind, stehen als `<…>`, Befehle mit Argument als Muster. Nutzt Marc mehrere Coding Agents (erkennbar an AGENTS.md, `.cursorrules` oder `.github/copilot-instructions.md` im Repository, sonst fragst du kurz), liegt die gemeinsame Quelle in AGENTS.md. Standardannahme ist «Nur Claude Code».
- `.claude/settings.json` aus den Bausteinen des Skills `projekt-starten`. Lege sie nur mit `settings.basis.json` an (Schutzregeln, ohne Platzhalter) und ergänze nur Allow-Einträge und Hooks, deren Befehle bekannt sind. Hooks und Einträge ohne bekannten Befehl lässt du weg. Start-Befehle mit Nebenwirkungen (Server starten, Datenbankdatei anlegen) gehören nicht in Allow. Sage Marc, dass die Datei ab dem Anlegen gilt.
- Leere Ordner `docs/specs/`, `docs/plans/` und `docs/reports/` (mit `.gitkeep`), soweit sie nicht schon durch Dokumente existieren, weil die CLAUDE.md auf sie verweist.
- `.gitignore`: lege sie an oder ergänze fehlende Einträge (`.env`, `.env.*`, `secrets/`, `.claude/settings.local.json`, Caches, virtuelle Umgebungen, lokale Datendateien wie `*.db`), ohne Vorhandenes zu überschreiben. Gerade bei einem Repository ohne Commit ist sie dringend, damit Zugangsdaten und Daten nicht im ersten Commit landen.

Die Vorlagen für CLAUDE.md, Architektur, Entscheidungen, Features und Einstellungen liegen im Skill `projekt-starten`, die für Specs im Skill `spec-schreiben` und die für Pläne im Skill `ai-engineering-standard`.

## Charakterisierungstests planen

Bevor etwas umgebaut wird, hält man das heutige Verhalten in Tests fest, auch das fehlerhafte. Diese Tests beschreiben nicht, wie es sein soll, sondern wie es ist, und schützen vor unbeabsichtigten Änderungen.

Lege `docs/plans/absicherung.md` an. Der Plan beginnt mit der Aufgabe «Testumgebung einrichten» (neue Abhängigkeiten für Tests werden wie jede Abhängigkeit geprüft und in `docs/decisions.md` eingetragen). Danach folgt je eine Aufgabe pro Kernverhalten, jeweils mit Verweis auf die Spec-Entwurf-ID, die sie absichert.

- Die Regel «Test erst rot» gilt hier nicht, denn Ist-Verhalten ist sofort grün. Stattdessen belegt der Plan, dass jeder Test fehlschlagen kann, indem man kurz eine geänderte Kopie des Codes dagegen laufen lässt.
- Tests, die fehlerhaftes Verhalten festhalten (zum Beispiel Datenverlust), tragen die Markierung «bekannter Fehler». Sie beschreiben, was der Code tut, und werden nie zum Soll. Wird der Fehler später behoben, dreht sich der Test bewusst um.
- Der Nachweis, dass ein Test fehlschlagen kann, gilt pro Test. Ein einmaliger Sammelnachweis genügt nicht.
- Die Tests werden erst gebaut, wenn Marc den Plan freigegeben hat. Bekannte Fehler werden markiert, nicht still korrigiert.

## Abschluss

Schreibe eine Freigabe-Zusammenfassung in Alltagssprache.

- Was ist das für ein Projekt, und in welchem Zustand ist es?
- Die grössten Risiken (Sicherheit, fehlende Tests, Abhängigkeiten, Funktionsfehler)
- Abweichungen zwischen Marcs Annahme und dem Code, besonders bei Rechten
- Was wurde angelegt, was ist unklar und braucht Marcs Antwort?
- Empfohlener nächster Schritt passend zum Ziel der Analyse

Frage Marc, ob er die rückwärts gewonnenen Entwürfe bestätigt, ändert oder verwirft. Erst bestätigte Entwürfe werden zu Specs mit Status «Spec freigegeben». Danach folgt der normale Ablauf des Standards, und bei Stufe Produktiv zuerst die Absicherung.

Committe und pushe nichts, solange Marc es nicht ausdrücklich verlangt.
