##  EXCELs  Aggregatoren

EXCEL liefert viele *Aggregatoren*. Wir wissen bereits, dass es für einige mathematische Operationen neben einen Operator zusätzlich auch Aggregatoren gibt. Beispiele dafür sind die Funktionen `SUMME()` und `PRODUKT()`. 

### Unterschiede zwischen EXCELs Aggregatoren und ihre Operatoren

<p class="alert alert-warning" markdown=1>
**Merke:** EXCELs Aggregatoren *ignorieren* fehlende Werte, die Operatoren jedoch nicht. Fehlende Werte stellt EXCEL durch die *leere Zelle* dar.
</p>

### Gierige Aggregatoren

<p class="alert alert-primary" markdown=1>
**Definition:** Eine Funktion wird als **gierig** (*engl. greedy*) bezeichnet, wenn Sie nur alle *potentiellen* Parameter verarbeitet. 
</p>

<p class="alert alert-success" markdown=1>
**Merke:** EXCELs Aggregatoren sind grundsätzlich gierig, Operatoren nicht. 
</p>

Diese Eigenschaft lässt sich am Beispiel der `SUMME()`-Funktion veranschaulichen.

Gegeben sind die beiden Vektoren `V1` und `V2` als dynmaische Felder in den Zellen `A2#` und `B2#`.

| V1 | V2 |
|---:|---:|
| 1	|  1 |
| 2 |	4 |
| 3 |	7 |
| 4 |	10 |
| 5 |	13 |
| 6 |	16 |
| 7 |	19 |
| 8 |	22 |
| 9 |	25 |
| 10 |	28 |

Wir können die Summe der einzelnen Zeilen mit der Addition mit der Formel `=A2# + B2#` bestimmen. Diese Formel funktioniert gut für zwei Vektoren. Wenn wir mehr Vektoren haben, würden wir normalerweise die `SUMME()` Funktion für den Bereich verwenden. Die Formel `=SUMME(A2#; B2#)` hat aber als Ergebnis den Wert `200` und nicht die Zeilensummen. Die Funktion `SUMME()` verhält sich in diesem Fall *gierig*, weil sie alle verfügbaren Werte aggregiert und nicht wie der Operator nur die Zeilen. Wir können einzelne Zellen in Bereichen relativ zueinander mit Hilfe des `@`-Operators auswählen. Dieser Operator funktioniert leider nicht mit den