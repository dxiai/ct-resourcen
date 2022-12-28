### Organisieren von Faktorstufen

Die zentrale Funktion in R von Faktorstufen ist ihre Bedeutung für die Ordnung der Werte des jeweiligen Faktors. Indem wir die Faktorstufen organisieren, können wir die Werte des Vektors strukturieren, ohne ihre Reihenfolge zu ändern. 

Für die Organisation von Faktorstufen gibt es vier häufig vorkommende Aufgaben: 

1. Organisation entlang einer vordefinierten Reihenfolge (*Skala*),
2. Organisation entlang der internen Organisation eines Datentyps,
3. Organisation entlang der Häufigkeit eines Werts,
4. Organisation entlang des Auftretens in der Stichprobe.

**Die erste Aufgabe** tritt immer ein, wenn wir mit etablierten Methoden arbeiten. In diesem Fall ist die Reihenfolge der Faktorstufen bereits bekannt. In solchen Fällen sprechen wir von der Zuordnung einer Skala. Für solche Zuordnungen verwenden wir die Funktion ``fct_relevel()``.

Zum Beispiel wollen wir die Faktorstufen in der Stichprobe digitales Umfeld nach einer externen Vorgabe festlegen, sodass die folgende "Ladies-First" Reihenfolge gilt:

```R
geschlecht_faktorstufen = c( "Weiblich", "Andere", "Keine Angabe", "Männlich" )
```

Nun können wir den Faktor ``geschlecht`` entsprechend umformen.

```R 
duFaktorisiert %>% 
    mutate(
        geschlecht = geschlecht %>% fct_relevel( geschlecht_faktorstufen )
    ) -> digitales_umfeld_externe_skala
```

<p class="alert alert-warning" markdown="1">
Wenn Sie mit `fct_relevel()` eine vorgegebene Skala als Vektor übergeben, die nicht vollständig in der Stichprobe abgedeckt wurde, dann erhalten Sie eine kryptische Warnung, die auf ``Unknown levels in `f`: `` endet. **Diese Warnung können Sie ignorieren**. R fügt die fehlenden Faktorstufen nicht ein, behält aber deren innere Organisation bei.
</p>

**Die zweite Aufgabe** ist die Organisation der Faktorstufen nach der internen Organisation des jeweiligen Datentyps. Liegen die Werte als Zahlen vor, dann werden die Faktorstufen entsprechend des jeweiligen Nennwerts sortiert. Liegen die Werte als Zeichenketten vor, dann werden die Faktorstufen alphabetisch sortiert. Diese Organisation entspricht der Vorgehensweise der meisten Base-R Funktionen. Falls unsere Daten als Zahlen (oder Wahrheitswerte) vorliegen, können wir für diese Vorgehensweise die Funktion ``fct_inseq()`` verwenden. 

```R 
duFaktorisiert %>% 
    mutate(
        digitalisiert = digitalisiert %>%  fct_inseq()
    ) -> duFaktorisiert_sequenziell
```

Im Fall von Zeichenketten als Faktorstufen, müssen wir die bestehenden Faktorstufen selbst umsortieren und dann als neue Vorgabe mit ``fct_relevel()`` übergeben. Im folgenden Beispiel ist das alphabetische Sortieren der Faktorstufen eine eingebettete Funktionskette.

```R
duFaktorisiert %>% 
    mutate(
        mobilgeraet = mobilgeraet %>% fct_relevel( mobilgeraet %>% levels() %>% sort() )
    ) -> duFaktorisiert_alphabetisch
```

**Die dritte Aufgabe** ist die Organisation nach der Häufigkeit eines Werts in einer Stichprobe. Diese Vorgehensweise ist besonders für nominalskalierte Daten interessant, um über die Häufigkeiten die Reihenfolge der Faktorstufen festzulegen. Hierbei hilft die Funktion ``fct_infreq()``. Die Faktorstufen werden so  den Häufigkeiten entsprechend in der Stichprobe ab- bzw. aufsteigend organisiert. 

```R
duFaktorisiert %>% mutate(
        mobilgeraet = mobilgeraet %>%  fct_infreq()
    ) -> duFaktorisiert_frequenz
```

**Bei der vierten Aufgabe** sollen die Faktorstufen entlang der Reihenfolge des ersten Auftretens in der Stichprobe erfolgen. Dieser Fall tritt meistens dann ein, wenn die  Faktorstufen umorganisiert wurden und wieder in die ursprüngliche Reihenfolge gebracht werden müssen. Die Funktion ``fct_inorder()`` übernimmt diese Aufgabe.

```R
duFaktorisiert %>% mutate(
        mobilgeraet = mobilgeraet %>%  fct_inorder()
    ) -> duFaktorisiert_reihenfolge
```

### Faktorstufen an den Werten eines anderen Vektors ausrichten

Mit der Funktion ``fct_reorder()``  können wir die Faktorstufen eines Vektors über die Werte eines anderen Vektors organisieren. Solche Ausrichtungen sind oft nach Aggregationen sinnvoll, wenn für jede Faktorstufe eines nominalskalierten Vektors genau ein Wert in einem anderen Vektor festliegt. Dabei **muss** aber immer **genau ein Wert** einer Faktorstufe entsprechen. Dabei wird für die Faktorstufen eine absteigende bzw. (optional) aufsteigende Reihenfolge des Referenzvektors angenommen. 

```R
msleep %>% 
    mutate(
        name = name %>% as_factor() %>% fct_reorder(sleep_total)
    )
```

Ähnlich wie beim Gruppieren, ändert sich die sichtbare Struktur des Stichprobenobjekts nicht. Es wird lediglich die interne Reihenfolge der Faktorstufen angepasst. Solche Schritte sind für [aussagekräftige Visualisierungen](https://moodle.zhaw.ch/mod/page/view.php?id=635260) sehr hilfreich.
