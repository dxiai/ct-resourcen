Das Filtern von Werten in Vektoren und Stichproben ist ein zentrales Element von R. Dafür stehen viele Funktionen bereit.

In der Praxis verwenden wir in der Regel die Funktion `filter()` zum Auswählen von Datensätzen. Diese Funktion ermöglicht es eine Stichprobe mittels eines logischen Ausdrucks einzuschränken. Die Funktion `filter()` hat zwei Parameter: 

1. Das Stichprobenobjekt und
2. Den logischen Ausdruck für die Auswahl der Datensätze. 

#### Beispiel

| | A | B | C |
| :---: | :---| :---: |  :---: | 
| **1** | *Name* | *Sprache* | *Einwohner:innen* |
| **2** | Basel | deutsch | 173863| 
| **3** | Genf | französisch | 203856 | 
| **4** | Lugano | italienisch | 62315 | 
| **5** | Zug | deutsch | 30934 | 
| **6** | Zürich | deutsch | 421878 | 

Für diese Stichprobe möchten wir wissen, wie viele Einwohner in Städten mit mehr als 100000 Einwohnenden leben?

Diese Frage beantworten wir mit der folgenden Logik:

1. Alle Städte mit mehr als 100000 Einwohner:innen filtern.  
2. Die Einwohner:innen der gefilterten Städte zusammenzählen. 

Der logische Ausdruck zum Filtern ist `` `Einwohner:innen` > 100000 ``, weil dieser Ausdruck nur für die Datensätze Wahr wird, wenn im Vektor `Einwohner:innen` der Wert grösser als 100000 ist. Nach dem Filtern im ersten Schritt liegt nur noch die folgende Stichprobe vor: 

| | A | B | C |
| :---: | :---| :---: |  :---: | 
| **1** | *Name* | *Sprache* | *Einwohner:innen* |
| **2** | Basel | deutsch | 173863 | 
| **3** | Genf | französisch | 203856 | 
| **6** | Zürich | deutsch | 421878 | 

Für diese Teilstichprobe muss im zweiten Schritt nur noch die Summe über den Vektor `Einwohner:innen` gebildet werden. 

Daraus ergibt sich die folgende Funktionskette: 

```R
stichprobe %>% 
    filter(`Einwohner:innen` > 1000000) %>%
    summarise(
        Gesamteinwohnende = sum(`Einwohner:innen`)
    )
```
