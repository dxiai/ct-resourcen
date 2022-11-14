
## Problem

Eine Aggregationsfunktion kann nicht mit gruppierten Stichproben umgehen. 

## Lösung

Anstelle einer Gruppierung werden die auszuwertenden Daten in eigene Stichproben zusammengefasst, die anschliessend in die ursprüngliche Stichprobe eingebettet werden.

```R
mtcars %>% 
  select(c(gear, cyl, carb, am)) %>%
  nest(cyl, carb, am)
```

| gear <br> &lt;dbl> | data <br> &lt;list> |
| ---: | :---: |
| 4 | &lt;tibble> |
| 3 | &lt;tibble> |			
| 5 | &lt;tibble> |			

## Erklärung

Die Funktion `nest()` erlaubt das einbetten von Vektoren als Teilstichproben analog zum Gruppieren. Wir verwenden diese Strategie immer dann, wenn eine Funktion gruppierte Stichproben nicht richtig bearbeiten kann oder die Handhabung zu umständlich ist. 

Die Funktion `nest()` fasst die angegebenen Vektoren in Teilstichproben zusammen. Anschliessen wird  das Ergebnis immer in einer Liste gekapselt, weil das erzeugte Stichprobenobjekt eine komplexe Datenstruktur ist. Deshalb gelten für nachfolgende Transformationen die gleichen Regeln, wie für alle anderen eingebetteten Daten.

Die Funktionen `nest()` und `unnest()` sind Umkehrfunktionen und folgen der gleichen Logik wie die Funktionen `pivot_longer()` und `pivot_wider()`. Dabei entspricht die Funktion `nest()` der Funktion `pivot_longer()` und die Funktion `unnest()` der Funktion `pivot_wider()`. 

Zur Auswahl der Vektoren für die Funktion `nest()` dürfen `tidyselect` Funktionen und Operatoren verwendet werden. So können viele Vektoren auf einmal ausgewählt werden.

Weil die Funktionen `nest()` und `pivot_longer()` ähnliche Anwendungsgebiete haben, ist braucht die Auswahl der richtigen Funktion eine Entscheidungshilfe. 

<p class="alert alert-success" markdown="1">
Die Funktion `nest()` muss (fast) immer dann verwendet werden, wenn für gruppierte Werte eine Transformationsfunktion einen komplexen Datentyp und keinen einzelnen Wert zum Ergebnis hat. 
</p>
