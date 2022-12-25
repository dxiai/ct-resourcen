
**Das Problem:** Es soll eine Funktion auf alle Datensätze einer Stichprobe angewandt und in einem neuen Vektor abgelegt werden. 

<p class="alert  alert-primary" markdown="1">
**Definition:**  Wir sprechen vom **konvertieren** oder vom *umwandeln*, wenn eine Funktion die Datensätze einer Stichprobe unabhängig voneinander verändert. 
</p>

Diese Definition schliesst ein, dass für jeden Datensatz der ursprünglichen Stichprobe \\( S_0 \\) *genau ein* Datensatz in der Ergebnisstichprobe \\( S_t \\) vorliegen muss. Dabei gilt für jeden Datensatz in \\( S_t \\), dass genau eine Entsprechung in \\( S_0 \\) existiert. In der Praxis werden wir beim Umwandeln einer Stichprobe neue Vektoren zur Stichprobe hinzufügen oder bestehende Vektoren ersetzen.

In EXCEL müssen wir Operationen zum Umwandeln von Daten nicht besonders kennzeichnen. Weil das Umwandeln immer einen neuen Vektor erzeugt, müssen wir zur verbesserten Nachvollziehbarkeit eine geeignete Überschrift gewählen.

In R markieren wir das Umwandeln eines Stichprobenobjekts mit Hilfe der Funktion `mutate()`. Diese Funktion führt die als Parameter übergebenen Operationen für jeden Datensatz in der Stichprobe aus. Der `mutate()`-Funktion können wir einen Vektorennamen gefolgt von einer Operation als Parameter übergeben. Das ganze sieht dann wie eine normale Zuweisung aus, die von der `mutate()`-Funktion eingerahmt wird, wie das folgende Beispiel zeigt. Das Beispiel fügt den Vektor `neueDaten` der mit `tibble()` erzeugten Stichprobe an. Für die Werte in diesem Vektor werden aus den Werten im Vektor `alteDaten` durch die Addition mit `1` erzeugt. 

```R
tibble(
    alteDaten = c(3, 2, 7, 9, 4, 8, 13)
) %>%
    mutate(
        neueDaten = alteDaten + 1
    )
```

<p class="alert  alert-success" markdown="1">
**Merke:** Bei Transformationen mit der `mutate()`-Funktion von R bleiben alle Vektoren der ursprünglichen Stichprobe \\( S_0 \\) erhalten, sofern wir sie nicht beim Konvertieren explizit überschreiben.
</p>

Das folgende Beispiel zeigt das Überschreiben eines Vektors in R: 

```R
tibble(
    alteDaten = c(3, 2, 7, 9, 4, 8, 13)
) %>%
    mutate(
        alteDaten = alteDaten + 1
    )
```

In diesem Fall enthält die Ergebnisstichprobe nur die um eins erhöhten Werte. 

<p class="alert  alert-success" markdown="1">
**Merke:** In EXCEL können wir keine Werte überschreiben, weil jede Konvertierung in einem eigenen *eindeutigen* Bereich erzeugt und keine bestehenden Werte überlagern kann. 
</p>

## Einfaches (triviales) Konvertieren

<p class="alert  alert-info" markdown="1">
**Definition:**  Wir bezeichnen eine Operation als **trivial**, wenn sich diese Operation keinen funktionalen Bezug zu den vorliegenden Werten hat. 
</p>

Wir haben im Abschnitt Zählen und Abzählen bereits eine solche triviale Umwandlungsoperation kennengelernt: Das Nummerieren. Beim Nummerieren weisen wir jedem Datensatz einer Stichprobe in der Reihenfolge des Auftretens einen Wert aus einer Zahlensequenz zu. 

In EXCEL verwenden wir dazu die Funktion `SEQUENZ()` mit der Anzahl der Datensätze als Parameter. In R nummerieren die Datensätze einer Stichprobe mit der Funktion `seq()` oder einer ihrer Kurzformen. Da diese Operation nur die Reihenfolge des Auftretens eines Datensatz berücksichtigt, gibt es keinen Bezug zu den zugehörigen Werten. Daher handelt es sich um ein *triviales Umwandeln*.

<div class="alert  alert-warning" markdown="1">
Beim Nummerieren in EXCEL und R müssen die *leere Stichprobe* gesondert behandeln, weil beide Umgebungen eine Sequenz der Länge 0 nicht einfach erzeugen können. EXCEL erzeugt für die Formel `=SEQUENZ(0)` oder `=SEQUENZ(1;0)` den Fehler `#KALK!`. R erzeugt für die Umwandlung `tibble() %>% mutate(nummerierung = 1:n())` einen kryptischen Fehler. 

In EXCEL benötigen wir eine Hilfsoperation, um Situationen abzufangen, falls ein Vektor die  Länge 0 hat.

In R können wir dieses Problem auf zwei Wegen lösen: 

1. Wir verwenden den expliziten `seq()` Aufruf mit `tibble() %>% mutate(nummerierung = seq(length = n()))` oder
2. Wir verwenden die Funktion `row_number()` mit `tibble() %>% mutate(nummerierung = row_number())`.
</div>

*Hinweis:*  Wenn wir die `tibble()` Funktion ohne Parameter aufrufen, dann erhalten wir ein leeres Stichprobenobjekt. In der Praxis erzeugen wir solche Objekte nicht direkt. Meistens ergeben sich leere (Teil-)Stichproben aus vorangegangenen Arbeitsschritten. 

<div class="alert  alert-info" markdown="1">
In EXCEL führen leere Ergebnisstichproben zum Fehlerwert `#KALK!`. Solche Fehler müssen "abgefangen" werden. Techniken zum Fehlerabfangen lernen Sie im Abschnitt "Logische Ausdrücke und Vergleiche" kennen. 
</div>

## Umformen von Daten in Datensätzen 

<p class="alert  alert-primary" markdown="1">
**Definition:** Wir bezeichnen eine *Funktion* als **Transformationsfunktion**, wenn diese Funktion einen Wert *umwandelt*. 
</p>

Wir haben im Abschnitt Zählen und Abzählen haben wir eine Transformation bereits verwendet, als wir die zählbaren Einheiten in der Speziesstichprobe ermittelt haben. In diesem Beispiel haben wir ein zählbares Element auf der Grundlage der gefundenen Gensequenzen im jeweiligen Datensatz festgestellt. Damit ergibt sich ein funktionaler Bezug zu den Werten in den jeweiligen Datensätzen, weil die Transformationsfunktion der Vergleich der vorliegenden Werte zum Ergebnis der Transformation führt. 

Im Beispiel mit den Gensequenzen ist die Transformationsfunktion: 

<!--
$$
f_t(x) \to 
\begin{cases}
FALSCH, x = 0 \\
WAHR, x \ne 0
\end{cases}
$$
-->

<img src="" width="60%" alt="Transformationsfunktion Zählbares Element">

Diese **Transformationsfunktion** haben wir im Video über das Zählen in EXCEL mit der Formel `= WENN(C2:C301; 1; 0)` umgesetzt. In R würden wir die zählbaren Elemente mit der folgenden Funktionskette identifizieren:

```R 
library(tidyverse)
library(readxl)

gensequenzen = read_excel("VideoBeispielGenDaten.xls")

gensequenzen %>%
    mutate(
        zaehlbaresElement = ifelse(Sequenzen, 1, 0) 
    )
```

Die Excel Formel und die Umwandlung in R fügen unserer Stichprobe einen neuen Vektor an, der für jeden Datensatz anzeigt, ob es sich um ein zählbares Element handelt oder nicht. Wenn wir ein zählbares Element vorliegen haben, dann steht im neu erzeugten Vektor `zaehlbaresElement` der Wert `1`, sonst der Wert `0`. Im Gegensatz zu EXCEL müssen wir in R keinen Adressbereich, sondern den Vektornamen angeben, der als Parameter für die Funktion `ifelse()` verwendet wird.

### Arbeitsschritte mit R zusammenfassen

<p class="alert  alert-success" markdown="1">
In R dürfen wir mehrere Konvertierungen in einem `mutate()`-Aufruf zusammenfassen. In diesem Fall können wir die unmittelbar zuvor erstellten Vektoren ebenfalls in unseren Transformationsfunktionen nutzen.
</p>

Das folgende Beispiel zeigt diese Möglichkeit: 

```R
tibble(
    alteDaten = c(3, 2, 7, 9, 4, 8, 13)
) %>%
    mutate(
        plusEins = alteDaten + 1,
        dividiert = alteDaten / plusEins
    )
```

Wir können jedoch nur auf die Vektoren zugreifen, die **vor** dem jeweiligen Schritt erstellt wurden. Wir müssen deshalb in solchen Fällen auf die Reihenfolge unserer Operationen achten. Das folgende Beispiel zeigt **ungültigen Code**, bei dem die Erstellungsreihenfolge der Vektoren nicht eingehalten wurde. 

```R
tibble(
    alteDaten = c(3, 2, 7, 9, 4, 8, 13)
) %>%
    mutate(
        dividiert = alteDaten / plusEins,  # der Vektor plusEins existiert noch nicht :(
        plusEins = alteDaten + 1
    )
```

Dieser Code erzeugt einen Fehler, dass der Vektor `plusEins` noch nicht existiert, wenn der Vektor `dividiert` erstellt werden soll. Damit kann die Transformationsfunktion für diesen Vektore nicht ausgeführt werden. 