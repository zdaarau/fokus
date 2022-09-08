### Freitextfelder

Sieht eine Frage als eine der Antwortoptionen ein Freitextfeld vor, so resultiert neben der ursprünglichen Variable gemäss diesem Fragebogen immer eine zusätzliche Variable `<VARIABLENNAME>_custom`, welche die entsprechenden Freitextantworten enthält.

**Beispiel:**

Die Frage zur Parteisympathie (Variablenname `favored_party`) kennt die Antwortoption `eine andere, nämlich: ✍ (Freitextfeld)`. Dementsprechend resultieren im Datensatz – sofern die Frage keine [Mehrfachnennungen](#mehrfachnennungen) erlaubt und keine ungewollten Mehrfachnennungen im Print-Fragebogen auftreten – die folgenden beiden Variablen:

1. `favored_party`: Weist die "normale" Ausprägung gemäss diesem Fragebogen auf, im Falle einer Freitextantwort also `90`.
2. `favored_party_custom`: Weist im Falle einer Freitextantwort (`favored_party = 90`) die genannte Antwort im Volltext auf, andernfalls keinen Wert (`NA`).
