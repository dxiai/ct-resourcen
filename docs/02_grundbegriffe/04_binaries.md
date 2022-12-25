### Binärzahlen

<p class="alert alert-primary" markdown="1">
Binärzahlen kodieren Zahlenwerte zur Basis 2.
</p>

Daraus folgt, dass für jede Ziffer genau zwei Symbole (Ziffern) zur Verfügung stehen: `0` und `1`. 

Wie in anderen Zahlensystemen entspricht eine Stelle im Binärsystem einer Potenz zur gegebenen Basis. Das ist bei Binärwerten `2`. Jede Stelle für eine Ziffer kann also einer 2er-Potenz gleichgesetzt werden.

Die Besonderheit des Binärsystems ist, dass alle Werte als Summe von 2er-Potenzen dargestellt werden können. Diese Summe wird als *additive Darstellung* bezeichnet. 

| Wert | Binärwert | Additive Darstellung | Hexadezimal | 
| ---: | ---: | :---: | ---: | 
| 0 | 0000 | 0 | 0 | 
| 1 | 0001 | \\( 2^0 \\) | 1 |
| 2 | 0010 | \\( 2^1 \\) | 2 | 
| 3 | 0011 | \\( 2^1 + 2^0 \\) | 3 |
| 4 | 0100 | \\( 2^2 \\) | 4 |
| 5 | 0101 | \\( 2^2 + 2^0 \\) | 5 |
| 6 | 0110 | \\( 2^2 + 2^1 \\) | 6 | 
| 7 | 0111 | \\( 2^2 + 2^1 + 2^0 \\) | 7 |
| 8 | 1000 | \\( 2^3 \\) | 8 |
| 9 | 1001 | \\( 2^3 + 2^0 \\) | 9 |
| 10 | 1010 | \\( 2^3 + 2^1 \\) | A |
| 11 | 1011 | \\( 2^3 + 2^1 + 2^0 \\) | B | 
| 12 | 1100 | \\( 2^3 + 2^2 \\) | C |
| 13 | 1101 | \\( 2^3 + 2^2 + 2^0 \\) | D |
| 14 | 1110 | \\( 2^3 + 2^2 + 2^1 \\) | E |
| 15 | 1111 | \\( 2^3 + 2^2 + 2^1 + 2^0 \\) | F |

Aus dieser Tabelle kann man ablesen, dass die Ziffer `1` im Binärsystem bedeutet, das die 2er-Potenz an der entsprechenden Stelle aktiv ist. 

Jede Ziffer im Binärsystem kann ausserdem als eigenständiges Symbol einer Nachricht verstanden werden. Weil im Binärsystem nur die beiden Ziffern `0` und `1` möglich sind, müssen beim dekodieren nur diese Beiden Werte unterschieden werden. Jedes andere Zahlensystem kodiert Zahlen mit mehr als zwei Ziffern.
