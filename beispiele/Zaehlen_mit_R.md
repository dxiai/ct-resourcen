# Zählen mit R

Dieses Beispiel wiederholt die Aufgabe zum Zählen der geraden Zahlen aus eine Einmaleins-Tabelle.

Wir erzeugen zwei Vektoren mit einer Sequenz von 1 bis 43 bzw. bis 57 respektive. `z` entspricht den Werten, die im Excel Beispiel untereinander stehen. `s` entspricht den Werten, die im Beispiel nebeneinander stehen.


```R
z = 1:43
s = 1:57
```

Der `*` Operator entspricht der Skalar-Multiplikation.

$$ z \cdot s $$

Das bedeutet, dass die beiden Vektoren zeilenweise multipliziert werden.  Das ist natürlich nicht was wir wollen.

Um die Einmaleins-Tabelle zu erhalten müssen wir ein *Kreuzprodukt*  erstellen.

$$ z \times s $$

Weil wir das $ \times $-Symbol nicht eingeben können, bietet R als alternative Schreibweise den `%*%`-Operator für das Kreuzprodukt. 

> Damit wir das Kreuzprodukt bilden können, müssen wir den zweiten Vektor vorher zu einem  Zeilen-Vektor *transponieren*. Das erreichen wir mit der `t()`-Funktion. Ohne transponieren erhalten wir eine Fehlermeldung, weil das Krezprodukt für zwei Spaltenvektoren nicht definiert ist. 


```R
einmaleins = z %*% t(s)
```

Unser Einmaleins ist nun in der Variable einmaleins gespeichert. 

> Excel passt übrigens implizit den Multiplikationsoperator an, wenn es glaubt, dass ein Kreuzprodukt erstellt werden muss. 

Wir können die gleiche Strategie in Excel übrigens auch verwenden, wenn wir zwei Spaltenvektoren haben. Die `t()`-Funktion heisst in Excel `MTRANS()`.

Nehmen wir an,  wir haben in den  Zellen A1 und B1 jeweils einen Spaltenvektor mit der Formel `SEQUENZ(10)` erzeugt. Wir schreiben dann unsere Einmaleins Formel wie folgt: 

```
= A1# * MTRANS(B1#)
```

Jetzt können wir die geraden Zahlen in diesem Einmaleins zählen. Dazu verwenden wir den Modulo-Operator von R (`%%`). Der Modulo-Operator entspricht der `REST()`-Funktion in Excel. 

Weil unsere zählbare Einheit die geraden Zahlen sind und für die geraden Zahlen Modulo 2 immer genau 0 ergibt, müssen wir die Nullen in Einsen und die Einsen in Nullen umwandeln. Wir können das ganz analog zu Excels `WENN()` -Funktion mit Rs `ifelse()`-Funktion erreichen. Die Parameter der beiden Funktionen sind identisch. 

Das Ergebnis schreiben  wir in die Variable `zählbareTabelle`.


```R
zählbareTabelle = ifelse(einmaleins %% 2, 0, 1)
```

In unserem Fall haben wir eine Matrix mit Nullen und Einsen, die wir invertieren müssen. 

Das können wir ganz ohne `WENN` erreichen, indem wir die Matrix mit -1 multiplizieren und dann zu jedem Wert 1 hinzuzählen. Die Multiplikation mit -1  ziehen wir mit der Modulo Operation zusammen und Teilen durch -2. 

Das Ergebnis schreiben wir in die Variable `zählmatrix`.


```R
zählmatrix = einmaleins %% -2 + 1
```

Abschliessend zählen wir durch Summenbildung und erhalten unser Ergebnis. Hier erhalten wir zweimal das gleiche Ergebnis aus zwei unterschiedlichen Lösungswegen. 


```R
sum(zählmatrix)
sum(zählbareTabelle)
```


1813



1813


### Funktionsketten

Als Funktionskette können wir das natürlich auch schreiben.


```R
library(tidyverse)
```

    ── [1mAttaching packages[22m ─────────────────────────────────────── tidyverse 1.3.0 ──
    
    [32m✔[39m [34mggplot2[39m 3.3.2     [32m✔[39m [34mpurrr  [39m 0.3.4
    [32m✔[39m [34mtibble [39m 3.0.3     [32m✔[39m [34mdplyr  [39m 1.0.2
    [32m✔[39m [34mtidyr  [39m 1.1.2     [32m✔[39m [34mstringr[39m 1.4.0
    [32m✔[39m [34mreadr  [39m 1.3.1     [32m✔[39m [34mforcats[39m 0.5.0
    
    ── [1mConflicts[22m ────────────────────────────────────────── tidyverse_conflicts() ──
    [31m✖[39m [34mdplyr[39m::[32mfilter()[39m masks [34mstats[39m::filter()
    [31m✖[39m [34mdplyr[39m::[32mlag()[39m    masks [34mstats[39m::lag()
    



```R
1:57 %>% 
    t() %>%                # 1:57 transponieren
    `%*%`(1:43, .) %>%     # Kreuzprodukt (1:57 als 2. Parameter)
    `%%`(-2) %>%           # Modulo -2
    `+`(1) %>%             # + 1        -> Zählbare Einheiten
    sum()                  # Zählen
```


1813


Alternative mit `ifelse`


```R
1:57 %>% 
    t() %>%                # 1:57 transponieren
    `%*%`(1:43, .) %>%     # Kreuzprodukt (1:57 als 2. Parameter)
    `%%`(2) %>%            # Modulo 2
    ifelse(0, 1) %>%
    sum()
```


1813



```R

```
