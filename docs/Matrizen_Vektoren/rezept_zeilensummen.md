# Rezept: Zeilensummen berechnen


**Problemstellung:** Es sollen die Summen für jede Zeile einer Matrix berechnet werden und das Ergebnis soll ein Vektor sein. 

<div class="alert alert-info" markdown="1">
Für die EXCEL-Formeln wird angenommen, dass eine Matrix an der Adresse `M1` vektorisiert vorliegt. Ist das nicht der Fall, dann muss an den entsprechenden Stellen der Bereich der Matrix übergeben werden. 
</div>

#### Lösung in EXCEL

```EXCEL
= MMULT(M1#; SEQUENZ(SPALTEN(M1#);1;1;0))
``` 
<div class="alert alert-warning" markdown="1">
Diese Operation ist  bei der Arbeit mit EXCEL wichtig, weil diese Operation in EXCEL effizienter als die zeilenweise Aggregationen für vektorisierte Daten ist.
</div>

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=544752" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download"></i> Vollständiges EXCEL Beispiel</a>

#### Lösung in R

```R
m1 %*% seq(length = ncol(m1), from = 1, by = 0)
```

<div class="alert alert-warning" markdown="1">
Diese Lösung funktioniert in R nur mit Matrizen und nicht mit Stichprobenobjekten. 
</div>

#### Erklärung

Um Zeilensummen für eine Matrix zu erstellen, nutzen wir die Eigenschaften des Kreuzprodukts aus und multiplizieren eine Matrix mit dem Einsvektor. Das Ergebnis dieser Operation ist ein Vektor, der in jeder Zeile die Summe der Werte aus der entsprechenden Zeile der Matrix enthält. 

Das Kreuzprodukt ist nur für Matrizen definiert, wenn die erste (linke) Matrix *A* gleich viele Spalten hat, wie die Zeilenanzahl der zweiten (rechten) Matrix *B*. Die Ergebnismatrix des Kreuzprodukts hat gleich viele Zeilen, wie die erste Matrix und gleich viele Spalten wie die zweite. Für jede Position \\( c_{ij} \\) der Ergebnismatrix C gilt dann die folgende Formel:

$$
c_{ij} = \sum^n_{k=1}{a_{ik}b_{kj}}
$$

Um die Zeilensummen einer Matrix *A* zu erhalten, müssen wir die Matrix *B* entsprechend konstruieren. 

1. Matrix B darf nur eine Spalte haben, damit die Ergebnismatrix nur eine Spalte hat. 
2. Matrix B darf die Werte in Matrix A nicht verändern.
3. Matrix B muss gleich viele Zeilen haben, wie Matrix A Spalten hat.

Diese Anforderungen 1 und 2 werden durch den Einsvektor mit `n`-Zeilen erfüllt. Dabei nutzen wir aus, dass ein Spaltenvektor das gleiche wie eine Matrix mit einer Spalte ist. 

Die Anforderungen 3 können wir über die Spaltenzahl der Matrix bestimmen und erstellen dann einen Einsvektor mit entsprechender Zeilenanzahl.

Weil der Einsvektor an jeder Position das neutrale Element der Multiplikation enthält, vereinfacht sich die Formel für das Kreuzprodukt stark: 

$$
c_{i1} = \sum^n_{k=1}{a_{ik}}
$$

Bei dieser Formel ist zu beachten, dass die 1 in \\( c_{i1} \\) für die einzige Spalte des Einsvektors steht und i für die Zeilen in der Matrix A. Daraus wird deutlich, dass wir nun die Zeilensummen für die Matrix A erhalten.

Der Einsvektor muss bei dieser Operation als die rechte Matrix eingesetzt werden, so dass gilt:

$$
A \times v_e
$$

Aus dieser Lösung können wir die Spaltensumme ableiten: Für die Spaltensumme muss das neutrale Element der Multiplikation in die erste Matrix wandern. Dazu erstellen wir einen Zeilenvektor und bilden das Kreuzprodukt mit diesen Vektor. Weil in diesem Fall die Spaltensumme gebildet werden soll, kommen die Werte für die Spalten aus der rechten Matrix. Deshalb müssen wir das Kreuzprodukt wie folgt bilden:

$$
v_e \times B
$$

Daraus ergibt sich die folgende EXCEL-Formel:

```EXCEL
= MMULT(SEQUENZ(1; ZEILEN(M1#); 1; 0); M1#)
```

<p class="alert alert-success" markdown="1">
Bei der Zeilen- und Spaltensumme handelt es sich um ein sogenanntes *Muster*, dass wir in verschiedenen Stellen verwenden können. Ein *Muster* ist im Kern eine *Funktion*, das wir über Parameter anpassen können. 
</p>

Wir können dieses Muster mit der Funktion `LET()` ([zum Exkurs über die `LET()`-Funktion](https://moodle.zhaw.ch/mod/page/view.php?id=544755)) so anpassen, dass wir den Bereich für unsere Matrix nur einmal anpassen müssen.

Daraus ergeben sich die folgenden Formeln:

* Zeilensumme: `= LET(Matrix; M1#; MMULT(Matrix; SEQUENZ(SPALTEN(Matrix); 1; 1; 0)))`
* Spaltensumme: `= LET(Matrix; M1#; MMULT(SEQUENZ(1; ZEILEN(Matrix); 1; 0); Matrix))`