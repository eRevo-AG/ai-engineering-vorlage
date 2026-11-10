---
paths:
  - "tests/**"
  - "**/*.test.*"
  - "**/*.spec.*"
  - "**/test_*.py"
  - "**/*_test.*"
---

# Konventionen für Tests

- Jeder Test trägt die Spec-ID, die er prüft, im Namen oder Kommentar.
- Test zuerst. Der Test war nachweislich einmal rot, bevor er grün wird.
- Tests prüfen das Verhalten aus der Spec und nicht Interna (Variablennamen, Hilfsfunktionen, genauer Wortlaut von Meldungen), ausser die Spec verlangt es wörtlich.
- Bestehende Tests nie ohne Begründung löschen, deaktivieren oder abschwächen. Die Begründung steht im Bericht an Marc.
- Die geprüfte Einheit wird nicht durch eine Attrappe ersetzt.
- Zu jeder Rolle gibt es einen Test für den verweigerten Zugriff.
- Ergebnisse immer mit der Anzahl gelaufener Tests melden. Null Tests sind ein Fehler.
