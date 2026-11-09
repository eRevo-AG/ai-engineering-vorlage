# Betrieb, Git, CI und Deployment

Dieser Teil ergänzt den Blueprint, der Livegang und Betrieb nur am Rand behandelt. Er ist eine Ergänzung dieses Skills und kein Teil des Originals. Was hier steht, gilt je nach Projektstufe.

Inhalt: Git-Ablauf, Tests und CI, Umgebungen und Deployment, Livegang-Check, Betrieb

---

## Git-Ablauf (ab Stufe Standard)

- Ein Feature, ein Zweig. Der Zweigname enthält das Feature-Kürzel, zum Beispiel `feature/nutz-01-login`.
- Nie direkt auf den Hauptzweig. Nie Force-Push auf geteilte Zweige. Nie die Historie umschreiben ohne Marcs Rückfrage.
- Ein Commit pro erledigter Aufgabe aus dem Plan, mit der Aufgaben-ID und den erfüllten Anforderungs-IDs in der Nachricht. So ist jeder Haltepunkt gleichzeitig ein geprüfter Zwischenstand.
- Commits und Pushes macht der Agent nur auf Marcs Wunsch. Fragt Marc nach einem Abschluss, fasst der Agent zusammen, was committet würde.
- Ein Pull Request pro Feature, mit Verweis auf Spec und Prüfbericht. Der Prüfbericht liegt im Zweig, damit die Freigabe nachvollziehbar bleibt.
- Der Hauptzweig ist immer lauffähig. Er enthält nur Features, deren Prüfbericht Marc freigegeben hat.

Falle. Der Agent committet halbfertige Arbeit «nur kurz» in den Hauptzweig, und der nächste Chat baut darauf. Ein Zweig pro Feature verhindert das.

---

## Parallele Sitzungen

Mehrere Agenten gleichzeitig zu betreiben spart Zeit, solange sie sich nicht in die Quere kommen.

- Jede parallele Sitzung arbeitet in einem eigenen Git-Zweig und einer eigenen Arbeitskopie (Worktree). Zwei Agenten im selben Ordner überschreiben sich gegenseitig.
- Parallel laufen nur Aufgaben, die der Plan als unabhängig markiert hat und die verschiedene Dateien und Bereiche betreffen.
- Jede Sitzung liest zu Beginn die Projektdokumente und meldet am Ende ihren Stand im Plan. Marc ist der Teamleiter, der Ergebnisse abnimmt und die nächste Aufgabe anstösst.
- Die Zusammenführung der Zweige geschieht erst nach der Prüfung des jeweiligen Features und mit Marcs Freigabe.
- Die Anzahl gleichzeitiger Sitzungen richtet sich nach dem Nutzungslimit. Mehr Agenten verbrauchen es schneller.

---

## Tests und CI

- Die Testbefehle stehen in der CLAUDE.md des Projekts (alle Tests, betroffene Tests, Production-Build). Sie sind die einzige Quelle. Der Agent rät keine Befehle.
- Ab Stufe Produktiv läuft die CI bei jedem Pull Request mit allen Tests und dem Production-Build. Ein roter Lauf blockiert die Freigabe.
- Die CI meldet die Anzahl gelaufener Tests. Null gelaufene Tests lassen den Lauf fehlschlagen.
- Ab Stufe Produktiv prüft ein Dependency-Scanner bei jedem Pull Request neue und geänderte Abhängigkeiten, und Lizenzen werden mitgeprüft, wenn das Produkt weiterverkauft wird (Details in `leitplanken-technik.md`).
- Die CI-Konfiguration ist Teil des Repositories und wird wie Code geprüft. Aktionen von Drittanbietern stehen auf einem festen Commit-Hash, und die CI-Zugangsdaten tragen nur die nötigen Rechte. Zugangsdaten gehören in die Secret-Verwaltung der CI, nie in die Dateien.

Falle. Lokal grün, in der CI rot, weil Umgebungsvariablen oder Versionen abweichen. Deshalb stehen die benötigten Variablennamen (ohne Werte) und Versionen in der CLAUDE.md.

---

## Umgebungen und Deployment (ab Stufe Produktiv)

- Mindestens zwei Umgebungen. Staging zum Prüfen, Produktion für Nutzer. Der Prüfer arbeitet gegen Staging.
- Der Agent deployt nur nach Marcs Freigabe, und nie nach Produktion ohne bestandenen Prüfbericht.
- Variablen und Secrets pro Umgebung getrennt. Die Namen stehen dokumentiert, die Werte setzt Marc selbst und der Plan führt das als Aufgabe «nur Marc».
- Datenbankänderungen laufen als nachvollziehbare Migrationen, nie als manuelle Eingriffe. Destruktive Migrationen braucht Marcs ausdrückliche Freigabe.
- Vor jedem Deployment ist klar, wie man zurückgeht (Rollback). Fehlt ein Rückweg, ist das ein Blocker und wird gemeldet.

---

## Livegang-Check (Stufe Produktiv)

Vor dem ersten Livegang und vor grösseren Releases geht der Agent diese Liste durch und meldet jede offene Zeile an Marc.

- Alle Prüfberichte der enthaltenen Features sind freigegeben.
- Production-Build läuft, alle Tests grün mit genannter Anzahl.
- Alle Umgebungsvariablen der Produktion sind gesetzt (Namen abgleichen, Werte nicht lesen).
- Rechtematrix ist umgesetzt und mit mehreren Testkonten geprüft.
- Datenschutz geklärt, bevor echte Nutzer echte Daten eingeben (Datenerhebung, Speicherort, Aufbewahrung, Löschung, Hinweise für Nutzer). Der Agent erstellt dafür eine Übersicht, ersetzt aber keine Rechtsberatung.
- Backups der Datenbank sind eingerichtet und die Wiederherstellung wurde einmal getestet.
- Fehler-Tracking und Protokollierung sind aktiv, ohne dass Passwörter oder persönliche Daten in Logs landen.
- Schutz gegen Ausprobieren von Passwörtern bei Login und Registrierung ist aktiv.
- Abhängigkeiten sind gescannt, Lizenzen geklärt, und jede Abhängigkeit steht mit Begründung in `docs/decisions.md`.
- Kosten- und Rate-Limits für externe Dienste und öffentliche Schnittstellen sind gesetzt, Budgetalarme eingerichtet.
- Agenten haben keine Produktionszugänge, und Testumgebungen enthalten keine echten Personendaten.
- Rollback ist beschrieben.
- Offene Einstellungen, die nur Marc vornehmen kann (Domains, DNS, Dashboards, Schlüssel), sind erledigt.

---

## Betrieb nach dem Livegang

- Fehler aus dem Betrieb werden wie jede Änderung behandelt. Gibt es eine verletzte Anforderung, wird die Spec geprüft und der Test ergänzt, bevor der Fix gebaut wird. So kehrt derselbe Fehler nicht zurück.
- Zugriffsrechte und Abhängigkeiten werden regelmässig geprüft (veraltete Pakete, bekannte Sicherheitslücken). Der Agent meldet Funde und aktualisiert nicht ungefragt grosse Versionssprünge.
- Das Setup selbst wird in der Pflege geprüft (siehe `bausteine.md` Teil 08).
