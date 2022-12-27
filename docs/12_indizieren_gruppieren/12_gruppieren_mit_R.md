### Problemstellung

Wir möchten für alle vorkommenden Werte in einem (oder mehreren) Vektor(en) einer Stichprobe die Werte eines Vektors bzw. mehrerer Vektoren  transformieren. 

### Szenario-Fragestellung  

Wir möchten aus den Daten Digitalen Umfeld ermitteln, wie digitalisiert (Vektor `digitalisiert`) sich die Geschlechter (Vektor `geschlecht`) empfinden. 

### Idee

Wir könnten die im Vektor `geschlecht` vorkommenden Werte mit `unique()` herausfinden und einen Filter mit einem Gleichheitsvergleich für den jeweiligen Wert durchführen. Anschliessend führen wir die Transformationen für die verbleibende Stichprobe durch. 

Diese Vorgehensweise ist aber umständlich und mitunter sehr arbeitsaufwändig.

Anstatt für jeden vorkommenden Wert im Vektor `geschlecht` die Stichprobe separat zu filtern und zu berechnen, erlaubt uns R, diese vielen Schritte mit der Funktion `group_by()` zu einem Schritt zusammenzufassen. 

Die Funktion `group_by()` teilt eine Stichprobe entlang eines oder mehrerer Vektoren in Teilstichproben auf und führt anschliessende Transformationen für diese Teilstichproben separat aus. Das Ergebnis ist eine zusammenhängende Ergebnisstichprobe, die wir leicht visualisieren können. 

`group_by()` können wir in unsere Funktionsketten einfügen und so mit verschiedenen Aggregationen oder Transformationen kombinieren. 

#### Beispiel 1: Digitalisierung der Geschlechter 

Mit dem folgenden Code können wir Kennwerte für die Digitalisierung der Geschlechter bestimmen und vergleichen. 

```R
library(tidyverse)

digitales_umfeld = read_delim("digitales_umfeld1.csv")

digitales_umfeld %>% 
    group_by(geschlecht) %>%
    summarise(
        n = n(), 
        durchschnitt = median(digitalisiert),
        median = median(digitalisiert),
        min = min(digitalisiert),
        max = max(digitalisiert),
        interquartilsabstand = IQR(digitalisiert)
    )
```

Diese Operation liefert uns 6 Kennwerte für den Vektor `digitalisiert` für die vier möglichen Werte im Vektor `geschlecht`. 

<table>
<thead>
	<tr><th scope=col>geschlecht</th><th scope=col>n</th><th scope=col>durchschnitt</th><th scope=col>median</th><th scope=col>min</th><th scope=col>max</th><th scope=col>interquartilsabstand</th></tr>
	<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>
</thead>
<tbody>
	<tr><td>Andere      </td><td> 2</td><td>3.5</td><td>3.5</td><td>2</td><td>5</td><td>1.5</td></tr>
	<tr><td>Keine Angabe</td><td> 2</td><td>5.0</td><td>5.0</td><td>4</td><td>6</td><td>1.0</td></tr>
	<tr><td>Männlich    </td><td>67</td><td>5.0</td><td>5.0</td><td>2</td><td>7</td><td>2.0</td></tr>
	<tr><td>Weiblich    </td><td>64</td><td>5.0</td><td>5.0</td><td>2</td><td>6</td><td>1.0</td></tr>
</tbody>
</table>

#### Beispiel 2: Gruppiertes Zählen

Die `count()`-Funktion ist eine Kurzform der Aggregation zum Zählen von Datensätzen. Der Funktion können wir Gruppierungsvektoren als Parameter übergeben und uns den Aufruf der `group_by()`-Funktion sparen. Die folgenden beiden Code-Fragmente sind deshalb gleichwertig und bestimmen die Anzahl der Antworten von Frauen und Männern in einer Stichprobe.

```R
digitales_umfeld %>%
    group_by(geschlecht) %>%
    count()
```

```R
digitales_umfeld %>%
    count(geschlecht)
```

Das Gruppieren über mehrere Vektoren ist ebenfalls möglich. 

```R
digitales_umfeld %>%
    count(geschlecht, mobilgeraet)
```

| geschlecht | mobilgeraet |	n |
| :--- | :--- | :--- |
| Männlich |	Andere |	1 |
| Männlich |	Android Smartphone | 	16 |
| Männlich |	iPhone |	27 | 
| Weiblich	| Android Smartphone |	11 |
| Weiblich	| iPhone |	27 |
| Weiblich |	Mobiltelefon |	1 |

Das Ergebnis ist die Langform einer sogenannten **Kontingenztabelle**. Eine Kontingenztabelle zeigt die gemessenen Häufigkeiten der Merkmalsausprägungen mehrerer Variablen. In diesem Beispiel erhalten wir die Häufigkeiten für die Art eines Smartphones und des Geschlechts. Wir können aus dieser Tabelle erkennen, dass sowohl Frauen als auch Männer in dieser Stichprobe eher *iPhones* bevorzugen. 

#### Beispiel 3: Abzählen von gruppierten Datensätzen

Beispiel 1 und 2 fokussierten auf das Gruppieren mit nachfolgender Aggregation. Gelegentlich macht das Gruppieren auch für Umformungen Sinn. Im folgenden Beispiel zählen wir die Werte mit einem Kriterium ab. Im folgenden Beispiel zählen wir die Gruppen der Mobilgerättypen ab, indem wir einen neuen Vektor mit dem Namen `id` anlegen, der die Position der Datensätze relativ zu den anderen Datensätzen der gleichen Gruppe enthält. 

```R
digitales_umfeld %>%
    group_by(mobilgeraet) %>%
    mutate(id = row_number())
``` 

Nun sind alle Datensätze nummeriert, sodass für jede Kategorie von `mobilegeraet` eine separate Nummerierung vorliegt. Diese Strategie funktioniert auch beim mehrfachen Gruppieren, falls nicht alle Wertepaare in der gesamten Stichprobe auftreten. 

```R
digitales_umfeld %>%
    group_by(mobilgeraet, geschlecht) %>%
    mutate(
        id = row_number()
    )
``` 

Im Gegensatz dazu schlägt die folgende Operation mit einer Sequenz mit der Funktion `n()` fehl. Die Ursache ist, dass die mit `mutate()` erzeugten Vektoren den gleichen Umfang wie die (Teil-) Stichprobe haben müssen. Beim mehrfachen Gruppieren kann eine der Gruppen den Umfang `0` haben, wenn ein Wertepaar für eine Gruppe nicht in der Stichprobe  vorkommt. Die Operation `1:n()` erzeugt in solchen Fällen eine Sequenz mit zwei Elementen (`1` und `0`). Das ist länger als der Stichprobenumfang und  deshalb unzulässig.  

```R
digitales_umfeld %>%
    group_by(mobilgeraet, geschlecht) %>%
    mutate(
        id = 1:n()  # Funktioniert nicht immer :(
    )
``` 