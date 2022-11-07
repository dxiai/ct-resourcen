<p class="alert alert-primary" markdown="1">
**Definition:** Als **Indizieren** werden Algorithmen bezeichnet, die Datensätze *identifizieren*.  
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Index** bezeichnet Werte, mit denen sich ein oder mehrere Datensätze von anderen Datensätzen unterscheiden lassen.  
</p>

Es werden drei Arten von Indizes unterschieden: 

1. Der **Primärindex**, mit dem ein einzelner Datensatz eindeutig identifiziert werden kann. 
2. **Sekundärindizes** erlauben die Identifikation über eine zweite Stichprobe (eine sog. *Indextabelle* oder engl. *Lookup-Table*) 
3. **Sekundärindizes** erlauben die Identifikation von Datensätzen mit gemeinsamen Eigenschaften. Diese Indizes werden auch als *Gruppenindex* bezeichnet.

Weil ein Index Werte über einen Datensatz enthält, gehört ein Index zum jeweiligen Datensatz und wird über einen *Indexvektor* in einer Stichprobe abgebildet.

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Indexvektor** bezeichnet einen Vektor, mit dessen Werten Datensätze identifiziert werden können.
</p>

<p class="alert alert-success" markdown="1">
Viele Stichproben verfügen bereits über Index-Vektoren. 
</p>

### Beispiel







**Ziel:** Wir wollen die 5 häufigsten Ereignisse identifizieren.

Wir haben eine Tabelle mit 100 Datensätzen. In der ersten Spalte steht ein Indikator für den Ereignistyp. In der zweiten Spalte die Häufigkeit des Eintretens.

Im ersten Schritt müssen wir die Position bestimmen. Ein naiver Zugang wäre einfach die ersten 5 Werte abzuzählen. Weil wir aber Gleichstände haben können, sollten wir besser mit dem *Rang* der jeweiligen Häufigkeiten arbeiten. Der Rang zeigt quasi die Platzierung eines Werts an und berücksichtigt, dass der gleiche Rang auf mehrere Werte zutreffen kann. 

In EXCEL bestimmen wir den Rang eines Werts mit der `RANG.GLEICH()`-Funktion. In R verwenden wir die `rank()`-Funktion. Weil wir die häufigsten Ereignisse ermitteln möchten, müssen wir den Rang "Abfallend" (engl. descending, abgekürzt `desc`) bestimmen. 

Für unsere Top 5 **filtern** wir nun mit dem logischen Ausdruck  `rang <= 5`. Unser Filter entspricht dabei der Logik einer "Abbruchbedingung". 

Damit wir unsere Rangordnung auch noch sortiert haben, müssen wir die Datensätze abschliessend sortieren. In Excel verwenden wir die `SORTIEREN()`-Funktion und in R die `arrange()`-Funktion. Als Sortierkriterium verwenden wir in beiden Fällen den Rang. 

Das vollständige Beispiel in R sieht dann wie folgt aus: 

```
ereignisse = read_csv2("BeispielDaten.csv")

ereignisse %>% 
    mutate(rang = rank(desc(`häufigkeit`), ties.method = "max")) %>%
    filter(rang <= 5) %>%
    arrange(rang)
```

<p class="alert alert-info">In diesem Beispiel gibt es übrigens keinen 5. Rang, so dass unsere Top-5 nur aus 4 Einträgen besteht.</p>

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=635217" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download"></i> Beispiel Daten</a>
