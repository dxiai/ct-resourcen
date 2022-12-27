
**Das Problem:** Es sollen Kennwerte für die gesamte Stichprobe berechnet werden.

<p class="alert  alert-primary" markdown="1">
**Definition:** Ein **Aggregator** oder eine **Aggregatorfunktion** ist eine Funktion, die mehrere Werte Datensätze **zusammenfasst**.
</p>

Das bedeutet, dass die resultierende Stichprobe \\( S_t \\) *höchstens* so viele Datensätze wie die ursprüngliche Stichprobe \\( S_0 \\) enthält. 

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/RQ8sBypWsGg" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<p class="alert  alert-success" markdown="1">
**Merke:** In **Excel** geben Aggregatoren für viele Werte eines Bereichs immer **genau einen Ergebniswert** zurück. Dabei werden immer alle Werte im Bereich berücksichtigt. Es spielt dabei keine Rolle ob mehrere Zeilen und/oder Spalten den Bereich festlegen.
</p>

Beispiele für Aggregatoren sind die folgenden Funktionen in Excel und R: 

| Funktion | Excel | R |
| :--- | :--- | :--- |
| Summe | `SUMME()` | `sum()` |
| Zählen | `ANZAHL()` / `ANZAHL2()` | `count()` |
| Minimum | `MIN()` | `min()` |
| Maximum | `MAX()` | `max()` |
| Arithmetisches Mittel | `MITTELWERT()` | `mean()` |
| Medianwert | `MEDIAN()` | `median()` |

### Aggregieren mit Excel

Excel liefert viele *Aggregatoren* mit. Wir wissen bereits, dass es für einige mathematische Operationen neben einen Operator zusätzlich auch Aggregatoren gibt. Beispiele dafür sind die Funktionen `SUMME()` für den `+`-Operator und `PRODUKT()` für den `*`-Operator. Excels Aggregatoren lassen sich nicht immer als Ersatz zu den entsprechenden Operatoren verwenden. 

<p class="alert alert-warning" markdown="1">
**Merke:** Excels Aggregatoren *ignorieren* immer fehlende Werte, die Operatoren behandeln fehlende Werte wie den Wert 0. Fehlende Werte stellt Excel in der Regel durch die *leere Zelle* dar.
</p>

**Beispiel:** Schreiben Sie auf einem neuen Arbeitsblatt in die Zelle A2 den Wert 5. Fügen Sie in Zelle B1 die Formel `=A1 * A2` ein. Fügen Sie nun in die Zelle C1 die Formel `=PRODUKT(A1:A2)` ein. Vergleichen Sie das Ergebnis. 

**Reflexionsaufgabe:** *Warum ist es für die `SUMME()` kein Problem, wenn fehlende Werte ignoriert werden?*

In Excel steht jede Transformation für sich. Das gilt auch für Aggregationen. Aggregationen von Daten sollten in Excel deutlich von den Stichprobenobjekten getrennt werden, weil die verschiedenen Werte sonst schwerer voneinander unterschieden werden können. Zusammengehörende Aggregationen sollten wie Vektoren von Stichprobenobjekten nebeneinander positioniert werden.

### Aggregieren mit R

In R fassen wir die Werte aus mehreren Datensätzen mit Hilfe der Funktion `summarise()` zusammen. Diese Funktion arbeitet auf einem Stichprobenobjekt und fasst alle Werte in einen Vektor mit Hilfe eines Aggregatoren zusammen. 

<p class="alert  alert-warning" markdown="1">
In R enthält die Ergebnisstichprobe \\( S_t \\) nur die aggregierten Ergebnisvektoren und eventuelle Gruppierungsvektoren. Nicht aggregierte Vektoren werden aus  \\( S_t \\) entfernt. 
</p>

Bei Aggregationen mit R können wir mehrere Aggregationen in einem Schritt zusammenfassen und die Ergebnisvektoren benennen. Das folgende Beispiel zeigt, wie wir zwei Aggregationen in einem Schritt gleichzeitig ausführen. Dabei erstellen wir zwei Vektoren in der Ergebnisstichprobe: Den Vektor `anzahl` und den Vektor `mittelwert`. 

```R
BeispielStichprobe = read_delim("digitales_umfeld1.csv")

BeispielStichprobe %>%
    summarise(
        anzahl = n(),
        mittelwert = mean(alter)
    )
```

<p class="alert  alert-warning" markdown="1">
Verwenden wir anstelle eines Aggregators eine *Transformationsfunktion* gemeinsam mit einem Aggregator, erhalten wir in R einen Fehler.
</p>

#### Zählen als Aggregation in R

Wir haben beim Zählen und Abzählen mit R bereits die `count()`-Funktion kennengelernt. Dabei handelt es sich um eine abgekürzte Schreibweise für die folgende Aggregation: 

```R
BeispielStichprobe %>% 
    summarise(
        n = n()
    )
```

Das Beispiel greift auf das Konzept zurück, dass die Summe der zählbaren Einheiten deren Anzahl widerspiegelt. Das gleiche Ergebnis erhalten wir durch Abzählen mit der folgenden Aggregation: 

```R
BeispielStichprobe %>% 
    summarise(
        n = row_number() %>% max()
    )
```

In diesem Beispiel werden die Datensätze der Stichprobe  mit der Funktion `row_number()` *implizit* durchnummeriert und anschliessend wird daraus das Maximum ermittelt. Das *implizite* Durchnummerieren können wir auch mit einem *expliziten* *Konvertierungsschritt* durchführen: 

```R
BeispielStichprobe %>% 
    mutate(
        nummer = row_number()
    ) %>%
    summarise(
        n = nummer %>% max()
    )
```

$$ $$