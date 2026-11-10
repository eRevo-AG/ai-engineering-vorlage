---
paths:
  - "docs/specs/**"
---

# Konventionen für Spezifikationen

- Ein Feature, eine Spec. Änderungen erweitern die bestehende Spec, es entsteht keine zweite.
- Die Spec beschreibt das Was. Keine Technik, kein Code, kein Status, kein Datum.
- Jedes Kriterium hat eine stabile ID (`<ABK>-<nr>-AK<nr>`, Randfälle `-RF<nr>`, offene Fragen `-OF<nr>`), eine Priorität (Muss, Soll, Kann) und das Muster Ausgangslage, Handlung, erwartetes Ergebnis.
- IDs werden nie umnummeriert oder wiederverwendet. Entfallene Kriterien werden als «entfallen» markiert, nicht gelöscht.
- Jedes «Darf» und «Darf nicht» der Rollentabelle hat ein eigenes Kriterium. Mindestens ein Kriterium beschreibt den Verbotsfall.
- Sichtbare Texte, die geprüft werden sollen, stehen wörtlich in der Spec.
- Unklares steht bei den offenen Fragen und wird nicht still beantwortet.
- Eine freigegebene Spec ändert nur Marc oder der Agent nach Marcs ausdrücklicher Freigabe. Stimmt sie beim Bauen nicht, stoppen und melden.
