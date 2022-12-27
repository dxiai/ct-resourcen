Mit Filtern ergibt sich ausserdem eine weitere Möglichkeit zu zählen. Diese Möglichkeit entfernt zuerst mit Hilfe des logischen Ausdrucks alle nicht-zählbaren Elemente. Anschliessend erhalten wir eine Teilstichprobe, die nur noch zählbare Elemente enthält. Für diese Teilstichprobe muss nur noch der Umfang bestimmt werden.

#### Beispiel

| | A | B | C |
| :---: | :---| :---: |  :---: | 
| **1** | *Name* | *Sprache* | *Einwohner:innen* |
| **2** | Basel | deutsch | 173863| 
| **3** | Genf | französisch | 203856 | 
| **4** | Lugano | italienisch | 62315 | 
| **5** | Zug | deutsch | 30934 | 
| **6** | Zürich | deutsch | 421878 | 

Für diese Stichprobe wollen wir die deutschsprachigen Städte zählen. 

Die Excel-Funktionskette `=LET(gefilterteDaten; FILTER(A2:C6, B2:B6 = "deutsch"); ZEILEN(gefilterteDaten))` hat als Ergebnis den Wert `3`. Beachten Sie, dass die Funktion `ANZAHL()` für diesen Fall nicht geeignet ist, denn damit erhält man den Wert `9` als Ergebnis, was der Anzahl der Werte in der gefilterten Stichprobe entspricht.

Die gleiche Logik würden wir in R mit der analogen Funktionskette schreiben:

```R
stichprobe %>%
    filter(Sprache == "deutsch") %>% 
    count()
```

<p class="alert alert-secondary" markdown="1">
**Reflexionsaufgabe:** Die Funktion `ZÄHLENWENN(A2:C6; "deutsch")` hat in diesem Fall ebenfalls den Ergebniswert `3`. Konstruieren Sie eine Stichprobe durch einen zusätzlichen Vektor, für die `ZÄHLENWENN()` nicht mehr das richtige Ergebnis liefert. Erklären Sie die Vorgehensweise der Funktion mit Hilfe Ihrer Ergebnisse. 
</p>
