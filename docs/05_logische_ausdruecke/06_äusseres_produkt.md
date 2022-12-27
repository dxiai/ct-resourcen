Bei den Vektoren und Matrizen haben wir bereits das Kreuzprodukt kennengelernt, mit dem wir aus zwei Vektoren eine Matrix konstruieren können. Das Kreuzprodukt ist allerdings nur für die Multiplikation als paarweiser Operator definiert. Neben dem Kreuzprodukt gibt es noch eine zweite und flexiblere Möglichkeit, um aus zwei Vektoren eine Matrix zu generieren: Das sog. äussere Produkt. 

<p class="alert alert-primary" markdown="1"> 
Beim **äusseren Produkt** oder *dyadischen Produkt* werden die Werte zweier Vektoren *paarweise* miteinander verknüpft, wodurch eine Matrix erzeugt wird, bei der die Anzahl der Zeilen entsprechend der Länge des linken und die Anzahl der Spalten mit der Länge des rechten Vektors übereinstimmt.
</p> 

Wenn also zwei Vektoren x mit der Länge m und y mit der Länge n gegeben sind, dann können wir das äussere Produkt wie folgt schreiben: 

$$
x \otimes y = M^{m \times n }
$$

Das Ergebnis des äusseren Produkts ist also immer eine Matrix. Wir beachten, dass die Definition nur eine Verknüpfung fordert, aber nicht festlegt, welche Verknüpfung verwendet werden soll. Wir können also *beliebige Operationen* zur Verknüpfung verwenden. 

<p class="alert alert-success" markdown="1"> 
Wird als Verknüpfungsoperator für das äussere Produkt die Multiplikation gewählt, dann entspricht das Ergebnis des äusseren Produkts für zwei Vektoren dem Kreuzprodukt. 
</p>

Anders als beim Kreuzprodukt, können wir beliebige andere Operatoren verwenden. In der Praxis werden sehr oft Vergleichsoperatoren für die Verknüpfung verwendet. 

<div class="alert alert-secondary" markdown="1">
So ist es z.B. möglich das gemeinsame Auftreten von Werten in einer Tabelle aus mit zwei Vektoren zu bestimmen. Das Ergebnis ist eine sog. Co-Occurrence-Matrix, bei der an den einzelnen Positionen jeweils die Anzahl steht mit der die korrespondierenden Werte der jeweiligen Spalte und Zeilen gleichzeitig vorkommen. Bei der Erstellung einer Co-Occurrence-Matrix müssen zuerst die zählbaren Elemente identifiziert werden. Das wird durch das äussere Produkt erreicht. Das erfolgt in zwei Schritten.

In einem ersten Schritt werden für jeden beiden Vektoren die eindeutigen Elemente bestimmt. In EXCEL wird dazu die  Funktion `EINDEUTIG()` und in R die Funktion `unique()` verwendet. Anschliessend wird das äussere Produkt über den eindeutigen und den ursprünglichen Vektor gebildet und als Verknüpfung der Vergleich auf Gleichheit verwendet. 

In R wird dies über die Operation ``outer(vektor1, vektor2, `==`) * 1`` erreicht, wobei die anschliessende Multiplikation mit `1` die Wahrheitswerte in Zahlenwerte umwandelt. 

In EXCEL lautet die entsprechende Operation `= (Vektor1# = Vektor2#) * 1`. 
</div>

<p class="alert alert-success" markdown="1"> 
In EXCEL muss ein Vektor ein Spalten und der andere Vektor ein Zeilenvektor sein. Die Reihenfolge ist unwichtig. Sie müssen also einen der beiden Vektoren ggf. *transponieren*.
</p>
