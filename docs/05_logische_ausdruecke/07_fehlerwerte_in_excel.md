In Excel ergeben unsere Formeln gelegentlich einen Fehler als Ergebnis. Das kann z.B. in den folgenden Fällen passieren:

* Wenn wir unsere Daten durchsuchen und keine Treffer erhalten. 
* Wenn wir in Formeln Adressen oder Bereiche verwenden, die Fehlerwerte enthalten, dann ist das Ergebnis jeder Formel der erste Fehlerwert im referenzierten Bereich. 

Weil Fehlerwerte das normale Verhalten der meisten Funktionen unterbrechen, können wir in Excel Fehlerwerte nicht auf Gleichheit oder Ungleichheit überprüfen.

<p class="alert alert-info" markdown="1">
In R gibt es keine Entsprechung, weil Fehler zum sofortigen Ende eines Programms führen. Die einzige "Ausnahme" ist die Division durch ``0``: Das Ergebnis der Division durch 0 ist in R  ``Inf``, was für den Wert "unendlich" steht. ``Inf`` ist in R ein numerischer Wert, den wir entsprechend behandeln dürfen.
</p>

Mit den folgenden Funktionen, können wir Fehlerwerte in Excel richtig behandeln: 

* `ISTFEHLER()`
* `FEHLER.TYP()`
* `WENNFEHLER()`
* `WENNNV()`

Die Funktion `ISTFEHLER()` wurde bereits oben beschrieben. 

Die Funktion `FEHLER.TYP()` gibt für einen Fehler eine Zahl zurück, die für die Art des Fehlers steht. Ist der Parameter *kein Fehler*, dann gibt diese Funktion den Fehlerwert `#NV` zurück. 

Die Funktion `WENNFEHLER(FORMEL; FALLSFEHLER)` ist eine  Kurzform für: `WENN(ISTFEHLER(FORMEL); FALLSFEHLER; FORMEL)`. 

Beispiel: 

```
=WENNFEHLER(FEHLER.TYP(A1); "Kein Fehler")
```

<p class="alert alert-warning" markdown="1">
Wir verwenden die ``WENNFEHLER()``-Funktion, um Formeln vor der Fehlerfortpflanzung zu schützen!
</p>

Die Funktion `WENNNV()` ist eine spezielle Variante von `WENNFEHLER()`, die nur den Fehlerwert `#NV` behandelt. 
