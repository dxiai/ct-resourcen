### Problem

Es sollen alle Werte in einer Spalte vektorisiert werden, Sie wollen später noch Werte ans Ende der Tabelle eingeben können, die automatisch in den Vektor übernommen werden.

### Lösung

Filtern sie die Werte mit `NICHT(ISTLEER())` oder vergleichen Sie grösste Zeilennummer mit einem Wert mit der aktuellen Zeilennummer. 

#### Beispiel

| | A | B |
| :---: | :--- | 
| **1** | A | `=FILTER(A:A; NICHT(ISTLEER(A:A)))` |
| **2** | B |
| **3** | C |
| **4** | D |
| **5** | E |
| **6** |  |

### Erklärung

Normalerweise verwenden wir die Idnetitätsfunktion, um einen überschaubaren Bereich zu vektoriesieren. Sind unsere Eingangsdaten variabel und sollen später noch erweiterbar sein, dann ist die Identitätsfunktion über die Bereichtsadressierung zu statisch. 

Für eine dynamsiche Lösung wird die Spalten-Adressierung verwendet. Damit werden alle Zellen einer Spalte als Vektor adressiert. Diese Identität für eine Spalte hat einige Tücken, denn diese Identität *muss* immer in der ersten Zeile eingefügt werden, weil sonst das Ergebnis nicht in die verfügbaren Adressen in der Arbeitsmappe passt. 

Liegt in einer Spalte ein durchgängiger Vektor vor, der zwischen den Werten keine leeren Zellen hat, dann markiert die erste leere Zelle im Vektor das Ende des Werte. Der logische Ausdruck markiert damit alle Adressen, die nicht leer sind. In diesen Zellen steht daher immer ein Wert. 

Indem wir die Spaltenadressierung und den logischen Ausdruck in einem Filter kombinieren, dann ist der Vektor (meistens) wesentlich kompakter als der ursprüngliche Spaltenvektor.

#### Überschriften berücksichtigen

Um Überschriften zu berücksichtigen, muss zusätzlich der Beginn des Vektors eingeschränkt werden. Um eine Überschrift aus dem Vektor herauszuhalten, müssen die zusätzlichen Zeilen beim Filtern entfernt werden. Falls die Tabelle in der ersten Zeile beginnnt, dann kann der logische Ausdruck wie folgt erweitert werden: 

```EXCEL
=FILTER(A:A; NICHT(ISTLEER(A:A)) * (ZEILE(A:A) >= 2)) 
```

Die 2 im Logischen Ausdruck verweist auf die erste Zeile, in der Werte stehen. Dieser Wert muss durch die Zeilenzahl ersetzt werden, ab der die Werte beginnen. 

#### Vereinfachung für Zahlenvektoren

Falls ein Vektor nur aus Zahlenwerten besteht, dann kann die Operation wie folgt vereinfacht werden: 

```EXCEL
=FILTER(A:A; ISTZAHL(A:A))
```

Diese Vereinfachung entfernt den Vektornamen und endet vor der ersten leeren Zelle. 

#### Verallgemeinerung für mehrere Vektoren

Die gleiche Logik kann auf komplexere Bereiche verallgemeinert werden. Dabei wird ausgenutzt, dass ein logischer Ausdruck beliebige Vektoren referenzieren darf. Der Referenzvektor wird dann im logischen Ausdruck geprüft. Der erste Parameter verweist auf die zu filternden Werte im Ausgangsvektor. 

Beipiel:

```EXCEL
=FILTER(A:A; ISTZAHL($B:$B))
```
