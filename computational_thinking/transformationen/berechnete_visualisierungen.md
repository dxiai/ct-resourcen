## Berechnete Visualisierungen mit R

Wir haben im Abschnitt zu einfachen Visualisieren in R die Funktion  `ggplot()` kennengelernt, um zwei Vektoren zu visualisieren.

Sehr häufig wir einen Vektor und wollen sehen, wie die Werte in diesem Vektor verteilt sind. Wir sollen also die Werte in dem Vektor für die Visualisierung **aggregieren**. Hierbei handelt es sich um eine so häufige Aufgabe, dass uns `ggplot()` diese Aufgabe abnimmt. 

Für verschiedene Visualisierungen hat `ggplot()` vordefinierte Funktionen, mit denen Werte für die Visualisierung aufbereitet werden, wenn die Werte für eine Achse fehlen. Diese Funktionen müssen wir im Detail nicht kennen, denn `ggplot()` wählt diese automatisch für uns aus. 

Wir lernen heute zwei wichtige berechnete Visualisierungen kennen. 

1. Das Histogramm 
2. Den Box-Plot

### Histogramm

<p class="alert alert-primary" markdown=1>
**Definition:** Also *Histogramm* werden Balkendiagramme bezeichnet, die die *Häufigkeiten* von gemessenen Werte darstellen. 
</p>

Das übliche Balkendiagramm erzeugen wir mit der Funktion `geom_bar()`. Diese Funktion verwenden wir immer, wenn unsere gemessenen Werte nur auf bestimmte Werte fallen (können). Die `geom_bar()`-Funktion zählt für jeden gemessenen Wert die Anzahl der Datensätze in denen dieser Wert vorkommt. 

<p class="alert alert-primary" markdown=1>
**Definition:** Nehmen die gemessenen Daten immer genau bestimmte Werte ein, dann bezeichnen wir diesen Wertebereich als *diskrete Werte*.
</p>

Gelegentlich sind unserer Werte so verteilt, dass nur selten zwei oder mehr Datensätze gleiche Werte haben. In solchen Fällen verwenden wir die Funktion `geom_histogram()`. Diese Funktion teilt den gesamten Wertebereich in gleichmässige Intervalle und zählt die Anzahl der Datensätze im jeweiligen Intervall.

Das folgende Beispiel veranschaulicht die Situation. 

Wir verwenden die Stichprobe `digitales_umfeld1.csv`. In dieser Stichprobe gibt es den Vektor `tage`, der das Alter der beantwortenden Person in Tagen festhält. Dabei handelt es sich rein formell um *diskrete Werte*. Wenn wir die Verteilung dieser Werte in einem Histogramm für *diskrete Werte* darstellen würden, dann erhalten wir das folgende Histogramm: 

```R
library(tidyverse)

digitales_umfeld = read_csv("digitales_umfeld1.csv")

digitales_umfeld %>% 
    ggplot(aes(x = tage)) +
        geom_bar()
```

<img src="https://github.com/dxiai/ct-resourcen/raw/master/bilder/visualisierung/tage_barplot.png">

Auf diesem Histogramm kann man keine Verteilung erkennen. Es scheint, als ob alle Werte genau einmal vorkommen. Der Wertebereich der y-Achse deutet aber darauf hin, dass einzelne Werte bis zu drei Mal vorkommen. Diese Balken sind jedoch so dünn, dass sie nicht im Diagramm dargestellt werden können. 

<p class="alert alert-primary" markdown=1>
**Definition:** Verteilen sich die Werte relativ gleichmässig über Intervalle in einem Wertebereich, dann bezeichnen wir diese Werte als *kontinuierliche Werte*.
</p>

Die Werte in diesem Vektore verhalten sich also wie *kontinuierliche Werte*. Deshalb verwenden wir die Funktion `geom_histogram()`, um die Daten darzustellen. 

```R
digitales_umfeld %>% 
    ggplot(aes(x = tage)) +
        geom_histogram()
```

<img src="https://github.com/dxiai/ct-resourcen/raw/master/bilder/visualisierung/tage_histogram.png">

Aus diesem Histogram können wir wesentlich besser die Verteilung des Alters in Tagen ablesen, weil der Wertebereich in grössere Segmente gegliedert wurde und die Datensätze in diesen Segmenten gezählt wurden.

<p class="alert alert-success" markdown=1>
**Merke:** Histogramme für *kontinuierliche Werte* erzeugen wir mit der Funktion `geom_histogram()`. Histogramme für *diskrete Werte*  erzeugen wir mit der `geom_bar()`-Funktion.
</p>

#### Histogramme selbst berechnen

Gelegentlich haben uns bereits die Häufigkeiten für ein Histogramm als Teil unserer Stichproben. In solchen Fällen verwenden wir die Funktion `geom_col()`, um die Daten als Histogramm darzustellen. In diesem Fall müssen wir neben der x-Achse auch den Vektor mit den berechneten Werten für die y-Achse an `ggplot()`'s `aes()`-Funktion übergeben.

### Box-Plot

<p class="alert alert-primary" markdown=1>
**Definition:** Ein Box-Plot stellt die Verteilung eines Stichprobenvektors mit Hilfe von Quartilen dar. 
</p>

Box-Plots werden mit der `geom_boxplot()` Funktion dargestellt. 

Beim Box-Plot wird der Median als dicke Linie dargestellt. Der Interquartilsabstand wird als Rechteck (*Box*) um den Median visualisiert (2. und 3. Quartil). Dabei liegen die Hälfte der aller gemessenen Werte innerhalb der dargestelltn Box.  Der gesamte Umfang wird durch Linien links (1. Quartil) und rechts (4. Quartil) vom Interquartilsabstand dargestellt. Manchmal werden Punkte an den äusseren Rändern  dargestellt. Diese Punkte stellen sog. Ausreisser dar.

Wiederholen wir die Visualisierung für unsere Alterstage mit einem Boxplot, dann erhalten wir folgendes Ergebnis: 

```R
digitales_umfeld %>% 
    ggplot(aes(x = tage)) +
        geom_boxplot()
```

<img src="https://github.com/dxiai/ct-resourcen/raw/master/bilder/visualisierung/tage_boxplot.png">

Wir erkennen jetzt leicht, dass der Grossteil der Gruppe unter 10000 Tagen alt ist und dass es sechs Ausreisser gibt, die deutlich älter als der Grossteil der Gruppe sind. 

***Reflexionsaufgabe:** Erstellen Sie einen Boxplot über den Vektor `alter`, der das Alter in Jahren enthält. Was fällt Ihnen bezüglich der Ausreisser auf? Welche Ursache könnte dieser Unterschied haben?*