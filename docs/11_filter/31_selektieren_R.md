### Problemstellung

Aus einer umfangreichen Stichprobe sollen nur einzelne Vektoren ausgewählt werden.

### Vektoren mit R selektieren

<p class="alert alert-success"  markdown="1">
Die `tidyverse` Bibliothek umfasst die [`tidyselect`-Funktionen](https://tidyselect.r-lib.org/reference/language.html). Dabei handelt es sich um eine Reihe von Hilfsfunktionen, die die Vektorenauswahl nachvollziehbarer macht. Auf der [`tidyselect`-Homepage](https://tidyselect.r-lib.org/) finden sich ausführliche Code-Beispiele. 
</p>

In R können wir Vektoren mit der Funktion `select()` selektieren. Dieser Funktion übergeben wir Regeln, nach denen wir die Vektoren auswählen möchten. Die einfachste Regel ist die direkte Eingabe der Vektorennamen. Ein typischer Anwendungsfall für das Selektieren ist die Analyse von Stichproben mit vielen ungleichmässig verteilten fehlenden Werten. Damit die Funktion `drop_na()` nicht zu viele Datensätze löscht, wollen wir vor dem Aufruf unsere Stichprobe auf die gewünschten Vektoren einschränken. 



Für die folgenden Beispiele verwenden wir die Stichprobe `digitales_umfeld1.csv`, die wir mit der `read_delim()`-Funktion einlesen. 

```R
stichprobe = read_delim("digitales_umfeld1.csv") 
```

#### Beispiel 1: Vektoren mit ihrem Namen auswählen

Wir wollen die Vektoren `geschlecht`, `alter` und `mobilgeraet` auswählen. 

```R
stichprobe %>%
    select(geschlecht, alter, mobilgeraet)
```

Durch diesen Aufruf von `select()` reduzieren wir die Ergebnisstichprobe auf die drei ausgewählten Vektoren. 

#### Beispiel 2: Alle ausser die benannten Vektoren selektieren

Vektoren direkt zu benennen ist eine einfache direkte Methode. Wenn man sehr viele Vektoren auswählen möchte, dann ist es manchmal einfacher, nur die Vektoren anzugeben, die *nicht* in der Ergebnisstichprobe enthalten sein sollen. Mit `select()` erreichen wir das, indem wir ein `-` den ungewollten Vektoren voranstellen. 

Das folgende Beispiel selektiert alle Vektoren ausser `geschlecht` aus der Stichprobe. 

```R
stichprobe %>%
    select(-geschlecht)
```

Wenn wir mehrere Vektoren ausschliessen wollen, dann müssen wir diese zu einem Vektor zusammenfassen. 

```R
stichprobe %>%
    select(- c(geschlecht, alter, mobilgeraet))
```
Diese Vektorenauswahl wählt alle Vektoren ausser `geschlecht`, `alter` und `mobilgeraet`. Es ist damit die Umkehr der Auswahl aus Beispiel 1. 

#### Beispiel 3: Vektoren mit ähnlichen Namen auswählen

Drei leistungsfähige Hilfsfunktionen für `select()` sind: 

- `starts_with()`,
- `ends_with()` sowie
- `contains()`

Diesen Funktionen können wir einen Teilnamen angeben, um mehrere Vektoren auszuwählen, die einen gemeinsamen Teil haben. 

Diese Funktion veranschaulichen wir uns am besten mittels der `iris`-Stichprobe: 

```R
iris %>%
    select(starts_with("Sepal"))  # wählt die Vektoren Sepal.Width und Sepal.Length aus

iris %>%
    select(ends_with("Length"))  # wählt die Vektoren Petal.Length und Sepal.Length aus
```

#### Beispiel 4: Alle Vektoren zwischen zwei benannten Vektoren auswählen

Eine weitere Möglichkeit schneller viele Vektoren auszuwählen ist der `:`-Operator. Damit können wir alle Vektoren zwischen zwei Vektoren inklusive der benannten Vektoren auswählen.

Der folgende Aufruf veranschaulicht dies: 

```R
read_delim("digitales_umfeld1.csv") %>%     # Stichprobe einlesen
    select(geschlecht:monate)
```

Diese Vektorenauswahl wählt die Vektoren `geschlecht`, `alter`, `tage` und `monate` für die Ergebnisstichprobe aus.
