<p class="alert alert-success" markdown="1">
Faktoren erleichtern das Veranschaulichen von Daten.  Der grosse Vorteil bei der Verwendung von Faktoren ist, dass sich der Code für die Visualisierung nicht ändert. Mit Hilfe der Faktorstufen geben wir ``ggplot`` Hinweise über die Struktur der Werte in einem Vektor. Dadurch werden unsere Visualisierungen aussagekräftiger.
</p>

### Überzählige Achsbeschriftungen entfernen

Faktoren werden regelmässig für die Datenvisualisierung verwendet, um diskrete Daten richtig darzustellen. Das ist besonders dann notwendig, wenn die Werte im entsprechenden Vektor mit Zahlen dargestellt werden und die Reihenfolge dieser Zahlen vom Üblichen abweicht. 

Nehmen wir zum Beispiel die Stichprobe `mtcars` und den Vektor `cyl` (Zylinder) . Dieser Vektor nimmt nur die folgenden diskreten Werte an. 

```
mtcars %>% 
    summarise( cyl = unique(cyl) )
```

| cyl <br> `<dbl>` | 
| :--- | 
| 6 | 
| 4 | 
| 8 | 

In beiden Fällen haben wir also diskrete Daten. Wenn wir die Daten darstellen, dann ergibt sich das folgende Bild. 

```R
mtcars %>% 
   ggplot(aes(x = cyl )) + 
      geom_bar()
```

![mtcars cyl ohne Faktorisierung](https://github.com/dxiai/ct-resourcen/raw/main/bilder/zeichenketten/mtcars_cyl.png)

Hier erkennen wir, dass die X-Achse Werte anzeigt, die gar nicht vorkommen können. Dieses Problem können wir leicht beheben, indem wir den Vektor faktorisieren.

```R
mtcars %>% 
   mutate( cyl = cyl %>% as_factor() )  %>%
   ggplot(aes(x = cyl )) + 
      geom_bar()
```

![mtcars cyl mit Faktorisierung](https://github.com/dxiai/ct-resourcen/raw/main/bilder/zeichenketten/mtcars_cyl_factor.png)

### Sortierte Balkendiagramme

Das Arrangieren von Daten erreichen wir ebenfalls mit Faktoren. Hierzu betrachten wir die Vektoren `name` und `sleep_total` aus der Stichprobe `msleep`. Stellen wir die beiden Vektoren in einem Balkendiagramm gegenüber, dann können wir kaum  die verschiedenen Spezies vergleichen. 

```R
msleep %>% 
    ggplot(aes(name, sleep_total)) + 
        geom_col() +
        coord_flip()
```

![msleep data ohne Faktorisierung](https://github.com/dxiai/ct-resourcen/raw/main/bilder/zeichenketten/msleep.png)

Wesentlich anschaulicher wird dieses Balkendiagramm, wenn wir den `name`-Vektor vor der Visualisierung in einen Faktor umwandeln und die Faktorstufen entlang der Gesamtschlafdauer organisieren.  

```R
msleep %>% 
    mutate(
        name = name %>% as_factor() %>% fct_reorder(sleep_total)
    ) %>%  
    ggplot(aes(name, sleep_total)) + 
        geom_col() +
        coord_flip()
```

![msleep data mit Faktorisierung](https://github.com/dxiai/ct-resourcen/raw/main/bilder/zeichenketten/msleep_factors.png)

