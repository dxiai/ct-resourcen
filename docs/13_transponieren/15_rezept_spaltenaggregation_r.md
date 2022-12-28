Für die Arbeit mit Excel haben wir das Kreuzprodukt als Hilfsmittel für vektorisierte Zeilen- und Spaltensummen besprochen. In R verwenden wir für die Erstellung von Spaltensummen das Transponieren in die Langform. 

### Problemstellung

Es müssen die gleichen Aggregationen für viele Vektoren durchgeführt werden. 

### Lösung

In einfachen Fällen verwenden wir die `across()`-Funktion.

```R
Stichprobe %>%
    summarise(across(vektorauswahl, aggregationsFunktion)) 
```

Leichter nachzuvollziehen ist die Lösung mit Transponieren:

```R
Stichprobe %>%
    pivot_longer(vektorauswahl) %>% 
    group_by(name) %>%
    summarise(
        aggregationsFunktion(value)
    ) 
```

### Erklärung

Die Funktion `across()` ist eine Hilfsfunktion für Aggregationen, die wir auf  viele Vektoren anwenden müssen und wir möchten nicht den gleichen Code für jeden Vektor wiederholen. 

`across()` erwartet zwei Parameter. Der erste Parameter ist die Auswahl der Vektoren, die aggregiert werden sollen. Der zweite Parameter gibt die Aggregationsfunktion an. R führt die Aggregationsfunktion für jeden der Vektoren separat aus. 

Das folgende Beispiel führt die Summe für alle Vektoren in der Stichprobe `stichprobe` aus, mit Ausnahme des `gruppe`-Vektors. 

```R
stichprobe  %>% 
    summarise(
        across(
            -gruppe,
            sum
        )
    )
```

In diesem Fall erhalten wir eine zusammengefasste Stichprobe mit den ursprünglichen Vektornamen.

**Optional* können weitere Parameter der `across()`-Funktion übergeben werden. Diese zusätzlichen Parameter werden direkt an die Aggregationsfunktion übergeben. Das ist für allgemeine Parameter der Aggregationsfunktion praktisch. Z.B. könnten mit `na.rm = TRUE` nicht vorhandene Werte ignoriert werden.

Als Aggregationsfunktion dürfen wir eine Liste mit Funktionen übergeben. Diese Liste muss *benannt* sein. `across()` erstellt uns dann neue Vektornamen, sodass wir leicht erkennen können, welche Vektoraggregation zu welchem Ergebnis geführt hat. Das folgende Beispiel bestimmt die Summe und den Mittelwert für alle Vektoren ausser dem `gruppe`-Vektor in der Stichprobe. Der ursprüngliche Vektorname wird dann um den Namen der Aggregation ergänzt. 

```R
stichprobe  %>% 
    summarise(
        across(
            -gruppe,
            list(
                summe = sum, 
                mittelwert = mean
            )
        )
    )
```

<p class="alert alert-success" markdown="1">
Wir können `across()` wie gewohnt auch für Gruppenaggregationen verwenden. In diesem Fall ignoriert R die Gruppierungsvektoren automatisch.
</p>

### Vollständiges Beispiel

```R
tibble( 
    gruppe = c("a","b","a","b","a","b","a","a"), 
    b = c(1,2,3,4,5,6,7,8), 
    c = c(4,3,2,NA,5,7,7,8)
) -> stichprobe

stichprobe  %>% 
    group_by(gruppe) %>%
    summarise(
        across(
            everything(),  # "gruppe" wird wegen group_by automatisch ignoriert
            list(
                summe = sum, 
                mw = mean
            ), 
            na.rm = TRUE
        )
    )
```

Diese Operation ist recht umständlich zu lesen. Durch Transponieren kann die Operation so vereinfacht werden, dass sie leichter nachzuvollziehen ist. 

```R
stichprobe  %>% 
    pivot_longer(-gruppe) %>% 
    drop_na() %>% # entspricht na.rm = TRUE
    group_by(gruppe, name) %>%
    summarise(
        summe = sum(value),
        mw = mean(value)
    )
```
