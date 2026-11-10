---
name: architektur-entwerfen
description: Schreibt die kurze Umsetzungsskizze zu einer Spec (Daten mit Zugriffsregeln, Rechte, Abhängigkeiten, Kosten) und weist nach, dass jedes Kriterium abgedeckt ist. Verwende ihn nur, wenn ein Feature Daten, Rollen, Abhängigkeiten oder externe Dienste neu einführt oder ändert, oder wenn Marc «Architektur», «Datenmodell» oder «wie bauen wir das» sagt.
---

# Umsetzungsskizze

Legt das Wie fest, bevor Code entsteht, damit der Agent nichts neu erfindet, was es schon gibt. Für Features ohne neue Daten, Rollen, Abhängigkeiten oder Dienste entfällt dieser Schritt.

## Vorgehen

1. Lies den Ist-Zustand, soweit er das Feature betrifft: Architektur und Entscheidungen des Projekts (auch ADRs), das betroffene Datenmodell im Code, die Spec. Lies gezielt, nicht alles.
2. Entscheide Technisches selbst und halte dich an den vorhandenen Stack (Stufe B). Jede Entscheidung bekommt eine Zeile am Ort, den das Projekt dafür hat (`docs/decisions.md` oder ADR).
3. Sammle, was bei Marc liegt (Stufe C): neue Abhängigkeit, Kosten, neue Rolle oder Datenart, Änderung an bestehenden Daten, Widerspruch zur Spec. Diese Punkte gehen als Auswahlfragen in die Freigabe der Spec, nicht als eigene Runde.
4. Schreibe die Skizze nach `assets/skizze.md`, höchstens eine Seite, an den Ort der Architektur des Projekts.

## Inhalt

- Daten. Neue oder geänderte Tabellen und Felder in fachlichen Namen, mit Zugriffsregel. Zuerst prüfen, ob es Passendes schon gibt.
- Rechte. Welche Rolle darf was, und wo wird es auf der Datenebene durchgesetzt. Die Oberfläche blendet nur aus.
- Abhängigkeiten. Nur wenn nötig, bevorzugt aus dem vorhandenen Stack. Vor dem Vorschlag in der Registry prüfen: Existenz, Betreuer, Alter, Lizenz, Ähnlichkeit zu bekannten Namen.
- Externe Dienste mit erwarteten Kosten und nötigen Limits.
- Was nur Marc erledigen kann (Schlüssel, Dashboards, Domains).
- Abdeckung. Pro Spec-ID ein Stichwort, wodurch sie erfüllt wird. Unabgedecktes wird benannt.

## Wenn die Spec nicht passt

- Setzt sie etwas voraus, das es nicht gibt (zum Beispiel eine Anmeldung), entwirf den Rest, benenne die Lücke und schlage dafür ein eigenes Feature vor. Erweitere die Spec nicht selbst.
- Rechte und Verbote ohne ID meldest du als Lücke der Spec.

## Abschluss

Die Skizze geht mit der Spec in dieselbe Freigabe. Nenne Marc nur die Entscheidungen, die er treffen muss, die Kosten und was er selbst erledigen muss. Technische Einzelheiten stehen in der Datei.
