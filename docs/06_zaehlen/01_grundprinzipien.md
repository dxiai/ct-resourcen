<p class="alert alert-success" markdown="1">
In diesem Kapitel wird der Begriff **Objekt** verwendet. Damit sind "Einheiten" gemeint, die in unseren Daten als Datensätze abgebildet werden.  Die Werte der Datensätze entsprechen messbaren Eigenschaften der Objekte.
</p>


<p class="alert alert-primary" markdown="1">
**Definition:** Als **Umfang** bezeichnen wir die Anzahl der Elemente eines Vektors.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Grösse** bezeichnen wir den Raum, den ein oder mehrere Objekte  einnehmen. Objekte können Werte, Vektoren oder Stichproben sein.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Zählen** bezeichnen wir das Bestimmen der Anzahl von Elementen eines Objekts. Wir sprechen vom **Abzählen**, wenn wir zum Zählen eine **Summe über die zählbaren Einheiten** bilden. 
</p>

<div class="alert alert-info" markdown="1">
Beachten Sie, dass es in der Mathematik (Mengenlehre) ein Konzept der **Abzählbarkeit** gibt. Dieses Konzept wird auf *beliebige* und insbesondere unendliche Mengen angewandt, um deren abstrakte Umfänge zu vergleichen. 

Beim Rechnen und Problemlösen mit Computern haben wir es **immer** mit **speziellen endlichen** Objekten zu tun. Wir beantworten damit immer die Frage nach dem *konkreten Umfang* der vorliegenden Objekte.
</div>

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **zählbare Einheit** bezeichnet ein Objekt, dass gezählt werden muss. Eine **nicht zählbare Einheit** bezeichnet ein Objekt, dass zwar vorhanden ist, aber nicht gezählt werden darf. 
</p>

* Eine **zählbare Einheit** wird durch den Wert `1` (oder `WAHR`) repräsentiert.
* Eine **nicht zählbare Einheit** wird durch den Wert `0` (oder `FALSCH`) repräsentiert.

<div class="alert alert-info" markdown="1">
Eine zählbare Einheit kann mehrere Teilobjekte umfassen.
</div>

Daraus ergibt sich, dass der Umfang einer endlichen Menge von Objekten gleich der Summe zählbaren Einheiten dieser Menge entspricht. Es gilt also die folgende Formel für das *Abzählen*: 

$$
\sum{zählbar(objekt)}
$$ 

Wobei die Funktion \\( zählbar(objekt) \\) das Ergebnis 1 (oder WAHR) für eine zählbare und 0 (oder FALSCH) für eine nicht zählbare Einheit liefert. 

<div class="alert alert-info" markdown="1">
In der Praxis werden wir selten die Funktion \\( zählbar() \\) explizit definieren, sondern mit einer alternativen Funktion oder einen *logischen Ausdruck* substituieren. 
</div>

<p class="alert alert-success" markdown="1">
**Merke:** Wenn wir die zählbaren Einheiten durchnummerieren, dann entspricht der Umfang dieser Einheiten der grössten Nummerierung.
</p>

Im Video spreche ich vom ***Abzählen durch Folgen***. Dieses Konzept bezieht sich auf ältere Versionen von Excel, die noch keine dynamischen Felder unterstützen. Das Nummerieren als *Folge* wurde in der aktuellen Excel-Version durch die Funktion `SEQUENZ()` vereinfacht. Wir werden im Abschnitt logische Ausdrücke und Filtern weitere Techniken kennenlernen, mit denen wir die zählbaren Elemente isolieren. 
