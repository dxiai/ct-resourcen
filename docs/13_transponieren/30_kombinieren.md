Gelegentlich liegen uns Daten aus verschiedenen Messungen vor, die wir gemeinsam auswerten müssen. Damit das möglich ist, müssen wir diese Daten zusammenführen bzw. *kombinieren*. 

In EXCEL würden wir einfach die Daten an die entsprechenden Positionen mit Hilfe des Textkonvertierungsassistenten oder der Identitätsfunktion bringen. In R können wir das nicht, da die Daten in unterschiedlichen Stichprobenobjekten abgelegt sind. Damit wir zwei oder mehrere Stichproben zusammenführen können, stellt uns die `tidyverse`-Bibliothek die Funktionen `bind_rows()` und `bind_cols()` zur Verfügung. 

Wir verwenden `bind_rows()`, um zwei Stichproben mit *unterschiedlichen Datensätzen* zusammenzufassen, indem wir die Datensätze aller weiteren Stichproben an die erste Stichprobe anfügen. Meistens fassen wir Stichproben in der *Langform* mit `bind_rows()` zusammen.

Wir verwenden `bind_cols()`, um verschiedene Vektoren zu den *gleichen Datensätzen* aus unterschiedlichen Messungen zusammenzuführen. Meistens fassen wir Stichproben in der *Breitform* mit `bind_cols()` zusammen.

### Die Funktion `bind_rows()` 

Beim Kombinieren von gleichartigen Stichproben mit ``bind_rows()`` müssen folgende Voraussetzungen erfüllt sein.

* Alle Stichproben müssen Vektoren haben, die in beiden Stichproben vorkommen.
* Alle gemeinsamen Vektoren müssen den gleichen Datentyp haben. 

Die Funktion `bind_rows()` entfernt keine Daten. Für alle Vektoren, die nicht in allen Stichproben existieren, werden in der jeweiligen Stichprobe alle fehlenden Vektoren angelegt und mit dem Wert `NA` aufgefüllt. 

<div class="alert alert-success" markdown="1">
Gelegentlich kann es erforderlich sein, Vektoren mit der Funktion [`rename()`](https://dplyr.tidyverse.org/reference/rename.html) umzubenennen, damit keine unnötigen Werte erstellt werden. Diese Situation tritt oft dann auf, wenn mehrjährige Daten erhoben werden und es technische Änderungen bei der Datenerhebung gab, die zu neuen Vektornamen geführt haben.
</div>

Wenn wir zwei Stichproben zusammenführen, dann können wir aus der zusammengeführten Stichprobe nicht mehr ablesen, aus welcher Stichprobe ein Datensatz ursprünglich stammt. Das ist hinderlich, weil wir sehr häufig die Daten aus zwei Stichproben miteinander vergleichen möchten. Dazu müssen wir aber wissen, welche Daten zu welcher Stichprobe gehören. Um dieses Problem zu vermeiden, müssen wir die Datensätze in beiden Stichproben entsprechend vorbereiten und in beiden Stichproben eine Markierung für die Herkunft einfügen. 

Damit wir nachträglich Datensätze verschiedenen Stichproben zuordnen können, müssen wir allen Datensätzen der Stichproben  einen *konstanten Wert* für die Ursprungsstichprobe ***vor dem Kombinieren*** zuweisen. Dabei beachten wir, dass dieser konstante Wert in beiden Stichproben den ***gleichen Vektornamen*** haben ***muss***. 

```R
stichprobe_1 = tibble(
    a = c(1,2,3,4,6,7), 
    b = c(7,6,4,3,2,1)
)
stichprobe_2 = tibble(
    a = c(1,8,3,5,6,1), 
    b = c(7,6,4,3,2,2)
)

bind_rows(
    stichprobe_1 %>% 
        mutate(Stichprobe = "A"),
    stichprobe_2 %>%
        mutate(Stichprobe = "B")
) -> kombinierteStichproben
```

In diesem Beispiel fügen wir den Vektor `Stichprobe` zu beiden Teilstichproben hinzu, **bevor** wir die Stichprobe an `bind_rows()` übergeben. Dabei müssen wir beachten, dass die zugewiesenen Werte für jede Stichprobe **eindeutig** sind. Auf diese Weise können wir die ursprünglichen Stichproben mit der folgenden `filter()`-Operation wieder extrahieren: 

```R
ursprünglicheStichprobeA = kombinierteStichproben %>% filter(Stichprobe == "A")
```

### Die Funktion `bind_cols()`

Die Funktion ``bind_cols()`` führt Vektoren aus zwei Stichproben zusammen. Dazu **muss** erfüllt sein, dass beide Stichproben die gleiche Anzahl Datensätze haben. Stichproben mit unterschiedlich vielen Datensätzen können mit `bind_cols()` **nicht** kombiniert werden. 

Beim Kombinieren mit `bind_cols()` sollten die Stichproben **unterschiedliche** Vektorennamen haben. Falls die Stichproben gemeinsame Vektoren haben, erzeugt `bind_cols()` eindeutige Namen für die Ergebnisstichprobe. 

Bei der Arbeit mit `bind_cols()` ist ausserdem zu beachten, dass alle Datensätze in der gleichen Reihenfolge vorliegen müssen. Gegebenenfalls müssen die Stichproben mit der Funktion ``arrange()`` erst in die richtige Reihenfolge gebracht werden. 

<p class="alert alert-success" markdown="1"> 
Falls zwei unsortierte Stichproben mit gemeinsamen Vektoren und/oder unterschiedlich vielen Datensätzen kombiniert werden müssen, können zusammengehörige Datensätze über sogenannte *joins* verbunden werden. Es gibt [vier spezielle Join-Funktionen](https://dplyr.tidyverse.org/reference/mutate-joins.html), mit denen wir Stichproben leichter kombinieren können als mit `bind_cols()`.
</p>