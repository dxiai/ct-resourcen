# Visualisierungen mit R und ggplot2

In R erstellen wir Plots mit Hilfe der `ggplot2`-Funktionen. Anders als in EXCEL werden mit diesen Funktionen Plots schrittweise aufgebaut und können auf diese Weise einheitlich reproduziert werden. 

<p class="alert alert-info" markdown="1">
Eine umfassende Einführung zu den Funktionen und Konzepten von `ggplot2` gibt das Buch von [Wickham (2021)](https://ggplot2-book.org/). Dieses Buch erläutert alle relevanten Konzepte und Tricks für die gängigsten Visualisierungen. 
</p>

<p class="alert alert-info" markdown="1">
Einen schnellen Überblick zu den wichtigsten Visualisierungsfunktionen finden Sie im [Visualisierungsspickzettel](https://github.com/rstudio/cheatsheets/raw/main/data-visualization.pdf)
</p>

Wir erzeugen eine Datenvisualisierung immer mit den folgenden Funktionsaufrufen:

1. Wir initiieren einen Plot mit der Angabe der darzustellenden Vektoren.
2. Anschliessend wählen wir die Darstellung der Datenpunkte mit einer *Geometriefunktion* aus. 

<p class="alert alert-success" markdown="1">
`ggplot2` verwendet zur Funktionsverkettung den `+`-Operator und nicht wie der Rest der modernen R-Funktionen den Verkettungsoperator `%>%`. Wir können also leicht erkennen, dass ein Code-Fragment einen Plot erzeugt, wenn Funktionen mit `+` verkettet sind.
</p>

Mit den folgenden Funktionsaufrufen erzeugen wir ein einfaches Punktdiagramm. Als Beispielstichprobe verwenden wir hier die `iris`-Daten, die mit R mitgeliefert werden. 

```R
iris %>%
   ggplot(aes(x = Sepal.Length, y = Petal.Length)) + 
       geom_point()
```

Das Ergebnis dieser Operation sieht wie folgt aus: 

<img src="https://github.com/dxiai/ct-resourcen/blob/main/bilder/visualisierung/iris_points.png?raw=true" width="600" alt="Punktdiagramm der iris-Daten">

Mehr Details zu dieser Beispielstichprobe finden Sie auf [Wikipedia](https://en.wikipedia.org/wiki/Iris_flower_data_set).

***Was geht hier technisch vor?***

In der ersten Zeile legen wir fest, welche Daten visualisiert werden sollen. Die Grundlage für jede Datenvisualisierung ist immer ein Transformationsergebnis. In diesem Beispiel transformieren wir *implizit* mit der [Identitätsfunktion](https://moodle.zhaw.ch/mod/page/view.php?id=544805). 

Wir müssen die `iris`-Daten übrigens nicht explizit über *Library()* importieren, weil R diese Beispieldaten für uns automatisch importiert.

In der zweiten Zeile signalisieren wir R mit der Funktion `ggplot()`, dass wir einen Plot erzeugen wollen. Wir übergeben als Parameter das Ergebnis der `aes()`-Funktion. 

<p class="alert alert-info" markdown="1">
Die Funktion `aes()` legt die ***ästhetischen*** Voraussetzungen für einen Plot fest. Damit legen wir fest, welche Daten für unsere Datenpunkte verwendet werden sollen.
</p>

In diesem Beispiel legen wir den Vektor `Sepal.Length` für die Koordinaten auf der x-Achse und `Petal.Length` für die Koordinaten auf der y-Achse fest. Die Datenpunkte werden also durch die beiden gemeinsam auftretenden Werte in diesen Vektoren festgelegt.

Mit der dritten Zeile legen wir die ***Geometrie*** der Datenpunkte fest. Alle `ggplot2`-Funktionsnamen zur Darstellung von Datenpunkten beginnen mit `geom_` (für Geometrie). In diesem Beispiel wollen wir unsere Datenpunkte mit Punkten (engl. Points) darstellen. Deshalb verwenden wir die Funktion `geom_point()`.

Diese drei Schritte zeigen die grundsätzliche Logik zum Erstellen von Plots mit R.  

