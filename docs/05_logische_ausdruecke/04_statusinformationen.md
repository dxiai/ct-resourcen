In logischen Ausdrücken müssen wir gelegentlich überprüfen, ob Werte eine bestimmte Eigenschaft haben. Diese Eigenschaften bezeichnen wir als *Status*. Die wichtigsten Statusinformationen beziehen sich auf die Datentypen und die Existenz von Werten. In Excel und in R sind diese Informationen über spezielle Funktionen zugänglich. Diese Funktionen beginnen in Excel mit  `IST` und in R mit `is.`. All diese Funktionen geben einen Wahrheitswert zurück.

Die folgende Gegenüberstellung zeigt die wichtigsten Statusfunktionen  und stellt die gleichwertigen Funktionen in R und in Excel gegenüber.

| Excel |  R | Beschreibung |
| :--- | :--- | :--- | 
| `ISTZAHL()` |  `is.numeric()`| Gibt WAHR zurück, wenn der Wert ein numerischer Wert ist. |
| `ISTTEXT()` |  `is.string()` | Gibt WAHR zurück, wenn der Wert eine Zeichenkette ist. |
| `ISTLOG()` |  `is.logical()` | Gibt WAHR zurück, wenn der Wert ein Wahrheitswert ist. |
| `ISTLEER()` |  `is.na()` | Gibt WAHR zurück, wenn die Adresse (Excel) leer ist bzw. der Wert (R) `NA` ist. |
| `ISTFORMEL()` |  `is.function()` | Gibt WAHR zurück, wenn das Objekt eine Funktion ist (R) oder die Adresse eine Formel enthält.| 
| `ISTFEHLER()` |  - | Gibt WAHR zurück, wenn der Wert ein Fehlerwert ist. |
| - | `is.vector()` | Gibt WAHR zurück, wenn der Wert ein Vektor ist. |
