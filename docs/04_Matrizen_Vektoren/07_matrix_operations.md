# Die wichtigsten Matrizenoperationen für das Programmieren

Für Matrizen gelten etwas andere Regeln als für einzelne Werte. Wenn Sie sich diese Regeln genau ansehen, dann werden Sie feststellen, dass es sich dabei um Verallgemeinerungen der bekannten Rechenregeln handelt. Dazu stellen wir uns vor, dass ein einzelner Wert auch als eine 1x1-Matrix dargestellt werden kann. 1x1-Matrizen sind gleichzeitig die kleinsten quadratischen Matrizen.

Für alle Rechenregeln müssen Sie beachten, dass die Grösse aller verwendeten Matrizen für die jeweilige Operation entscheidend ist. 

#### Matrixaddition

Die Matrizenaddition addiert die Elemente zweier Matrizen *paarweise*. Damit die Addition funktioniert, muss es für jeden Wert in Matrix A einen Partnerwert in Matrix B mit gleichem Zeilenindex i und Spaltenindex j geben. Daraus folgt direkt, dass die Matrixaddition nur für Matrizen mit gleichen Dimensionen m und n definiert ist.

**Besonderheiten**

R erzwingt die Regeln für die Matrixaddition. Deshalb ist es mit R nicht möglich, zwei Matrizen mit ungleichen Dimensionen m und n zu addieren. 

Excel erlaubt die Addition von zwei Matrizen mit ungleichen Dimensionen. In diesem Fall wird die Addition nur für die paarweise vorhandenen Werte durchgeführt.  Für alle  anderen Werte werden gedachte Kreuzungspunkte angelegt und mit dem Fehlerwert `#NV` belegt. Dieses Ergebnis ist deshalb ungeeignet, um zwei beliebige Matrizen zu addieren.

####  Vektoraddition

Die Vektoraddition funktioniert etwas anders als die Matrixaddition. In diesem Fall liegt uns eine m x n-Matrix und ein m-Vektor vor. 

Die Vektoraddition ist nur dann definiert, wenn die Matrix und der Vektor die gleiche Anzahl an Zeilen haben. 

<p class="alert alert-primary" markdown="1">
Bei der Vektoraddition wird der Vektor zu jeder Spalte in der Matrix addiert. Dabei werden die Werte *paarweise* zusammengezählt. 
</p> 

Veranschaulichen wir uns das für einen 2-Vektor und eine 2 x 3-Matrix.

$$
v + M = \begin{bmatrix}
v_{1}  \\\
v_{2} 
\end{bmatrix} + \begin{bmatrix}
m_{11} & m_{12}  & m_{13}  \\\
m_{21} & m_{22} & m_{23}  
\end{bmatrix} = \begin{bmatrix}
v_1 + m_{11} & v_1 + m_{12}  & v_1 + m_{13}  \\\
v_2 + m_{21} & v_2 + m_{22} & v_2 + m_{23}  
\end{bmatrix}
$$

In R implementieren wir diese Logik wie folgt: 

```R
v = c(1, 2)
M = matrix(c(3, 4, 5, 6, 7, 8), 2, 3)

v + M
```

In Excel vektorisieren wir die Werte zuerst, damit wir sie als dynamische Felder in Formeln verwenden können. Der Anschaulichkeit halber nehme ich hier an, dass der Vektor an der Adresse `V1` und die Matrix an der Adresse `M1` beginnt und beide Adressen die Werte von einer geeigneten Stelle auf dem Arbeitsblatt per Identitätsfunktion vektorisiert wurden. Die Werte sind in beiden Fällen wie im R-Beispiel. 

Die Vektoraddition wird anschliessend durch die folgende Formel erzeugt: 

```Excel
= V1# + M1#
```

**Besonderheiten**

R erlaubt die Vektoraddition nur, wenn ein Operand ein Vektor (z.B. mit der `c()`-Funktion erstellt wurde) und ein Operand eine Matrix ist. Handelt es sich beim Vektor um eine m x 1-Matrix prüft R, ob die Bedingungen für die Matrixaddition erfüllt sind und bricht die Operation anschliessend ab. 

Weil Excel nicht explizit zwischen Matrizen und Vektoren unterscheidet und deshalb ein m-Vektor nicht von einer m x 1-Matrix unterschieden werden kann, führt Excel eine *implizite* Vektorkonversion durch. Liegen also zwei Matrizen vor, von denen eine nur eine Spalte hat, wird diese implizit als Vektor verwendet und *immer* eine Vektoraddition durchgeführt. *Um eine Matrixaddition sicherzustellen, **müssen** Sie die Bedingungen für die Matrixaddition in Excel selbst implementieren, bevor Sie die Operation durchführen!*

#### Skalarmultiplikation (Punktprodukt)

Die Skalarmultiplikation oder das Punktprodukt multipliziert einen Wert a mit einer Matrix (oder Vektor) M. Dabei wird \\( a \\) als **Skalar** bezeichnet, weil dieser alle Werte um den gegebenen Wert *skaliert*.  Bei der Skalarmultiplikation wird jeder Wert in der Matrix mit dem Skalar multipliziert. 

$$
a \cdot M = a \cdot \begin{bmatrix}
m_{11} & m_{12}  & m_{13}  \\\
m_{21} & m_{22} & m_{23}  
\end{bmatrix} = \begin{bmatrix}
a \cdot m_{11} & a \cdot m_{12}  & a \cdot m_{13}  \\\
a \cdot m_{21} & a \cdot m_{22} & a \cdot m_{23}  
\end{bmatrix}
$$

Dieses Konzept lässt sich auf Vektoren übertragen. Dabei ist der Skalar a ein Vektor mit der gleichen Anzahl an Zeilen für den Vektor und die Matrix. Danach funktioniert die Skalarmultiplikation analog zur Vektoraddition. 

$$
a \cdot M = \begin{bmatrix}
a_1\\\
a_2 
\end{bmatrix} \cdot \begin{bmatrix}
m_{11} & m_{12}  & m_{13}  \\\
m_{21} & m_{22} & m_{23}  
\end{bmatrix} = \begin{bmatrix}
a_1 \cdot m_{11} & a_1 \cdot m_{12}  & a_1 \cdot m_{13}  \\\
a_2 \cdot m_{21} & a_2 \cdot m_{22} & a_2 \cdot m_{23}  
\end{bmatrix}
$$

#### Matrizenmultiplikation/ Kreuzprodukt

Das Kreuzprodukt ist eine andere Variante zwei Matrizen zu multiplizieren. Dabei werden zwei Matrizen A und B über Kreuz multipliziert. Dazu muss gegeben sein, dass die Matrix A gleich viel Spalten hat, wie Matrix B Zeilen. Es muss also gelten, dass wir eine m x n-Matrix mit einer n x p-Matrix multiplizieren, wobei n für beide Matrizen gleich sein muss. Sind diese Voraussetzungen nicht erfüllt, kann das Kreuzprodukt nicht gebildet werden.

Das Kreuzprodukt ist wie folgt definiert: 

$$
A \times B = \begin{bmatrix} 
a_{11} & a_{12} & \cdots & a_{1n} \\\
a_{21} & a_{22} & \cdots & a_{2n} \\\
\vdots & \vdots & \ddots & \vdots \\\
a_{m1} & a_{m2} & \cdots & a_{mn} \\\
\end{bmatrix} 
\times
\begin{bmatrix} 
b_{11} & b_{12} & \cdots & b_{1p} \\\
b_{21} & b_{22} & \cdots & b_{2p} \\\
\vdots & \vdots & \ddots & \vdots \\\
b_{n1} & b_{n2} & \cdots & b_{np} \\\
\end{bmatrix} =
\begin{bmatrix} 
\sum_{i=1}^{n}{a_{1i} \cdot b_{i1}} & \sum_{i=1}^{n}{a_{1i} \cdot b_{i2}} & \cdots & \sum_{i=1}^{n}{a_{1i} \cdot b_{ip}} \\\
\sum_{i=1}^{n}{a_{2i} \cdot b_{i1}} & \sum_{i=1}^{n}{a_{2i} \cdot b_{i2}} & \cdots & \sum_{i=1}^{n}{a_{2i} \cdot b_{ip}} \\\
\vdots & \vdots & \ddots & \vdots \\\
\sum_{i=1}^{n}{a_{mi} \cdot b_{i1}} & \sum_{i=1}^{n}{a_{mi} \cdot b_{i2}} & \cdots & \sum_{i=1}^{n}{a_{mi} \cdot b_{ip}} \\\
\end{bmatrix} 
$$

Das Ergebnis eines Kreuzprodukts ist immer eine Matrix mit m-Zeilen und p-Spalten.

Diese komplizierte Berechnung wird so häufig gebraucht, dass Excel und R diese Operation für uns bereitstellen, sodass wir uns nur das Prinzip merken müssen.

* Das Kreuzprodukt wird in R mittels des `%*%`-Operanden berechnet.
* Das Kreuzprodukt wird in Excel mittels der `MMULT()`-Funktion berechnet.

Aus der Definition des Kreuzprodukts zeigt sich, dass die Operanden beim Kreuzprodukt nur vertauscht werden können, wenn beide Matrizen quadratisch sind. Dabei gilt für beliebige Matrizen ausserdem \\( A \times B \ne B \times A \\). 

Das Kreuzprodukt hat ein *neutrales Element*: Die **Einheitsmatrix**. Aus diesem Grund wird die Einheitsmatrix gelegentlich auch als *Identitätsmatrix* bezeichnet. Die Einheitsmatrix ist eine quadratische Matrix, die an den Positionen der abfallenden Diagonalen den Wert 1 und sonst den Wert 0 hat. 

**Beispiel für eine 3-Dimensionale Einheitsmatrix**

$$
\begin{bmatrix}
1 & 0 & 0 \\\
0 & 1 & 0 \\\
0 & 0 & 1
\end{bmatrix}
$$

**Kreuzprodukt für Vektoren**

Aus der Anforderung für das Kreuzprodukt folgt direkt das Kreuzprodukt für Vektoren, die wir als m x 1- sowie als 1 x p-Matrizen verstehen können. Es gilt also: n = 1. Deshalb mussten wir für das Einmaleins-Beispiel den zweiten Vektor *transponieren*. Dadurch vereinfacht sich die komplizierte Formel des Kreuzprodukts auf die paarweise-überkreuzte Multiplikation. 

**Besonderheiten** 

Excel berücksichtigt bei der Matrixmultiplikation nur die Zeilen und Spalten, für welche die Bedingung des Kreuzprodukts erfüllt sind. Überschüssige Zeilen oder Spalten werden ignoriert bzw. führen zu Fehlern.

### Das äussere Matrixprodukt

Das äussere Matrixprodukt ist das Gegenstück zum Skalarprodukt. 

Dabei werden die Spaltenwerte der linken Matrix (oder Spaltenvektor) mit den Zeilenwerten der rechten Matrix *paarweise* multipliziert. Das Ergebnis ist eine Matrix, die genau so viele Zeilen hat wie die linke Matrix und so viele Spalten wie die rechte Matrix. 

**Beispiel mit zwei Vektoren** 

**Beispiel mit zwei Matrizen**

**Beispiel mit einer Matrix und einem Vektor**

In Excel und R ist das äussere Matrixprodukt für *beliebige* Operationen definiert.
 
