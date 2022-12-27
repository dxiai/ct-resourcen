# Spickzettel: Matrizen Funktionen 

Die wichtigsten Funktionen zur Arbeit mit Matrizen sind:

| Operation | Excel Funktion |  Excel Funktionsgruppe |  R Funktion/Operator | 
| :--- | :--- |  :--- | :--- | 
| Matrix erstellen | - | - | `matrix(wertevektor, nrows, ncols)` | 
| Transponieren | `MTRANS(Matrix)` |  Nachschlagen und Verweisen | `t()` | 
| Werte auslesen | `INDEX(Matrix; Zeile; Spalte)` | Nachschlagen und Verweisen | `matrix[zeile, spalte]` |  
| Kreuzprodukt | `MMULT(Matrix1; Matrix2)` | Mathematik und Trigonometrie | `matrix1 %*% matrix2` | 
| Determinante | `MDET(Matrix)` | Mathematik und Trigonometrie | `det(matrix)` | 
| Einheitsmatrix | `MEINHEIT(Anzahl_Zeilen)` |  Mathematik und Trigonometrie | `diag(anzahl_zeilen)` | 
| Einsvektor | `SEQUENZ(Vektorlänge; 1; 1; 0)` |  Mathematik und Trigonometrie | `seq(from = 1, by = 0, length = Vektorlänge)` |
| Nullvektor | `SEQUENZ(Vektorlänge; 1; 0; 0)` |  Mathematik und Trigonometrie | `seq(from = 0, by = 0, length = Vektorlänge)` |

<a class="btn btn-lg btn-primary" href="https://moodle.zhaw.ch/mod/resource/view.php?id=544747"><i class="fa fa-lg fa-download">* Excel Beispiele</a>