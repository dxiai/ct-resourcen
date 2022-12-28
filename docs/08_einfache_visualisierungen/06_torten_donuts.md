
<p class="alert alert-warning" markdown="1">
**Achtung:** Tortendiagramme und Donut-Diagramme werden oft falsch interpretiert, weil Kreisflächen schwerer verglichen werden können als die Höhen von Balken. Sie sollten nur zur Illustration, aber nie zur Argumentation verwendet werden.
</p>

R kann auch Plots erstellen, die nur einen Datenvektor umfassen. In diesem Fall wird der zweite Vektor für die y-Achse aus den Werten des Vektors berechnet. Diese Möglichkeit haben wir schon bei der Erstellung von Histogrammen kennengelernt. 

Nehmen wir das folgende Beispiel: Wir erstellen ein Stichprobenobjekt mit einem Vektor `q00_demo_gen`, der die Werte `1 : Keine Angabe`, `2 : Weiblich` und `3 : Männlich` enthält.


```R
daten2 = tibble(
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

Uns interessiert nun: ***Wie oft kommen die drei möglichen Werte in unserer Stichprobe vor?*** 

Wir können die Werte mit `count()` selbst berechnen oder `ggplot` die Arbeit überlassen. Anstelle der `geom_col()`-Funktion verwenden wir nun die `geom_bar()`-Funktion. `geom_bar()` erwartet einen Vektor für die x-Achse und berechnet für die y-Achse das Auftreten der Werte, so wie wir es mit der `count()`-Funktion auch bestimmen würden.

```R
daten2 %>%
    count(q00_demo_gen)

daten2 %>%
    ggplot(aes(x = q00_demo_gen)) +
        geom_bar()
```

<div class?="alert alert-secondary">
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
    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_11_1.png">
    

Mit diesem Plot können wir die Unterschiede in unserer Werteverteilung leichter erkennen. 

Für Präsentationen ist so ein Plot aber nicht wahnsinnig attraktiv. Färben wir den Plot also ein. Das machen wir, indem wir den Vektornamen auch  für die Füllung der Balken verwenden. `ggplot` wählt nun für jeden Wert in diesem Vektor eine eigene Farbe aus. Dadurch färben sich unsere Balken ein. 


```R
daten2 %>%
    ggplot(aes(x=q00_demo_gen, fill = q00_demo_gen)) +
        geom_bar()
```
    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_13_0.png">
    

Für Histogramme verwenden wir normalerweise ein kartesisches Koordinatensystem. Wir können aber auch ein anderes Koordinatensystem wählen. Eine Variante sind **polare Koordinaten**. Mit einem polaren Koordinatensystem erreichen wir kreisförmige Darstellungen. Wir müssen dazu die Dimension, die auf das Zentrum des Diagramms zeigt, festlegen und als Parameter übergeben. In unserem Fall ist das die y-Dimension.

Wir stellen unsere Daten in einem polaren Koordinatensystem dar, indem wir mit der `coord_polar()`-Funktion ggplot mitteilen, dass wir ein anderes Koordinatensystem wünschen. 

```R
daten2 %>%
    ggplot(aes(x=q00_demo_gen, fill = q00_demo_gen)) +
        geom_bar() +
        coord_polar("y") 
```


    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_15_0.png">
    


Unser Plot hat jetzt unschöne Beschriftungen. Die werden wir mit einem Formatierungsthema los. `ggplot` hat verschiedenen Formatierungen als Thema vordefiniert. Eines davon ist das Thema `void`. Diese Formatierung entfernt alle Hintergründe, Achsen und Beschriftungen ausser Legenden.


```R
daten2 %>%
    ggplot(aes(x=q00_demo_gen, fill = q00_demo_gen)) +
        geom_bar() +
        coord_polar("y") +
        theme_void()
```


    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_17_0.png">
 
Das sieht doch gleich viel besser aus.

<p class="alert alert-primary" markdown="1">
Solche ringartigen Visualisierungen werden  als Zielscheiben- oder  **Donut-Diagramme** bezeichnet.
</p>


Manchmal wollen wir alle Balken  übereinander stapeln. Das erreichen wir, indem wir für die x-Achse einen konstanten Wert angeben. Z.B. nehmen wir dazu die leere Zeichenkette. So vermeiden wir, dass eine merkwürdige Beschriftung in unserem Diagramm auftaucht. Damit wir die Balken auseinanderhalten können, färben wir sie wie oben ein. 


```R
daten2 %>%
    ggplot(aes(x ="", fill = q00_demo_gen)) +
        geom_bar() 
```


    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_19_0.png">
    
Mit der Funktion `coord_flip` vertauschen wir die Achsen und drehen so unser Diagramm.

```R
daten2 %>%
    ggplot(aes(x ="", fill = q00_demo_gen)) +
        geom_bar() +
        coord_flip()
```
    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_21_0.png">
    
Wir erkennen nun deutlich, dass `ggplot` immer versucht möglichst viel Fläche zu nutzen. 

Das Interessante an dieser Darstellung ist aber nicht dieses Format, sondern dass wir dieses Diagramm ebenfalls in einem polaren Koordinatensystem darstellen können. 


```R
daten2 %>%
    ggplot(aes(x ="", fill = q00_demo_gen)) +
        geom_bar() +
        coord_polar("y") + 
        theme_void()
```


    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/visualisierung/output_23_0.png">
   

Auf diese Weise erzeugen wir Tortendiagramme. 