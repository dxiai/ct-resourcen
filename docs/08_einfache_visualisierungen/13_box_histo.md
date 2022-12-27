Box-Whisker-Diagramme oder Box-Plots sind Darstellungen der Quartile eines Vektors. 

Der Median wird beim Boxplot als Linie und die Quartile um den Median werden als Rechteck (Box) angezeigt. Die Box zeigt uns daher den sog. *Interquartilsabstand*. Die anderen beiden Quartile werden als Linien (Whiskers) dargestellt. Wir können uns diese Darstellung wie die (sehr abstrakte) Schnauze einer Katze vorstellen. 

Wenn Sie mit grossen Wertebereichen arbeiten, bestimmt `ggplot` ausserdem Ausreisser und Extremwerte und stellt diese im Plot dar.

Das folgende Beispiel zeigt ein Box-Whisker-Diagramm für den Vektor `sozial_like_unbekannt `. 

[[fa-download] beispieldaten.csv](https://moodle.zhaw.ch/mod/resource/view.php?id=635316){.btn.btn-primary}


```R
daten  %>%
    filter(technik_unruhig_wenn_telefon_weg >= -1 ) %>%
    ggplot(aes(x = technik_unruhig_wenn_telefon_weg)) + 
        geom_boxplot() 
```


    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_23_0.png">
    


Gelegentlich wollen wir die Quartile mehrerer Vektoren  miteinander vergleichen. Weil wir für die X-Achse und die Y-Achse jeweils nur einen Vektor mit `ggplot` verwenden können, müssen wir in diesem Fall unsere Stichprobe mit `pivot_longer()` transformieren.

Dafür erstellen wir einen Vektor, der den ursprünglichen Vektornamen enthält (in diesem Beispiel `vektoren`), und einen Vektor, der die jeweiligen Werte enthält (hier  `werte`). In der Praxis müssen wir regelmässig ungültige Daten entfernen (bzw. heraus*filtern*). Das erreichen wir mit der `filter()`-Funktion.

Nach dieser Transformation können wir `ggplot()` für die beiden neu erstellten Vektoren ganz normal verwenden. 

Im Beispiel verwende ich am Abschluss die `coord_flip()`-Funktion, um die Lesbarkeit des Plots zu verbessern. 

Die Funktion `pivot_longer()` erzeugt aus den Vektorennamen einen Vektor mit sogenannten **diskreten Werten**. Solche Werte werden in R als sog. Faktoren gespeichert. R versucht für Faktoren eine sinnvolle Reihenfolge zu bestimmen. In der Praxis sind diese Versuche selten passend. Damit solche Werte in der richtigen Reihenfolge dargestellt werden, müssen wir sie meistens selbst in die richtige Reihenfolge bringen. In diesem Beispiel mache ich das mit Hilfe der Funktionen `fct_inorder()` und `fct_rev()`. Nur so kann ich sicherstellen, dass die Reihenfolge der Werte auf der `vektoren`-Achse angemessen sortiert sind. 


```R
daten %>%
    select(starts_with("technik_")) %>%
    # Transformieren
    pivot_longer(starts_with("technik_"),
        names_to = "vektoren",
        values_to = "werte"
    ) %>%
    # Ungültige Werte entfernen
    filter(werte >= -1) %>%
    # Vektorennamen aufsteigend sortieren
    mutate(
        vektoren = vektoren %>% fct_inorder() %>% fct_rev() 
    ) %>%
    # BoxPlots erstellen
    ggplot(aes(x = vektoren, y = werte)) +
        geom_boxplot() +
        coord_flip()
```
    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_25_0.png">

<p class="alert alert-success" markdown="1">
Wenn Sie die Boxplots vergleichen, dann suchen Sie nach *Boxen*, die sich nicht überlagern. Für den Fall, dass die Quartilsgrenzen der Box für zwei Merkmale sich nicht überlagern, dann werden Sie wahrscheinlich einen signifikanten Unterschied feststellen. 
</p>

Diese Technik ist dann sinnvoll, wenn Sie viele Merkmale vergleichen müssen und schnell erste Ergebnisse liefern sollen.

### Box-Whisker-Diagramme und Histogramme überlagern

<p class="alert alert-info" markdown="1">
Um dieses Beispiel nachzuvollziehen, wählen Sie eine ***beliebige Stichprobe***. Sie müssen die zu analysierenden Vektoren und Wertebereiche ggf.  anpassen.
</p>

Wir wissen, dass wir Geometrien mit ggplot überlagern können.

Manchmal möchten wir ein Histogramm und ein Box-Whisker-Diagramm kombinieren. Ganz naiv würden wir nun einfach ein Histogramm und den Boxplot nacheinander aufrufen.

```R
stichprobe %>% 
    ggplot(aes(x = werte))+ 
        geom_bar() +
        geom_boxplot()
```
![Kombiniertes Histogramm und Box-Whisker-Diagramm](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/advanced/histobox.png)

Das Box-Whisker-Diagramm kann man leider nur schlecht erkennen. Also machen wir es etwas grösser, indem wir die Breite der Box vergrössern. Dazu müssen wir uns merken, dass Box-Whisker-Diagramme eigentlich vertikal und nicht horizontal gezeichnet werden. 

```R
stichprobe %>% 
    ggplot(aes(x = werte)) + 
        geom_bar() +
        geom_boxplot(width = 5)
```
![Kombiniertes Histogramm und breiteres Box-Whisker-Diagramm](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/advanced/histobox_bigger.png)

Dieser naive Zugang funktioniert ganz grundsätzlich, aber leider können wir das Box-Whisker-Diagramm immer noch nicht gut erkennen. 

Grundsätzlich könnten wir das Histogramm etwas heller zeichnen lassen und das Box-Whisker-Diagramm farblich etwas hervorheben. Das ist aber nicht besonders elegant, weil die beiden Diagrammtypen die Daten unterschiedlich abbilden. Wir möchten deshalb das Box-Whisker-Diagramm stärker vom Histogramm abheben, indem wir es etwas nach unten rücken. 

Kein Problem, fragen wir Dr. Google nach `ggplot2 boxplot unter ein histogramm positionieren`.  Leider liefert keiner der Treffer für diese Suchanfrage ein brauchbares Resultat für diese Aufgabe. Auch die englische Suchanfrage `ggplot2 position boxplot below a histogram` liefert zwar viele Ergebnisse, die aber nur viele *komplizierte* Lösungen beschreiben.

Da hilft nur der Blick in die [Dokumentation für `geom_boxplot()`](https://ggplot2.tidyverse.org/reference/geom_boxplot.html). Dort fällt der Parameter `position` auf, für den es heisst: *"Position adjustment, either as a string, or the result of a call to a position adjustment function"*. Wir fragen uns nun, was eine `position adjustment function` sein könnte. Diese Funktionen sind in der [ggplot2-Dokumentation gebündelt](https://ggplot2.tidyverse.org/reference/#section-position-adjustment). Dort finden wir die unscheinbare Funktion `position_nudge()` (*nudge* = schubsen). Mit dieser Funktion können wir die Position um feste Werte entlang der x- und der y-Achse verschieben (bzw. in die entsprechende Richtung schubsen). 

Wir wollen das Box-Whisker-Diagramm etwas nach unten bringen. Das bedeutet: Die Position soll zu einem kleineren Wert auf der y-Achse geschoben werden. Das erreichen wir mit der Positionierung `position_nudge(y = -5)`. 

<p class="alert alert-info" markdown="1">
Ich habe hier den Wert `5` gewählt, damit es bei der um 5 breiteren Box noch einen sichtbaren Abstand zwischen dem Histogramm und der Box gibt. Der Wert `5` leitet sich aus dem Maximalwert des Histogramms ab. Sind die Maximalwerte sehr gross, wäre der Wert `5` wahrscheinlich zu klein. Ein sichtbarer Abstand ist dann gegeben, wenn Sie etwa den halben Abstand zwischen zwei der Standard-Hilfslinien im Plot-Bereich wählen. (In diesem Beispiel wären das ca. `6`) 
</p>

Wir ergänzen nun unsere Visualisierung um diesen Teil. 

```R
stichprobe %>% 
    ggplot(aes(x = value))+ 
        geom_bar() +
        geom_boxplot(width = 5, position = position_nudge(y = -5))
```

![Kombiniertes Histogramm und Box-Whisker-Diagramm mit Hervorhebung](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/advanced/histobox_nicer_bigger.png)

Das Ergebnis stellt nun elegant das Box-Whisker-Diagramm unter dem Histogramm dar, sodass wir die Verteilung und die Quartile leicht vergleichen können. 
