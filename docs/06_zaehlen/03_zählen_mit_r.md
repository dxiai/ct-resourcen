R kennt zwei Funktionen zum Bestimmen von Umfängen. Die erste Funktion ist `length()`. Diese Funktion gibt die Anzahl von Elementen in beliebigen R-Objekten zurück. Die zweite Funktion ist `count()`, die den Stichprobenumfang von Stichprobenobjekten zurückgibt. Die beiden Funktionen werden wir meistens verwenden, um Umfänge in R zu bestimmen.

Daneben können wir immer noch Elemente in beliebiger Organisation und nach beliebigen Kriterien abzählen. Dafür greifen wir auf das Abzählen zurück.

### Beispiel zum  Abzählen von Zahlen

#### Vorbereitungen

Das folgende Beispiel wiederholt die Aufgabe zum Zählen der geraden Zahlen aus einer Einmaleins-Tabelle.

Wir erzeugen zwei Vektoren mit einer Sequenz von 1 bis 43 bzw. bis 57 respektive. `z` entspricht den Werten, die im EXCEL Beispiel untereinander stehen. `s` entspricht den Werten, die im Beispiel nebeneinander stehen.

```R
z = 1:43
s = 1:57
```

Der `*` Operator entspricht der Skalar-Multiplikation.

$$ z \cdot s $$

Das bedeutet, dass die beiden Vektoren zeilenweise multipliziert werden.  Das wollen wir aber nicht. Um die Einmaleins-Tabelle zu erhalten, müssen wir ein *Kreuzprodukt*  erstellen.

$$ z \times s $$

Weil wir das \\( \times \\)-Symbol nicht eingeben können, bietet R als alternative Schreibweise den `%*%`-Operator für das Kreuzprodukt. 

<p class="alert alert-info" markdown="1"> Damit wir das Kreuzprodukt bilden können, müssen wir den zweiten Vektor vorher zu einem  Zeilen-Vektor ***transponieren***. Das erreichen wir mit der `t()`-Funktion. Ohne transponieren erhalten wir eine Fehlermeldung, weil das Kreuzprodukt für zwei Spaltenvektoren nicht definiert ist. 
</p>

```R
einmaleins = z %*% t(s)
```

Unser Einmaleins ist nun in der Variable `einmaleins` gespeichert. 

<p class="alert alert-success" markdown="1">
In R sind alle Vektoren grundsätzlich Spaltenvektoren. Für das Kreuzprodukt benötigen wir aber einen Spalten- und einen Zeilenvektor. Mit der R-Funktion `t()` können wir einen Spaltenvektor in einen Zeilenvektor und umgekehrt ***t**ransponieren*.  Die `t()`-Funktion heisst in EXCEL `MTRANS()`.
</p>

<p class="alert alert-info" markdown="1"> EXCEL passt implizit den Multiplikationsoperator an, wenn es glaubt, dass ein Kreuzprodukt erstellt werden muss. 
</p>

#### Abzählen der geraden Zahlen

Jetzt können wir die geraden Zahlen in diesem Einmaleins zählen. Dazu verwenden wir den Modulo-Operator von R (`%%`). Der Modulo-Operator entspricht der `REST()`-Funktion in EXCEL. 

Weil unsere zählbare Einheit die geraden Zahlen sind und für die geraden Zahlen Modulo 2 immer genau 0 ergibt, müssen wir die Nullen in Einsen und die Einsen in Nullen umwandeln. Diese Umwandlung erreichen wir, indem wir jeden Wert durch `-2` teilen und dann zu jedem Wert 1 hinzuzählen. Dieser Schritt funktioniert, weil die Modulo-Operation für einen positiven Zähler und einen negativen Nenner einen negativen Rest ergibt.

Das Ergebnis schreiben wir in die Variable `zählmatrix`.

```R
zählmatrix = einmaleins %% -2 + 1
```

Abschliessend zählen wir durch Summenbildung und erhalten unser Ergebnis. 

```R
sum(zählmatrix)
```


1813



1813


### Funktionsketten

Die gleichen Operationen können wir natürlich auch als Funktionskette schreiben.

```R
library(tidyverse)

1:57 %>% 
    t() %>%                # 1:57 transponieren
    `%*%`(1:43, .) %>%     # Kreuzprodukt (1:57 als 2. Parameter)
    `%%`(-2) %>%           # Modulo -2
    `+`(1) %>%             # + 1        -> Zählbare Einheiten
    sum()                  # Zählen
```

1813

### Reflexionsfragen

1. Wie können wir die Anzahl der *ungeraden Werte* in unserer Einmaleins-Tabelle bestimmen?
2. Welches Problem ergibt sich, wenn wir diese Lösungsstrategie zur Bestimmung der Werte, die durch einen *beliebigen* Teiler grösser als 2 geteilt werden können?  (Hinweis: Analysieren Sie dazu die Modulo-Operation für 3 und 4 als Teiler).