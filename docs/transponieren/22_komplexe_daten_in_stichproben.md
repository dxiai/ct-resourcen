# Komplexe Datentypen in Stichprobenobjekten einbetten

### Problemstellung

Es sollen Werte mit einem komplexer Datentyp in einer Stichprobe eingebettet werden (z.B. eine Matrix oder ein Ergebnisobjekt).

### Lösung

Die Werte müssen in eine Liste *gekapselt* werden. 

**Beispiel zum Einbetten einer Matrix**

```R
mtcars %>% 
    group_by(gear) %>% 
    summarise(
        cylMatrix = outer(cyl, unique(cyl), `==`) %>% list()  # Eine Matrix muss in eine Liste eingebettet werden.
    )
```

| gear <br> &lt;dbl> | cylMatrix <br> &lt;list> |
| ---: | :--- | 
|    3 | <lgl [15 × 3]> | 
|    4 | <lgl [12 × 2]> |
|    5 | <lgl [5 × 3]> |


### Erkärung

Komplexe Datentypen müssen in Stichprobenobjekten als Liste abgelegt werden, weil R sonst versucht, das Objekt in einen Vektor zu konvertieren. Das führt dazu, dass der Ergebnisvektor und der Gruppenvektor unterschiedliche Längen haben, was gegen die Definition eines Stichprobenobjekts verstösst. **Deshalb müssen alle Ergebnisse von Operationen in einer Liste gekapselt werden, wenn das Ergebnis mehr als einen (atomaren) Wert hat.** 

Durch die Verkettung mit der Listenfunktion beim Aggregieren, wird das Ergebnis vor der automatischen Vektortransformation geschützt. Anschliessend liegen die Ergebnisse als Listenelement vor. Die Länge der Liste muss die gleiche Länge haben wie die restlichen Vektoren des Sitchprobenobjekts.


