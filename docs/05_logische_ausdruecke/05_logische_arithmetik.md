Die logischen Operatoren sehen nicht sehr nach Mathematik aus. Vielmehr handelt es sich um eine vereinfachte Schreibweise zur ursprünglichen arithmetischen Schreibweise von George Boole. Aus dieser leitet sich das Konzept der Boole'schen Algebra ab. 

Boole hat nach eine mathematischen Schreibweise für logische Ausdrücke gesucht. Zu seiner Zeit ist damit die Arithmetik mit den Operatoren `+`, `-`, `*` und `:` gemeint. Nach Boole müsste sich diese Schreibweise mit Zwei möglichen Werte als Parameter und als Ergebnis realisieren lassen. Diese beiden Werte sind `0` für `FALSCH` und `1` für `WAHR`. 

Beginnen wir mit dem **Nicht-Operator**. Die Negation lässt sich durch die folgende Funktion realisieren: 

$$
f_{neg}(x) \to -1x + 1 
$$

Alternativ können wir auch Exponenten bemühen. 

$$
f_{neg}(x) \to 0^x
$$

> **Aufgabe:** Zeigen Sie mit Hilfe einer Wahrheitstafel, dass beide Funktion tatsächlich die Bedingung der Negation erfüllt. 

### Und-Operator

Der Und-Operator darf nur `WAHR` ergeben, wenn beide Operanden `WAHR` sind. Die Wahrheitstafel entspricht der folgenden Belegung: 

$$
\begin{bmatrix}
1 \circ 1 & 0 \circ 1 \\\\
1 \circ 0 & 0 \circ 0  
\end{bmatrix} = \begin{bmatrix}
1 & 0 \\\\
0 & 0  
\end{bmatrix} 
$$

Wir können leicht erkennen, dass der gesuchte Operator die Multiplikation ist, weil die Multiplikation mit `0` immer `0` ergibt.

$$
f_{und}(a, b) \to ab
$$


### Oder-Operator 

Wir könnten nun vermuten, das der Oder-Operator als fundamentaler logischer Operator dem anderen fundamentalen arithmetischen Operator entspricht, nämlich der Addition. Es muss also folgende Überlegung gelten: 

$$
\begin{bmatrix}
1 \circ 1 & 0 \circ 1 \\\\
1 \circ 0 & 0 \circ 0  
\end{bmatrix} = \begin{bmatrix}
1 & 1 \\\\
1 & 0  
\end{bmatrix} 
$$ 

Setzen wir das Plus als Operator ein, ergibt sich ein etwas anderes Bild: 

$$
\begin{bmatrix}
1 + 1 & 0 + 1 \\\\
1 + 0 & 0 + 0  
\end{bmatrix} = \begin{bmatrix}
2 & 1 \\\\
1 & 0  
\end{bmatrix} 
$$ 

Wir erhalten im Ergebnis eine 2, was nicht dem gewünschten Ergebnis entspricht. 

Wir können unsere Oder-Wahrheitstafel als Matrix behandeln und in zwei Teilmatrizen zerlegen. 

$$
\begin{bmatrix}
1 & 1 \\\\
1 & 0
\end{bmatrix} = \begin{bmatrix}
1 & 0 \\\\
0 & 0  
\end{bmatrix}  + \begin{bmatrix}
0 & 1 \\\\
1 & 0  
\end{bmatrix} 
$$ 

Für die erste Teilmatrix kennen wir bereits die Lösung, nämlich die Multiplikation. Für die zweite Teilmatrix entspricht dem sog. exklusiven Oder (bzw. `XOder`). Um das exklusive Oder zu erzeugen, müssen wir eine `1` erzeugen, wenn genau einer der beiden Operanden eine `1` ist. 

Dazu ziehen wir jeweils den einen vom anderen Operanden ab und multiplizieren das Ergebnis: 

$$
(a - b)(b - a) =  \begin{bmatrix}
(1-1)(1-1) & (1-0)(0-1) \\\\
(0-1)(1-0) & (0-0)(0-0)  
\end{bmatrix}  = \begin{bmatrix}
0 & -1 \\\\
-1 & 0  
\end{bmatrix} 
$$

Damit wir eine positive `1` erhalten, müssen wir den Term noch mit `-1` multiplizieren. 

$$
f_{xoder}(a, b) \to -1(a-b)(b-a)
$$

Das ist aber das gleiche wie

$$
f_{xoder}(a, b) \to (a-b)^2
$$

Multiplizieren wir die Operation aus, dann erhalten wir: 

$$
f_{xoder}(a, b) \to a^2 + b^2 -2ab
$$

Weil `a` und `b` nur 0 oder 1 sein können, gilt \\( a^2 = a \\) und \\( b^2 = b \\). Dadurch vereinfacht sich der XOder-Term weiter:

$$
f_{xoder}(a, b) \to a + b - 2ab
$$

Setzen wir nun die beiden Teile zusammen, dann  erhalten wir für den Oder-Operator die folgende arithmetische Operation: 

$$
f_{oder}(a, b) \to f_{und}(a,b) + f_{xoder}(a,b) = ab + a + b - 2ab
$$

Das lässt sich zu folgendem Term vereinfachen:

$$
f_{oder}(a, b) \to a + b - ab
$$

Wir sehen, dass diese Operation tatsächlich eine Addition enthält. Die Operation ist aber etwas komplexer als erwartet, weil wir ein überschüssige Und entfernen müssen, welches zu der 2 im ursprünglichen Ergebnis geführt hat. 

<div class="alert alert-primary" markdown="1">
Um für die arithmetische Schreibweise des Oder-Operator  die Addition direkt zuzulassen, definieren die meisten Programmiersprachen die Wahrheitswerte wie folgt: 

- \\( x = 0 \\) entspricht `FALSCH`
- \\( x \neq 0\\) entspricht `WAHR`
</div>

Diese Definition vereinfacht die Schreibweise logischer Ausdrücke durch mathematische Operationen, weil das Oder der Addition direkt entspricht. Durch diese Definition stört die 2 in der Wahrheitstafel nicht mehr, weil \\( 2 \neq 0 \\) und damit dem Wahrheitswert `WAHR` entspricht.


