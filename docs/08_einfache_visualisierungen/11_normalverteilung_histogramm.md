Histogramme sind Balkendiagramme, die uns die Häufigkeiten von Werten in unseren Stichproben anzeigen. Diese Plots entsprechen den Ergebnissen der `count()`-Funktion.

Histogramme sind hervorragend dazu geeignet, uns einen visuellen Eindruck über die Verteilung der Werte eines Vektors zu geben.

Zur Erstellung von Histogrammen stehen uns drei Funktionen zur Verfügung: 

1. `geom_histogram()`
2. `geom_bar()`
3. `geom_col()`

Die ersten beiden Funktionen können einen Vektor automatisch zusammenfassen. 

Falls wir mit `count()` oder ähnlichen Funktionen unsere Stichprobe bereits zusammengefasst haben, dann verwenden wir immer die `geom_col()`-Funktion.

```R
datenA = tibble(
    q00_demo_gen = c("2 : Weiblich", "2 : Weiblich", "3 : Männlich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"2 : Weiblich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "3 : Männlich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "2 : Weiblich", "3 : Männlich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "2 : Weiblich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "2 : Weiblich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "2 : Weiblich", "3 : Männlich", 
"2 : Weiblich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"2 : Weiblich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "2 : Weiblich", 
"2 : Weiblich", "3 : Männlich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "2 : Weiblich", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"2 : Weiblich", "1 : Keine Angabe", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "2 : Weiblich", "2 : Weiblich", "2 : Weiblich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"3 : Männlich", "3 : Männlich", "3 : Männlich", "3 : Männlich", 
"2 : Weiblich", "3 : Männlich", "2 : Weiblich", "3 : Männlich", 
"2 : Weiblich")
)
```

```R
datenA %>% 
    count(q00_demo_gen) 

datenA %>% 
    ggplot(aes(x = q00_demo_gen)) +
        geom_bar()
```

<div class="alert alert-secondary">
<table>

<thead>
	<tr><th scope=col>q00_demo_gen</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>1 : Keine Angabe</td><td>  1</td></tr>
	<tr><td>2 : Weiblich    </td><td> 95</td></tr>
	<tr><td>3 : Männlich    </td><td>104</td></tr>
</tbody>
</table>
</div>



    
<img    src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_6_1.png">
    


Um ein Histogramm einschätzen zu können, bietet es sich an, die Daten mit einer Referenzverteilung zu vergleichen.

Um das zu illustrieren, verwenden wir den Vektor `digitalisiert` aus der [Testatstichprobe](https://moodle.zhaw.ch/mod/resource/view.php?id=346520).

<p class="" markdown="1">
Die dargestellten Werte stammen aus einem anderen Jahrgang und weichen deshalb von Ihren Ergebnissen  ab.
</p>

```R
daten = read_delim("digitales_umfeld_geraete_fm_att.csv")

daten %>% 
    count(digitalisiert) 

daten %>%
    ggplot(aes(x = digitalisiert)) +
         geom_bar()
```

<div class="alert alert-secondary">
<table>

<thead>
	<tr><th scope=col>digitalisiert</th><th scope=col>n</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><td>2</td><td> 8</td></tr>
	<tr><td>3</td><td>25</td></tr>
	<tr><td>4</td><td>57</td></tr>
	<tr><td>5</td><td>71</td></tr>
	<tr><td>6</td><td>34</td></tr>
	<tr><td>7</td><td> 5</td></tr>
</tbody>
</table>
</div>



    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_8_1.png">
    


Diese Verteilung sieht fast wie die Glockenkurve einer Normalverteilung aus. Wir wollen nun visuell überprüfen, ob unser Histogramm der Normalverteilung folgt.

Dazu stellen wir zuerst die Normalverteilung dar.


```R
tibble(x = c(-3, 3)) %>%
    ggplot(aes(x)) +  
    geom_line(stat = "function", 
                      fun = dnorm, 
                      args = list(mean = 0, sd = 1), 
                      color = "red")
```


    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_10_0.png">
    


Diese Kurve möchten wir nun über unseren Plot legen. Dazu müssen wir über eine Lineartransformation die Normalverteilung an den Mittelwert und die Standardabweichung unserer Stichprobe ausrichten. Wir müssen also zuerst diese Lagemasse bestimmen. 


```R
daten %>% 
    summarise(
        m = mean(digitalisiert), 
        sd = sd(digitalisiert)
     ) -> lagemasse

mw = lagemasse %>% pull(m)
sd = lagemasse %>% pull(sd)

mw
sd

```

<div class="alert alert-secondary">
4.565
</div>

<div class="alert alert-secondary">
1.10992552604525
</div>

Mit dem Mittelwert und der Standardabweichung können wir nun die Normalverteilung für den Wertebereich unseres Vektors zeichnen.


```R
daten %>%
    ggplot(aes(x = digitalisiert)) +
    geom_line(stat = "function", 
                      fun = dnorm, 
                      args = list(mean = mw, sd = sd), 
                      color = "red")
```


    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_14_0.png">
    


Wir haben ja gelernt, dass wir Geometrien überlagern können, und das versuchen wir jetzt.


```R
daten %>%
    ggplot(aes(x = digitalisiert)) +
    geom_bar() +
    geom_line(stat = "function", 
                      fun = dnorm, 
                      args = list(mean = mw, sd = sd), 
                      color = "red")
```


    
<img   src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_16_0.png">
    


Unser neuer Plot zeigt uns jetzt eine kleine rote Kurve am unteren Rand des Koordinatensystems. Das ist nicht unser gewünschtes Ergebnis. Woran kann das liegen?

Dazu vergleichen wir die Werte auf der y-Achse für die angepasste Normalverteilung und unseres überlagerten Plots. Uns fällt dabei auf, dass die Wertebereiche der y-Achse in den beiden Plots stark voneinander abweichen. Diese Abweichung entsteht, weil die Normalverteilung *relative Werte* und das Histogramm die *absoluten Werte* verwendet. Wir müssen deshalb die absoluten Werte in relative Werte umwandeln, damit sie in die gleiche Grössenordnung wie die Glockenkurve fallen. Diesen Schritt bezeichnen wir auch als **Normalisieren**. Das erreichen wir, indem wir die aggregierten Werte im Vektor `n` durch  die Gesamtzahl aller Antworten teilen. Weil wir schon berechnete Werte haben, müssen wir diese Werte nur noch zusammenzählen, um die Gesamtzahl der Antworten zu erhalten. Diese Anzahl entspricht der Summe der Nennungen im gesamten Wertebereich. 

```R
daten %>% 
    count(digitalisiert) %>% 
    mutate(relativ = n/sum(n)) -> Auswertung

Auswertung
```

<div class="alert alert-secondary">
<table>

<thead>
	<tr><th scope=col>digitalisiert</th><th scope=col>n</th><th scope=col>relativ</th></tr>
	<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>2</td><td> 8</td><td>0.040</td></tr>
	<tr><td>3</td><td>25</td><td>0.125</td></tr>
	<tr><td>4</td><td>57</td><td>0.285</td></tr>
	<tr><td>5</td><td>71</td><td>0.355</td></tr>
	<tr><td>6</td><td>34</td><td>0.170</td></tr>
	<tr><td>7</td><td> 5</td><td>0.025</td></tr>
</tbody>
</table>
</div>


Mit diesen relativen Werten können wir nun unsere gemessene Verteilung mit der Normalverteilung vergleichen. Damit wir die rote Kurve leichter erkennen können, färben wir die Balken des Histogramms etwas heller mit der Farbe `lightgrey` ein. Zusätzlich entferne ich mit `theme_bw()` die Hintergrundeinfärbung, sodass wir die Balken noch erkennen können.  


```R
Auswertung %>%
    ggplot(aes(x = digitalisiert, y = relativ)) +
        geom_col(fill = "lightgrey") +
        geom_line(stat = "function", 
                      fun = dnorm, 
                      args = list(mean = mw, sd = sd), 
                      color = "red") +
        theme_bw()
```


    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_20_0.png">
    


Jetzt können wir leicht erkennen, dass die Verteilung der Werte  im Vektor `digitalisiert` fast perfekt der Normalverteilung folgt.
