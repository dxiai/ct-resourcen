# Vektoren in R erstellen

## Problem 

Ein Vektor soll in R erstellt werden.

## Lösung

```
c(1, 2, 3.5, 4.0)   # Erzeugt einen Vektor der Länge 4 mit den Werten 1.0, 2.0, 3.5 und 4.0

1:5 # Erzeugt einen Vektor der Länge 5 mit den Werten, 1, 2, 3, 4 und 5. 

seq(length = 4, from = 2, by = 2) # Erzeugt einen Vektor der Länge 4 mit den Werten 2,4, 6 und 8

rep(1, 5) # Erzeugt einen Vektor der Länge 5 mit den Werten 1, 1, 1, 1 und 1.
```

## Erklärung

Die Funktion `c()` (`c` für `c`ombine) fasst beliebige Werte zu einem Vektor zusammen.  Diese Funktion fügt die Parameter zu einem Vektor zusammen. Wird ein Vektor an die `c()`-Funktion übergeben, wird dieser Vektor einfach als Ergebnis zurückgegeben.

Sequenzen können mittels der Funktion `seq()` (`seq` für `seq`uence) erstellt werden. Dabei muss nur der Startwert, die Länge und die Schrittweite der Sequenz angegeben werden (mehr Details im Abschnitt **Sequenzen und zwei besondere Vektoren**). Um eine Sequenz zwischen zwei (ganzzahligen) Werten mit der Schrittweite `1` zu erzeugen, kann die kompakte Doppelpunkt-Schreibweise verwendet werden (`1:5`)

Soll der gleiche Wert an jeder Position eines Vektors stehen, dann eignet sich die `rep()`-Funktion (`rep` für `rep`eat). Die `rep()`-Funktion hat zwei Parameter: Der erste Parameter bezeichnet den zu wiederholenden Wert und der zweite Parameter die Länge des Vektors. Die Länge des Vektors bezeichnet auch die Anzahl der Wiederholungen des ersten Parameters. 