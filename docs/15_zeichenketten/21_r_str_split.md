In R gibt es verschiedene Funktionen, die aus einem Wert mehrere Werte erzeugen. Das gilt insbesondere für die Zeichenkettenfunktionen. In diesem Zusammenhang nimmt die Funktion ``str_split()`` eine besondere Position ein, weil sie relativ oft gebraucht wird. Diese Funktion trennt eine Zeichenkette entlang eines Trennzeichens bzw. eines Trennmusters und gibt die Ergebniswerte zurück.

<p class="alert alert-info" markdown="1">
Wir können uns die Funktion `str_split()` als eine fflexiblere Variante von EXCELs *"Text in Spalten"*-Befehl vorstellen. Die Parameter für diese Funktion sind eine Zeichenkette sowie das Trennmuster. Das Ergebnis ist ein Vektor aus Zeichenketten.
</p>

Natürlich wäre es toll, wenn wir `str_split()` zum Umformen einer Stichprobe verwenden könnten. Allerdings führt das Ergebnis zu  *Listenvektoren*, mit denen wir nicht leicht arbeiten können. Das illustriert das folgende Beispiel. In diesem Beispiel trennen wir die Zeichenketten im Vektor `text` an den Leerzeichen, sodass wir einzelne Worte erhalten. 

```R
library(tidyverse)

texte = tibble(text = c("Daten und Information", "Klimatologie Informatik"))

texte %>% 
    mutate(
        getrennter_text = text %>% str_split(" ")
    )
```

| text <br> `<chr>` | getrennter_text <br>`<list>` |
|---|---|
| Daten und Information   | Daten, und, Information |
| Klimatologie Informatik | Klimatologie, Informatik   |

Im Vektor `getrennter_text` stehen nun Listen mit unterschiedlicher Länge. Wären diese Listen Vektoren könnten wir mit der Funktion `pivot_longer()` die Werte transponieren. Das funktioniert mit eingebetten Listen leider nicht, weil die Werte nicht über mehrere Vektoren verteilt sind, sondern alle im gleichen Vektor stehen.

<p class="alert alert-primary" markdown="1"> 
**Definition:** Enthält ein Vektor Listen mit Werten, dann werden die Listenwerte als **eingebettete** (engl. *nested*) Werte bezeichnet. 
</p> 

Um an eingebettete Werte zu gelangen, müssen wir sie zuerst "ausbetten". Dazu verwenden wir die Funktion `unnest()`. Mit dieser Funktion erreichen wir mit eingebetteten Listen einen ähnlichen Effekt wie mit `pivot_longer()` mit mehreren Vektoren: Die Stichprobe wird in einer Langform gebracht, indem die Listen in die einzelnen Werte aufgelöst werden. Dazu müssen wir die Vektoren angeben, die wir entsprechend auflösen möchten. 

```R
texte %>% 
    mutate(
        getrennter_text = text %>% str_split(" ")
    ) %>% 
    unnest(getrennter_text) -> texte_getrennt

texte_getrennt
```

| text <br> `<chr>` | getrennter_text <br>`<chr>` |
|---|---|
| Daten und Information   | Daten |
| Daten und Information   | und |
| Daten und Information   | Information |
| Klimatologie Informatik | Klimatologie   |
| Klimatologie Informatik |  Informatik   |

Beachten Sie hier, dass alle nicht aufgelösten Vektoren für jeden Listeneintrag erweitert werden. 

Jetzt können wir mit diesen Werten wie gewohnt weiterarbeiten. 

<div class="alert alert-info" markdown="1">
Die Umkehrfunktion von `unnest()` ist die Funktion `nest()`. Wir können so Werte in einer Liste zusammenfassen und in einer kompakteren Stichprobe ablegen. 
</div>

Das obige Beispiel können wir mit der folgenden Operation zurück in die Listenform bringen. Dabei beachten wir, dass wir den neuen Vektor benennen und diesem die Werte aus dem Ursprungsvektor übergeben müssen.

```R
texte_getrennt %>% 
    nest(getrennter_text = getrennter_text)
```

| text <br> `<chr>` | getrennter_text <br>`<list>` |
|---|---|
| Daten und Information   | Daten, und, Information |
| Klimatologie Informatik | Klimatologie, Informatik   |
