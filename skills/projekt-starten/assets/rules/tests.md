---
paths:
  - "tests/**"
  - "**/*.test.*"
  - "**/*.spec.*"
  - "**/test_*.py"
  - "**/*_test.*"
---

# Konventionen für Tests

- Jeder Test trägt die Spec-ID im Namen oder Kommentar.
- Test zuerst, und er war einmal rot.
- Tests prüfen Verhalten aus der Spec, nicht Interna oder den genauen Wortlaut von Meldungen, ausser die Spec gibt ihn vor.
- Bestehende Tests nie ohne Begründung löschen, deaktivieren oder abschwächen.
- Zu jeder Rolle gibt es einen Test für den verweigerten Zugriff.
- Ergebnisse mit der Anzahl gelaufener Tests melden. Null Tests sind ein Fehler.
