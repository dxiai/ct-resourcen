# EXCEL's Dynamische Felder

Manche Formeln erzeugen mehr als ein Ergebnis und können diese Ergebnisse in einen Bereich schreiben. Diese mehrfachen Ergebnisse erzeugen einen Ergebnisbereich, der als *dynamisches Feld* (dynamic Array) bezeichnet wird.

<p class="alert alert-success" markdown="1">
Mit Hilfe von dynamischen Feldern lässt sich sehr oft das fehleranfällige Autoauffüllen von Formeln vermeiden.
</p>

**Beispiel**

Gegeben sei die folgende Tabelle: 

| - | A |
| :---: | ---: |
| 1 | 40 |
| 2 | 72 |
| 3 | 33 | 

Für die Werte in Spalte A wollen wir jeweils ``14%`` berechnen und zu diesem Wert addieren.

Konventionell würden wir die folgende Formel schreiben: 

```EXCEL
= A1 * 14% + A1
```

Anschliessend müssten wir diese Formel für alle Werte auffüllen. 

Dynamische Felder erlauben es uns, solche Berechnungen in eine einzige Formel zu schreiben: 

```EXCEL
= A1:A3 * 14% + A1:A3
```

Der grosse Vorteil einer solchen Formel ist, dass EXCEL den Bereich automatisch anpasst, sodass die Formel auch dann noch funktioniert, wenn Zeilen hinzugefügt werden.

<p class="alert alert-success" markdown="1">
Dynamische Felder eigenen sich besonders gut zum Arbeiten mit Vektoren und Matrizen.
</p>

### Dynamische Feldern adressieren

Wenn wir uns auf die Ergebnisse in einem dynamischen Feld beziehen, dann kennen wir die Endzelle natürlich nicht. Entsprechend können wir nicht mit dem Bereichsoperator arbeiten. Stattdessen teilen wir Excel mit einem anderen Operator mit, dass wir ein dynamisches Feld referenzieren möchten. Der Operator ist das Gatter (`#`), der auch als `Feldoperator` bezeichnet wird. Dazu verweisen wir immer auf die linke obere Ecke des dynamischen Felds und hängen den Feldoperator an diese Adresse. 

<p class="alert alert-warning" markdown="1">
**Wichtig!** Bei der Adressierung mit dynamischen Feldern **muss** die angegebene Adresse **immer** die linke obere Adresse des Bereichs sein, der durch das dynamische Feld erzeugt wird. 
</p>

<p class="alert alert-warning" markdown="1">
Wenn die Adresse nicht der Anfang eines dynamischen Felds ist, dann erhalten wir einen ``#Bezug!``-Fehler. Damit teilt uns Excel mit, dass wir eine Feldfunktion für eine normale Adresse verwenden möchten und unser Bezug ungültig ist.
</p>

<p class="alert alert-warning" markdown="1">
Ein dynamisches Feld kann keine Werte und Formeln überschreiben! Liegt eine Adresse mit einem Wert in dem Bereich, der von einem dynamischen Feld benötigt wird, dann wird ein `ÜBERLAUF!`-Fehler erzeugt. 
</p>

<p class="alert alert-danger" markdown="1">
Ein dynamisches Feld muss vollständig in den zur Verfügung stehenden Bereich passen, sonst wird ebenfalls ein `ÜBERLAUF!`-Fehler erzeugt. Dieser Fehler wird auch dann erzeugt, wenn die meisten Werte nicht vorhanden sind.  
</p>

Wegen dieser Anforderung müssen ganze Spalten immer in der ersten Zeile und ganze Zeilen immer in der ersten Spalte beginnen. Die Formel ``=A:A`` an der Adresse ``B2`` erzeugt immer einen ``ÜBERLAUF!``-Fehler, weil das neue dynamische Feld eine Zeile mehr benötigt, als EXCEL bereitstellen kann. 

### Dynamische Felder und Adressbereiche

<p class="alert alert-info" markdown="1">
Dynamischen Feldadressen lassen sich problemlos mit regulären Bereichsadressen kombinieren. Sie können den Bereich, der durch zwei Felder aufgespannt wird, beispielsweise mit ``A3#:C1#`` adressieren. Dabei müssen Sie beachten, dass die linke obere Adresse dieses Bereichs ausserhalb der Felder liegen kann.
</p>

Der Vorteil von Dynamischen Feldern liegt darin, dass sich die Werte und die *Anzahl der Werte* in einem dynamischen Feld verändern können. Einer EXCEL-Formel muss nicht der gesamte Bereich mitgeteilt werden, sondern nur noch die Startadresse des dynamischen Felds. 

Dynamische Felder können auch zur Bereichsadressierung verwendet werden. Das Ergebnis solcher Bereiche ist wieder ein dynamisches Feld. Soll ein dynamisches Feld in einer Bereichsadressierung verwendet werden, dann **muss** ein dynamisches Feld **immer** die erste Adresse für den Bereich sein, selbst wenn das dynamische Feld die rechte untere Adresse des neuen Bereichs enthält.

<p class="alert alert-success" markdown="1">
Wenn dynamische Felder zum Adressieren eines Bereichs verwendet werden, dann gelten die gleichen Regeln wie für die normale Bereichsadressierung. D.h. es werden alle Werten in den Bereich aufgenommen, die zwischen der linken oberen Adresse und der rechten unteren Adresse des gebildeten Bereichs stehen.
</p>

| Formel | Gültig |
| :--- | :--- |
| = A2#:B2 | Ja |
| = B2:C2# | Nein | 
| = C2#:B2 | Ja |
| = A2:C2# | Nein |
| = A2#:C2# | Ja | 

Weil dynamische Felder sich über mehrere Zeilen *und* Spalten erstrecken können, kann es durch die Bereichsnotation kommen, dass sich die Bereiche überlagern. In diesem Fall wird die Linke obere Adresse des Bereichs wie folgt bestimmt: *Es wird die am weitesten Links liegende Spalte und die oberste Zeile der gebildeten Bereiche verwendet.* Genau gleich wird wird die Adresse am rechten unteren Ende des Bereichs bestimmt: *Es wird die am weitesten Rechts stehende Spalte und die am weitesten unten stehende Zeile gesucht und zu einer Adresse verbunden.* 

Weil dynamische Felder sich nicht überlagern dürfen, kann ein so adressierter Bereich nie nur durch ein dynamisches Feld erzeugt werden.
