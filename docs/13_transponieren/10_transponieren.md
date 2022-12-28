<p class="alert alert-primary" markdown="1">
**Definition:** **Transponieren** bezeichnet das Umstrukturieren von Daten, ohne dass die Werte der Daten verändert werden.
</p>

Eine wichtige Transformationsoperation für die Data Sciences ist das *Transponieren* (engl. *to transpose*). Beim Transponieren werden die Werte *umstrukturiert*. Damit ist  gemeint, dass Werte so umgestellt werden, dass sich eine neue *Datenstruktur* ergibt. Die Werte selbst bleiben beim Transponieren aber unverändert. 

Von den Matrixoperationen kennen wir bereits eine Variante des Transponierens. Diese Operation wird in Excel durch die Funktion `MTRANS()` und in R durch die Funktion `t()` durchgeführt. Dabei werden die Spalten- und Zeilenindizes einer Stichprobe oder einer Matrix vertauscht, sodass aus Spalten Zeilen werden. 

Die andere wichtige Variante ist das Transponieren durch "Auffächern" oder *"Umschwenken"* (eng. *to pivot*). Der korrekte Fachbegriff ist **umschwenken**. Dieser Begriff fasst zwei Operationen zusammen. 

* Bei der einen Operation werden  Werte aus einem Vektor entlang der Werte eines zweiten Vektors "aufgefächert" oder "ausgebreitet". Das Ergebnis dieser Umformung einer Stichprobe wird als ***Breitform der Stichprobe*** bezeichnet.
* Bei der anderen Operation werden die Werte aus mehreren Vektoren in zwei Vektoren so "zusammengefächert" oder "gesammelt", dass alle Vektornamen einem Vektor und alle Werte dem anderen Vektor zugeordnet werden. Das Ergebnis dieser Umformung einer Stichprobe wird als ***Langform der Stichprobe*** bezeichnet.

<p class="alert alert-success" markdown="1">
Das "Auf-" und "Zusammenfächern" sind Umkehrfunktionen. Das bedeutet, dass wir ausgehend von einer Datenstruktur durch Auffächern und anschliessendem Zusammenfächern die gleiche Datenstruktur erhalten. 
</p>

**Beispiel 1: Transponieren durch Auffächern**

Die Ausgangsstichprobe in der Langform hat zwei Vektoren. Im ersten Vektor (`Namen`) stehen die Vektornamen der aufgefächerten Stichprobe. Es werden also die Werte entlang dieses Vektors aufgefächert. Im zweiten Vektor (`Werte`) stehen die Werte, die in die neuen Vektoren übernommen werden.

| Namen | Werte | 
| :--- | ---: |
| v1 | 1 |
| v1 | 2 |
| v2 | 3 |
| v3 | 4 |
| v2 | 5 |
| v3 | 6 | 
| v1 | 7 |
| v2 | 8 |
 
Durch das Auffächern werden die Werte entsprechend der Werte im Namensvektor auf neue Vektoren aufgeteilt. Wir transponieren also entlang der Namen. So erhalten wir die Breitform der Stichprobe. 

| v1 | v2 | v3 |
| ---: | ---: | ---: |
| 1 | 3 | 4 |
| 2 | 5 | 6 |
| 7 | 8 |  |

Beachten Sie, dass der letzte Wert im Vektor v3 fehlt, weil in der Langform nur zwei Werte diesem Namen zugewiesen waren. 

**Beispiel 2: Transponieren durch Zusammenfächern**

Beim Transponieren durch Zusammenfächern werden alle Werte aus einer Auswahl von Vektoren in separate Datensätze umgewandelt. Für ein einfaches Beispiel sei die folgende Kostenstichprobe in der Breitform gegeben. 

| Monat | Einkauf | Verkauf | Kosten |
| :--- | ---: | ---: | ---: |
| Mai | -1000 | 50 | -5000 |
| Juni | -50 | 50 | -5000 |
| Juli | -50 | 17000 | -5000 |

In diesem Beispiel transponieren wir entlang der Vektoren `Einkauf`, `Verkauf` und `Kosten` und fassen die Werte zu einem Vektor `Betrag` in der Langform zusammen. Weil wir nach dem Transponieren keine Information verlieren dürfen, müssen wir für jeden Wert auch den zugehörigen Vektornamen in der Langform abbilden. Daraus ergibt sich die folgende Langform.

| Monat | Betrag | Art | 
| :--- | ---: | :--- |
| Mai | -1000 | Einkauf | 
| Mai | 50 | Verkauf | 
| Mai | -5000 | Kosten |
| Juni | -50 | Einkauf | 
| Juni | 50 | Verkauf | 
| Juni | -5000 |  Kosten |
| Juli | -50 | Einkauf | 
| Juli | 17000 | Verkauf | 
| Juli | -5000 |  Kosten |

In diesem Beispiel erkennen wir, dass die Werte der nicht transponierten Vektoren in der Langform der Stichprobe mehrfach auftreten.