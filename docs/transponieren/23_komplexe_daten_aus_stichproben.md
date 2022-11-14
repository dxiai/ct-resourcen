# Komplexe Datentypen aus Stichprobenobjekten auslesen

### Problemstellung

Es sollen Werte mit einem komplexer Datentyp aus einer Stichprobe in eine Operation (Transformation oder Aggregation) verwendet werden (z.B. eine Matrix oder ein Ergebnisobjekt).

### Lösung

Die Werte sind als Liste *gekapselt* und müssen aus der Liste "entkapselt" werden.

**Beispiel zum Auslesen aus einer Matrix**

```R
mtcars %>% 
    group_by(gear) %>% 
    summarise(
        cylMatrix = outer(cyl, unique(cyl), `==`) %>% list(),
        carbMatrix = outer(carb, unique(carb), `==`) %>% list(), 
    ) %>% 
    mutate(
        # Co-occurence Matrix für cyl und carb erstellen
        # Matrizen müssen erst entkapselt werden
        cylcarbMatrix = (t(cylMatrix[[1]]) %*% carbMatrix[[1]]) %>% list()
    )
```

| gear <br> &ltdbl> | cylMatrix <br> &lt;list> | carbMatrix <br> &lt;list> |cylcarbMatrix <br> &lt;list> |
| :--- | :--- | :--- | :--- | 
| 3	| &lt;dbl [15 × 3]> | &lt;dbl [15 × 4]> | &lt;dbl [3 × 4]> |
| 4 | &lt;dbl [12 × 2]> | &lt;dbl [12 × 3]> | &lt;dbl [2 × 3]>	|
| 5 | &lt;dbl [5 × 3]> | &lt;dbl [5 × 4]> | &lt;dbl [3 × 4]>	|

### Erklärung

Werte mit komplexe Datentypen müssen in Stichproben als Liste gekapselt werden. Dadurch erscheinen diese Werte für alle anderen Operationen ebenfalls als Liste, wodurch falsche Ergebnisse erzeugt werden. 

Normalerweise enthält jeder Datensatz in der Stichprobe nur einen Wert. Im Beispiel ist dieser Wert eine Matrix. Dieser Wert muss aus der Liste entkapselt (also herausgenommen) werden, damit wir den eigentlichen Wert in einer Operation verwenden können. Die Funktion `unlist()` erscheint dafür am besten geeignet. Diese Funktion ist aber **keine** Umkehrfunktion von `list()`, sondern konvertiert zusätzlich die Listenelemente in atomare Datentypen. Der ursprüngliche komplexe Datenstruktur wird dabei aufgelöst und geht für die folgenden Operationen verloren.

Um die ursprüngliche Datenstruktur aus einer Liste zu erhalten muss, das erste Wert aus der kapselnden Liste ausgewählt werden. Das ist mit dem *Auswahloperator* (`[[#]]`) oder die Funktion `pluck()` möglich. Im Beispiel wird der Auswahloperator verwendet, um die Matrizen in den Vektoren `cylMatrix` und `carbMatrix` zu entkapseln. 

Das folgende Beispiel zeigt die **funktional gleiche Operation** mit `pluck()`.

```R
mtcars %>% 
    group_by(gear) %>% 
    summarise(
        cylMatrix = outer(cyl, unique(cyl), `==`) %>% list(),
        carbMatrix = outer(carb, unique(carb), `==`) %>% list(), 
    ) %>% 
    mutate(
        # Co-occurence Matrix für cyl und carb erstellen
        # Matrizen werden erst mit pluck() entkapselt
        cylcarbMatrix = (t(pluck(cylMatrix, 1)) %*% pluck(carbMatrix, 1)) %>% list()
    )
```

#### Verallgemeinerung für mehr als einen komplexen Wert

Wenn in einer kapselnden Liste mehr als ein Wert vorliegt, dann kann für die Verarbeitung der Liste die Funktion `map()` verwendet werden, damit eine Operation für alle Listenelemente ausgeführt wird. 

`map()` gibt in R immer eine Liste zurück, so dass das abschliessende Kapseln in eine Liste entfällt.
