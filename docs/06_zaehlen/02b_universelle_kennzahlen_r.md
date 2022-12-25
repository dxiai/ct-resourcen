#### Kennwerte mit R bestimmen

R stellt sicher, dass jedes Stichprobenobjekt rechteckig ist. Ausserdem gilt für alle Stichprobenobjekte, dass alle Vektoren einen Namen haben. Diese Eigenschaft stellen die `read`-Funktionen sowie die `tibble()` und die `tribble()` Funktionen sicher. 

Den Stichprobenumfang erhalten wir, indem wir einfach alle Datensätze mit der `count()` Funktion zählen. 

```R
n = stichprobendaten %>% count()
```

Die Anzahl der Variablen eines Stichprobenobjekts entspricht in R der Länge der Stichprobe. Wir erhalten deshalb diesen Kennwert, indem wir die Länge des Objekts bestimmen. 

```R
anzahl_variablen = stichprobendaten %>% length()
```

Dieses Ergebnis können wir überprüfen. Dazu nutzen wir in R aus, dass alle Vektoren in einem Stichprobenobjekt einen Namen haben. Diese Namen können wir mit der Funktion `names()` abfragen. Diese Funktion gibt uns einen Vektor zurück, der die Namen der Vektoren unserer Stichprobe in der Reihenfolge ihres Auftretens enthält. Wir können so die Anzahl Vektoren über die Länge des Namen-Vektors überprüfen. 

Die Anzahl der Variablen bestimmen wir also mit der folgenden Operation.

```R
anzahl_variablen_kontrolle = stichprobendaten %>% names() %>% length()
```

<p class="alert alert-success">
Diese beiden Kennwerte sollten Sie am Beginn jeder Datenauswertung bestimmen.
</p>

#### `drop_na()`: Unvollständige Datensätze mit R löschen 

Neben dem Stichprobenumfang wird oft ein zweiter Wert für Stichprobendaten gefordert: Die Anzahl der vollständigen Datensätze. Dieser Wert wird ebenfalls mit `n` bezeichnet. Damit wir diese Anzahl bestimmen können, müssen wir die unvollständigen Datensätze aus unserer Stichprobe entfernen. Das erreichen wir mit der Funktion `drop_na()`. Diese Funktion löscht alle Datensätze, in denen mindestens ein Wert fehlt. Das Ergebnis ist eine Stichprobe, die nur vollständige Datensätze enthält. 

<p class="alert alert-primary"  markdown="1">
**Definition**: Eine Stichprobe, die nur vollständige Datensätze enthält, wird als **bereinigte Stichprobe** bezeichnet. Entsprechend wird der Umfang dieser Stichprobe **bereinigter Stichprobenumfang** genannt. 
</p>

Die Anzahl der vollständigen Datensätze wird analog zum allgemeinen `n` bestimmt. 

```R
n = stichprobendaten %>% drop_na() %>% count()
```
<p class="alert alert-warning"  markdown="1">
Aus Gründen der Nachvollziehbarkeit, **müssen** Sie beide Stichprobenumfänge berichten. 
</p>