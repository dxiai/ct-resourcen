### Datentypen

Datentypen helfen uns Werte zu organisieren. Wir haben bereits drei wichtige Datentypen kennengelernt. Damit kennen wir bereits den Grossteil der wichtigsten Datentypen für einzelne Werte. Die vollständige Auflistung besteht aus fünf Datentypen:

1. Zahlen (engl. *numerics*)
2. Wahrheitswerte (engl. *booleans*)
3. Zeichenketten (engl. *strings*)
4. Fehlerwerte (engl. *error values*)
5. Die leere Zelle bzw. nicht vorhandene Werte (`NA` in R). 

Diese Datentypen beschreiben jeweils einzelne Werte. 

<p class="alert alert-primary" markdown="1">
**Definition:** **Atomare Datentypen** heissen Datentypen, die Eigenschaften für einzelne Werte festlegen.
</p>

Excel kennt nur die oben genannten fünf atomaren Datentypen! 

In R können neue Datentypen aus den bestehenden Datentypen erzeugt werden, und Funktionen und Operatoren für diese neuen Datentypen eingeschränkt werden. Für uns sind die folgenden zusätzlichen atomaren R-Datentypen ebenfalls wichtig:

6. Datumswerte (`date`)
7. Zeit-Datumswerte (`dttm`)
8. Faktoren (`fct`) 

Diese Datentypen werden in den Abschnitten [*"Zeichenketten"*](../15_zeichenketten/) und [*"Diskrete Daten und Faktoren"*](../14_diskrete_daten/) behandelt.

### Komplexe Datentypen: Listen und Vektoren

Aus atomaren Datentypen können komplexe Datentypen abgeleitet werden, die mehrere Werte zusammenfassen. Solche Strukturen werden oft auch als *Datenfelder* (engl. *arrays*) bezeichnet. Zwei Arten solcher Datenfelder sind für uns besonders wichtig: 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **Liste** ist ein Datenfeld mit Werten mit *beliebigen Datentypen*.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Vektor** ist ein Datenfeld mit Werten mit dem *gleichen Datentyp*. 
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Vektoren und Listen werden als **komplexe Datentypen** bezeichnet, weil sie *atomare Datentypen* zu *komplexeren Strukturen* verbinden.  
</p>

Für Datenfelder können wir die Länge bestimmen. 

R stellt zu diesem Zweck die `length()`-Funktion bereit. 

Excel unterscheidet zwischen horizontalen und vertikalen Datenfeldern. Die Länge dieser Felder müssen wir mit den beiden Funktionen `ZEILEN()` und `SPALTEN()` bestimmen. 

* `ZEILEN()` bestimmt die Länge  von vertikalen Datenfeldern. 
* `SPALTEN()` bestimmt die Länge von horizontalen Datenfeldern. 

<p class="alert alert-warning" markdown="1">
**Achtung:** Die Excel Funktionen `ANZAHL()` und `ANZAHL2()` sind zum Bestimmen der Länge von Datenfeldern nicht geeignet, weil sie nur die Anzahl der Werte zurückgeben. Diese entspricht leider nicht immer der Länge von Datenfeldern.
</p>

### Mehrdimensionale Datentypen: Verschachtelte Listen, Stichproben und Matrizen

Die Logik der komplexen Datentypen können wir weiterführen und Listen und Vektoren zu noch komplexeren Strukturen verknüpfen. 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **verschachtelte Liste** ist eine Liste, die aus beliebigen anderen Datenfeldern (d.h. Listen oder Vektoren) besteht, wobei die eingebetteten Datenfelder *unterschiedliche Längen* haben können.
</p>

In R können wir verschachtelte Listen mit Hilfe des verketteten Aufrufs von `list()` Funktionen erzeugen. 

Excel bietet aktuell *keine* Möglichkeiten zur Arbeit mit verschachtelten Listen.

Ein **Spezialfall** der verschachtelten Liste sind **Listen, die Vektoren mit *gleicher Länge* verschachteln**. Diese Spezialfälle haben besondere Namen: 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **Stichprobe** verknüpft mehrere Vektoren mit *unterschiedlichen (atomaren) Datentypen*. 
</p>

In R werden Stichprobenobjekte mit der `tibble()` aus einzelnen Vektoren oder mit der `tribble()` Funktion aus einer Liste erzeugt. 

In Excel können wir Stichprobenobjekte als [*Tabelle*](https://moodle.zhaw.ch/mod/page/view.php?id=544754) oder als *Bereich* organisieren. 

In R ist ein Stichprobenobjekt eine verschachtelte Liste. Deshalb entspricht die *Länge* eines Stichprobenobjekts der Anzahl der Spalten bzw. Vektoren. Wir können einen beliebigen Vektor auswählen und dessen Länge bestimmen, um den Umfang einer Stichprobe zu erhalten. Dabei müssen wir aber aufpassen, dass wir keine leere Stichprobe vorliegen haben. Falls eine Stichprobe ohne Datensätze vorliegt, dann schlägt diese Strategie fehl. Deshalb wählen wir die `count()` Funktion, um Stichprobenumfänge zu bestimmen. 

#### Matrizen

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **Matrix** verknüpft mehrere Vektoren vom Datentyp *Zahlen*.
</p>

Eine Matrix hat eine Höhe (oft als *m* Zeilen gekennzeichnet) und eine Breite (oft als *n* Spalten gekennzeichnet). Die Anzahl der Zeilen und Spalten müssen natürliche Zahlen sein. Daraus folgt, dass nur Matrizen existieren, für die m und n > 0 gilt. 

In Excel akzeptieren manche Matrixoperationen auch Stichproben. Dazu gehören die folgenden Funktionen:

* `MTRANS()`
* `INDEX()`

<p class="alert alert-success" markdown="1">
Weil *m* und *n* einer Matrix grösser als `0` sein müssen, ergibt sich, dass wir uns einen Vektor als eine spezielle Matrix mit m-Zeilen und *einer Spalte* (n = 1) vorstellen können.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Matrix mit gleich vielen Spalten und Zeilen (es gilt also m = n) wird als **quadratische Matrix** bezeichnet. 
</p>

In R ist eine Matrix *keine* verkettete Liste, sondern ein eigener Datentyp, der über die Anzahl der Spalten und Zeilen definiert ist. Die Funktion `length()` ergibt die Gesamtzahl der Werte in einer Matrix. Um die Anzahl der Spalten und Zeilen einer Matrix zu bestimmen, müssen wir die Funktionen `ncol()` für die Anzahl der Spalten (engl. columns) und `nrow()` für die Anzahl der Zeilen (engl. row) verwenden.

In Excel ergibt sich eine Matrix aus der Anordnung der Werte.

Der Wert an einer Position in einer Matrix ist durch den Zeilen- und Spaltenindex gegeben.

$$
\begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\\
a_{21} & a_{22} & \cdots & a_{2n} \\\
\vdots & \vdots  & \ddots & \vdots \\\
a_{m1} & a_{m2} &  \cdots &  a_{mn}  
\end{bmatrix}
$$ 

Wir beachten, dass per Konvention der Zeilenindex immer als Erstes und der Spaltenindex immer als Zweites angegeben wird. Anstelle der mathematischen Schreibweise trennen wir die beiden Indizes. Auf diese Weise können wir auf jeden Wert in einer Matrix zugreifen. 

In R verwenden wir die eckigen Klammern, um auf die einzelnen Werte zuzugreifen. Dabei gilt `matrix[zeilenindex, spaltenindex]` wie das folgende Beispiel zeigt. 

```R
# Die folgende Zeile gibt eine 3x4 Matrix mit zufälligen ganzen Zahlen mit  0 < m_ij < 100 zurück
m = ( runif(12) * 100  ) %>% trunc() %>% matrix(3, 4) 

m[2, 3] # gibt den Wert aus der zweiten Zeile (i = 2) und der dritten Spalte (j = 3) zurück.  
```

<p class="alert alert-success" markdown="1">
Gewöhnen Sie sich an, in R die eckigen Klammern **nur** für Matrizenindizes zu verwenden. 
</p>

In Excel können wir eine ähnliche Matrix mit der Formel `= ZUFALLSMATRIX(3; 4; 1; 100; WAHR)` erzeugen. Um in Excel auf die einzelnen Werte zuzugreifen, verwenden wir die Funktion `INDEX()`. Diese Funktion erwartet einen Bereich mit einer "Matrix" und gibt den Wert an der entsprechenden Zeilen- und Spaltenposition zurück. Entsprechend erhalten wir den Wert an der Position 2, 3 mit der folgenden Formel, wenn wir unsere Zufallsmatrix an der Adresse A1 eingefügt haben: `= INDEX(A1#; 2; 3)`.

<p class="alert alert-success" markdown="1">
Excel `INDEX()`-Funktion kann für beliebige Bereiche verwendet werden. Daher eignet sich diese Funktion auch zum *Selektieren* von Vektoren aus Stichprobenobjekten. 
</p>


