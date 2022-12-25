Für die Arbeit mit EXCEL haben wir das Kreuzprodukt als Hilfsmittel für vektorisierte Zeilen- und Spaltensummen besprochen. In R verwenden wir für die Erstellung von Zeilensummen das Transponieren in die Langform. 

### Problemstellung

Gegeben ist eine Stichprobe mit mehreren Vektoren. Es soll für jeden Datensatz eine Aggregation über diese Vektoren durchgeführt werden. Das kann z.B. die Zeilensumme oder der Zeilenmittelwert sein.

### Lösung

Die Stichprobe wird über die zu aggregierenden Vektoren in die Langform gebracht. Damit wir dabei die Zugehörigkeit zu den ursprünglichen Datensätzen nicht verlieren, müssen diese nummeriert werden. Anschliessend kann eine gruppierte Aggregation durchgeführt werden.

Für die Zeilensumme über bestimmte Vektoren wenden wir die folgende Funktionskette an.

```R
BeispielStichprobe %>%
    mutate(
        datensatz = row_number()  # nur notwendig, falls kein eindeutiger Vektor vorhanden ist.
    ) %>%
    pivot_longer(
        vektorenauswahl   # tidyselect-Auswahl, z.B. starts_with()
    ) %>%
    group_by(datensatz) %>%
    summarise(
        ergebnis = sum(value)
    ) %>%
    ungroup() # sicher ist sicher :)
```

### Erklärung

Die Operation besteht aus drei Schritten: 

1. Mit `mutate()` wird für jeden Datensatz in der Stichprobe eine eindeutige Nummer zugewiesen. 
2. Mit `pivot_longer()` transponieren wir über die Vektorenauswahl. Hier übergeben wir einen `tidyselect`-Ausdruck, wie wir ihn auch für das Auswählen von Vektoren mit `select()` verwenden würden. Die Vektornamen landen im neuen Vektor `name` und die Werte landen im Vektor `value`. Diese Namen verwendet `pivot_longer()` immer dann, wenn wir die Parameter `names_to` und `values_to` nicht explizit angeben. 
3. Mit der Gruppenaggregation fassen wir die Werte aus den ursprünglichen Zeilen zusammen. 

<div class="alert alert-warning" markdown=1>
Sie finden im Internet Verweise auf die Funktion `rowwise()`. Diese Funktion hat zwei Nachteile gegenüber der zeilenweisen Aggregation mit Hilfe der transponierten Langform.

1. Die Logik von `rowwise()` ist nicht konsistent mit anderen Verben der `tidyverse`-Bibliothek
2. Wenn `rowwise()` für Stichproben mit vielen Datensätzen und vielen Vektoren verwendet wird, dann arbeitet die Funktion sehr viel langsamer als die transponierte Lösung. 
</div>

Das Ergebnis dieser Operation  hat nur noch die ursprüngliche Anzahl an Zeilen, weil wir die Langform aggregiert haben. 

Wenn wir zusätzliche Vektoren in unserer Stichprobe haben, die nach der Aggregation erhalten bleiben sollen, müssen wir diese Vektoren zusätzlich in die Gruppierung einschliessen.

Falls unsere Stichprobe an einigen Stellen fehlende Werte (d.h. den Wert `NA`) enthält, dann wandeln wir diese `NA` Werte **nicht** mit `replace_na()` um. Stattdessen entfernen wir diese Werte *nach dem Transponieren* mit `drop_na()`. Dieser Schritt darf erst nach dem Transponieren in die Langform erfolgen, weil wir sonst die ganze Zeile löschen würden.  

### Vollständiges Beispiel

```R
stichprobe = tibble(
    gruppe = c("a","b","a","b","a","b","a","a"),
    b = c(1,2,3,4,5,6,7,8),
    c = c(4,3,2,6,NA,7,7,8)
)

# Der Vektor "gruppe" muss nach der Zeilenaggregation erhalten bleiben.

stichprobe %>%
    # Datensätze nummerieren
    mutate(
        nr = row_number() 
    ) %>% 
    # über alle Vektoren ausser "gruppe" und "nr" transponieren
    pivot_longer(-c(gruppe, nr)) %>% 
    # Fehlende Werte entfernen
    drop_na() %>%
    # Zeilensumme bilden
    group_by(gruppe, nr) %>%
    summarise(
        zeilensumme = sum(value), 
        zeilenmittelwert = mean(value)
    ) %>% 
    ungroup()
```

