## Mathematische Funktionen visualisieren

In der Mathematik werden regelmässig Funktionen besprochen. Diese Funktionen können wir mit R leicht visualisieren.

Dabei nutzen wir aus, dass wir in R neue Funktionen mit dem Schlüsselwort `function` definieren können. Im folgenden Beispiel verwenden wir die beiden Funktionen.

$$
f1(x) \to x^2 - 3x
$$

und 

$$
f2(x) \to 4x + 2
$$

Als Erstes laden wir wie immer die `tidyverse`-Bibliothek, damit wir die ggplot-Funktionen und die Funktionsverkettung verwenden können.


```R
library(tidyverse)
```

Im nächsten Schritt erstellen wir unsere beiden mathematischen Funktionen. Dabei beachten wir, dass wir den Namen der jeweiligen Funktion als eine Variable zuweisen müssen. Die rechte Seite der Zuweisung zeigt R an, dass wir eine neue Funktion mit dem Parameter `x` erstellen möchten. Nach dieser *Funktionsdefinition* folgt der sog. Funktionskörper in geschweiften Klammern. Hier schreiben wir die Formel unserer Funktion in der ausführlichen Operatorenschreibweise. Anders als bei der mathematischen Schreibweise dürfen wir keine Operatoren weglassen. 


```R
f1 = function (x) {
    x ^ 2 - 3 * x
}

f2 = function (x) {
    4 * x + 2
}
```

Damit `ggplot` "weiss", welches Intervall für `x` wir darstellen möchten, erzeugen wir eine Stichprobe mit einem Vektor `x`, der genau zwei Werte hat. Diesen Vektor weisen wir der Variable `Darstellungsbereich` zu. Wenn wir die Werte symmetrisch angeben, dann landet die 0 auf der x-Achse in der Mitte unseres Diagramms. 


```R
Darstellungsbereich = tibble(x = c(-9, 9)) 
```

Jetzt können wir unsere Funktion visualisieren. Wir übergeben die Stichprobe im der Variablen `Darstellungsbereich` an die `ggplot()`-Funktion und legen den Vektor `x` als Grenzen für die x-Achse fest. Anschliessend rufen wir die Funktion `geom_line()` auf, um einen Graphen zu erzeugen. Weil wir keine Werte für die y-Achse haben, legen wir fest, dass wir die y-Werte aus einer Funktion berechnen wollen. Das erreichen wir mit dem Parameter `stat = "function"`. Sobald wir diesen Parameter angeben, erwartet die `geom_line()` Funktion eine Funktion zur Berechnung der y-Werte. Diese Funktion übergeben wir mit dem Parameter `fun = f1`, wobei `f1` eine unserer vorab definierten Funktionen ist. 


```R
Darstellungsbereich %>%
    ggplot(aes(x)) + 
        geom_line(stat = "function", fun = f1)
```


    
![png](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/funktionen/output_7_0.png)
    


Diesen Schritt können wir für die Funktion `f2` wiederholen. 


```R
Darstellungsbereich %>%
    ggplot(aes(x)) + 
        geom_line(stat = "function", fun = f2)
```


    
![png](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/funktionen/output_9_0.png)
    


Weil wir mit `ggplot` Darstellungen überlagern können, dürfen wir die beiden Funktionen selbstverständlich auch in einem Diagramm darstellen.


```R
Darstellungsbereich %>%
    ggplot(aes(x)) + 
        geom_line(stat = "function", fun = f1) + 
        geom_line(stat = "function", fun = f2)
```


    
![png](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/funktionen/output_11_0.png)
    


Wir wollen die beiden Graphen noch visuell hervorheben, damit wir wissen, welcher Graph zu welcher Funktion gehört. Dabei überlassen wir die Auswahl der Farben `ggplot`, womit wir sicherstellen, dass die Farben nicht zu ähnlich sind. Dazu verwenden wir den Trick, dass wir jeder Geometrie-Funktion ergänzende ästhetische Parameter übergeben dürfen.


```R
Darstellungsbereich %>%
    ggplot(aes(x)) + 
        geom_line(stat = "function", fun = f1, aes(colour = "f1(x) = x ^ 2 - 3 * x")) + 
        geom_line(stat = "function", fun = f2, aes(colour = "f2(x) = 4 * x + 2"))
```


    
![png](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/funktionen/output_13_0.png)
    


Die Legende für unser Diagramm hat keine schöne Überschrift. Das passen wir noch schnell mit der `labs()`-Funktion(für *labels* bzw. *Beschriftungen*) an. Dort geben wir für den ästhetischen Parameter die richtige Beschriftung an. In unserem Fall ist das `colour`.


```R
Darstellungsbereich %>%
    ggplot(aes(x)) + 
        geom_line(stat = "function", fun = f1, aes(colour = "f1(x) = x ^ 2 - 3 * x")) + 
        geom_line(stat = "function", fun = f2, aes(colour = "f2(x) = 4 * x + 2")) +
        labs(colour = "Funktion")
```


    
![png](https://github.com/dxiai/ct-resourcen/raw/main/bilder/visualisierung/funktionen/output_15_0.png)
    