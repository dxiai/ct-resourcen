# Matrizen transponieren und vergleichen


<div class="alert alert-success" markdown="1">
Zwei Aufgaben sind bei der Arbeit mit Matrizen recht häufig: 

1. Das Vergleichen zweier Matrizen.
2. Das Transponieren ("kippen")  einer Matrix.
</div>

### Rezept 1: Matrizen vergleichen

Der Vergleich von zwei Matrizen kennt nur den Vergleich auf Gleichheit bzw. Ungleichheit. Die Vergleiche kleiner als und grösser als sind für Matrizen nicht definiert. Beim Vergleich müssen wir deshalb prüfen, ob in beiden Matrizen an den gleichen Positionen die gleichen Werte stehen. Entsprechend müssen für die Gleichheit von Matrizen zwei Bedingungen erfüllt sein:

1. Die Matrizen müssen die gleiche Anzahl an Spalten und Zeilen haben. 
2. Alle Werte müssen den Vergleich erfüllen.

#### Lösung in R

```R
matrix(c(1, 2, 3, 4), ncol = 2) -> matrix1
matrix(c(1, 2, 3, 4), ncol = 2) -> matrix1a
matrix(c(1, 2, 4, 4), ncol = 2) -> matrix2

is.logical(all.equal(matrix1, matrix1a)) # ergibt TRUE
is.logical(all.equal(matrix1, matrix2))  # ergibt FALSE
```

**Erklärung**

Die Funktion `all.equal()` prüft, ob zwei R-Objekte an allen Positionen die gleichen Werte haben. In diesem Fall hat diese Funktion `TRUE` als Ergebnis. In allen anderen Fällen wird eine Meldung über die Abweichung produziert. Entsprechend ist das Ergebnis bei gleichen Matrizen ein Wahrheitswert und in allen anderen Fälle eine Zeichenkette. 

Damit wir das Ergebnis als logischen Ausdruck verwenden können, müssen wir deshalb prüfen, ob das Ergebnis ein Wahrheitswert ist. Das erledigen wir mit der Funktion `is.logical()`. Diese Funktion gibt `TRUE` zurück, falls der Parameter ein Wahrheitswert ist und sonst `FALSE`. Weil die `all.equal()`-Funktion nur den Wahrheitswert `TRUE` und nie `FALSE` zurück gibt, funktioniert dieser Trick. 

Falls wir an der Art der Ungleichheit interessiert sind, sollte besser die Funktion `all_equal()` aus der `tidyverse`-Bibliothek verwendet werden. Diese Funktion gibt leichter verständliche Meldungen über die Unterschiede zweier Matrizen zurück. Weil `all_equal()` genau genommen Stichprobenobjekte auswertet, müssen die Matrizen erst mit ``as_tibble()`` umgewandelt werden. Daraus ergibt sich die etwas längliche Variante: 

```R
all_equal(as_tibble(matrix1), as_tibble(matrix2))
```

#### Lösung in EXCEL

```EXCEL
= WENNFEHLER(UND(matrix1 = matrix2); FALSCH)
```

**Erklärung**

Zwei Matrizen sind genau dann gleich, wenn alle Werte an der gleichen Position  in beiden Matrizen gleich sind. Mit der Teilformel `Matrix1 = Matrix2` werden alle Werte paarweise verglichen, d.h. der Vergleich wird für die Werte an den gleichen Positionen ausgeführt. Das Ergebnis ist eine Vergleichsmatrix in der an allen Positionen Wahrheitswerte stehen. 

Mit der Funktion `UND()` aggregieren wir alle Werte der Vergleichsmatrix mit der logischen Und-Operation. Das Ergebnis ist ein einzelner Wahrheitswert, der immer genau dann `WAHR` ist, wenn alle Werte in der Vergleichsmatrix `WAHR` sind. 

Wenn EXCEL für einen Wert in einer Matrix keinen Wert an der gleichen Position in der anderen Matrix findet, wird der `#NV` Fehler zurückgegeben. Solche Fehler treten immer dann auf, wenn die Matrizen unterschiedliche Zeilen- und/oder Spaltenzahlen haben. Die `UND()`-Aggregation gibt Fehler direkt weiter. Deshalb ist das Ergebnis in diesen Fällen nicht `WAHR` oder `FALSCH`, sondern `#NV`. Diesen Fehler müssen wir mit der Funktion `WENNFEHLER()` abfangen. Treten `#NV` Fehler auf, dann sind die Matrizen definitiv nicht gleich und deshalb muss in diesem Fall `FALSCH` das Ergebnis sein. 

<a class="btn btn-lg btn-primary" href="https://moodle.zhaw.ch/mod/resource/view.php?id=336745"><i class="fa fa-lg fa-download"></i> Beispiel: Matrizen mit Excel vergleichen</a>

### Rezept 2: Eine Matrix transponieren

Gelegentlich wollen wir eine Matrix "kippen". D.h. alle Spalten einer Matrix werden in Zeilen und alle Zeilen in Spalten umgewandelt. Dabei werden die Zeilen- und Spaltenindizes für den Zielwert vertauscht, so dass alle Werte, die vor dem Transponieren in der gleichen Zeile standen, nun in der gleichen Spalte stehen.

Die Ergebnismatrix hat genauso viele Spalten wie die ursprüngliche Matrix  Zeilen hat und umgekehrt. Wobei für jeden Wert \\( e_{ij} \\) der Ergebnismatrix der Wert \\( q_{ji} \\)  der Quellmatrix verwendet wird. 

Das Transponieren kann durch wiederholtes transponieren wieder rückgängig gemacht werden. 

#### Lösung in EXCEL

In EXCEL verwenden wir dazu die Funktion `MTRANS()`. Die Funktion `MTRANS()` transponiert jede Zeile der Matrix in eine Spalte.

<a class="btn btn-lg btn-primary" href="https://moodle.zhaw.ch/mod/resource/view.php?id=336786"><i class="fa fa-lg fa-download"></i> Beispiel: Matrizen mit Excel transponieren</a>

#### Lösung in R

```R
matrix(1:12, ncol = 4) -> matrix3

matrix3_t = t(matrix3)
matrix3_tt = t(matrix3_t)
```
Wir können nun mit dem ersten Rezept prüfen, ob die einfach und doppelt transponierte Matrix gleich der ursprünglichen Matrix ist. 

```R
is.logical(all.equal(matrix3, matrix3_t))  # ergibt FALSE
is.logical(all.equal(matrix3, matrix3_tt)) # ergibt TRUE
```

$$ $$