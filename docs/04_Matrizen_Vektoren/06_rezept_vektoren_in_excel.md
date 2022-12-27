# Vektoren und Matrizen mit Excel erstellen

## Problem 

Ein Vektor oder eine Matrix soll in Excel erstellt werden.

## Lösung

Für beliebige Werte verwenden wir die Identitätsfunktion. 

Für Spaltenvektoren

```
=A1:A10
```

Für Zeilenvektoren

```
=A1:H1
```

Für Sequenzen und Wiederholungen verwenden wir die `SEQUENZ()`-Funktion. 

Für Sequenzen 

```
=SEQUENZ(5; 1; 2; 2)
```

Für Wiederholungen

```
=SEQUENZ(5; 1; 2; 0)
```

Matrizen können auf die gleiche Weise erzeugt werden. Bei der Identitätsfunktion muss der Bereich die entsprechenden Spalten einschliessen und bei der `Sequenz()`-Funktion muss die Anzahl der Zeilen und die Anzahl der Spalten grösser als 1 sein. 


Anschliessend kann der erzeugte Vektor oder die erzeugte Matrix über die Startadresse gefolgt von einem Gatter angesprochen werden. Das folgende Beispiel zeigt das, falls eine der oben gezeigten Operationen an der Adresse `D2` eingegeben wurden. 

```
=D2#
```

## Erklärung

Excel erkennt Vektoren nicht automatisch. Untereinander oder nebeneinander geschriebene Werte sind ohne weitere Schritte voneinander **unabhängig**. Mittels der Identitätsfunktion oder der `SEQUENZ()`-Funktion können aufeinanderfolgende Werte zu einem Vektor zusammengefasst werden. 

Mit der Identitätsfunktion werden beliebige Werte zu einem Vektor oder einer Matrix zusammengefasst. Streng genommen handelt es sich dabei um Listen. Diese Liste wird als Vektor bezeichnet, wenn alle Werte von gleichen Datentyp sind und der Bereich nur eine Spalte bzw. eine Zeile umfasse. Umfasst der ausgewählte bzw. erzeugte Bereich gleichzeitig mehr als eine Spalte und mehr als eine Zeile, dann bezeichnen wir den Bereich als Matrix. 

Bei der Identitätsfunktion ist zu beachten, dass alle leeren Zellen des adressierten Bereichs den Wert 0 enthalten, sobald die Operation ausgeführt wurde. Dieser Effekt tritt ein, weil Excel immer ein Ergebnis für eine Operation erzeugt und die leere Zelle nicht als Ergebnis erlaubt ist. 

Die Sequenzfunktion wird ausführlich im Abschnitt **Sequenzen und zwei besondere Vektoren** diskutiert. 