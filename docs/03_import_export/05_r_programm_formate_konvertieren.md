# Mit R Dateiformate automatisch umwandeln

<p class="alert alert-info" markdown="1">
Dieses folgende Beispiel verbindet die Konzepte der Funktionsverkettung und die Funktionen des Datenimports und des Datenexports. Das folgende Beispiel kann mit EXCEL **nicht** mit den regulären Funktionen umgesetzt werden. 
</p>

Wir haben das Importieren und das Exportieren von Daten kennengelernt. In R greifen wir für diese beiden Schritte auf *Funktionen* zurück. Für Funktionen haben wir bereits das **wichtige** Konzept der **Funktionsverkettung** behandelt. Mit diesem Handwerkszeug können wir in R eine erste kleine Anwendung bauen: Einen Dateiumwandler, der EXCELs `CSV UTF-8`- Dateien in reguläre `tsv`-Dateien umwandelt.

Dieser Code ist sehr einfach: 

```R
library(tidyverse)

dateiname = "beispieldaten"                  # Wir legen den gemeinsamen Dateinamen fest

##
# Die Funktion str_c() kombiniert Zeichenketten zu einer langen Zeichenkette.
#
csv_datei = str_c(dateiname, ".csv")     # Wir fügen die Endung .csv an den Dateinamen an
tsv_datei = str_c(dateiname, ".tsv")     # Wir fügen die Endung .tsv an den Dateinamen an

read_csv2(csv_datei) %>% 
    write_tsv(tsv_datei)
```

Die Umwandlung der Daten von einem in das andere Format erfolgt in den letzten beiden Zeilen. Der Rest des Codes stellt sicher, dass unsere Dateien den gleichen Namen mit unterschiedlicher Endung haben. 

Damit der Code funktioniert, benötigen wir eine CSV-Datei mit dem Namen `beispieldaten.csv`. Diese Datei steht nachfolgend zum Download. 

<a class="btn btn-primary" href="https://github.com/dxiai/ct-resourcen/blob/main/beispiele/beispieldaten.csv?raw=true" download>
<i class="fa fa-lg fa-download"></i> beispieldaten.csv
</a>

Der Dateiname der **Quelldatei** steht in der R-Variable `csv_datei` und der Dateiname für die **Zieldatei** steht in der R-Variable `tsv_datei`. 

<p class="alert alert-info" markdown="1">
Im Code verwende ich die Funktion `str_c()`. Diese Funktion erlaubt es uns, beliebig viele Zeichenketten zu einer langen Zeichenkette zu verknüpfen. Wir werden `str_c()` im Kapitel *Zeichenketten* genauer untersuchen. 
</p> 

In der vorletzten Zeile startet die eigentliche Funktionskette. Mit der Funktion `read_csv2()`  werden die Daten geladen. Anschliessend folgt der *Chaining*-Operator. Die Operation setzt sich in der folgenden Zeile fort. 

<div class="alert alert-info" markdown="1">
R erwartet *immer* vollständige Operationen, um sie auszuführen. Endet eine Zeile mit einem Operator und der rechte Operand fehlt, dann sucht R in den folgenden Zeilen nach fehlenden Operanden oder Parametern. 
</div>

Die letzte Zeile schliesst die Operation mit dem Aufruf der `write_tsv()`-Funktion ab. 

Sowohl die `read_csv2()` als auch die `write_tsv()` Funktion erhalten einen Dateinamen, der die Quelle bzw. das Ziel unserer Daten markiert. 

<div class="alert alert-success" markdown="1">
Es ist guter Stil, lange Operationen über mehrere Zeilen zu verteilen. 

Damit Sie zusammengehörende Operanden leichter erkennen können, sollten Sie sich angewöhnen, solche Überhänge einheitlich einzurücken. Dadurch erhöht sich die Lesbarkeit Ihres Codes sehr. 
</div>

Wir haben im Abschnitt *Daten exportieren* gelernt, dass die `write_`-Funktionsgruppe von R Daten als Eingabe erwartet. Die Daten für die `write_tsv()`-Funktion stammen aus dem Ergebnis der `read_csv2()`-Funktion. Mit dem Chaining-Operator verbinden wir die beiden Funktionen und lassen die Daten von der Quelldatei direkt in die Zieldatei "fliessen". Wir führen dabei *implizit* die Identitätsfunktion als Transformationsschritt aus. 

### Redundante Operationen

<div class="alert alert-primary" markdown="1">
Wir lassen den expliziten Aufruf der Identitätsfunktion weg, weil dieser das Gesamtergebnis nicht verändert. Diese Teiloperation wird deshalb als **redundant** bezeichnet. 
</div>

<div class="alert alert-warning" markdown="1">
Das künstliche Aufblähen von Operationen durch das Einführen eines versteckten neutralen Elements wird als **redundante Operation** bezeichnet. Die Verwendung von verstecken neutralen Elementen sollte auch dann vermieden werden, wenn sich  dieses Element über mehrere Schritte einer Funktionskette zieht.
</div>

Veranschaulichen wir uns redundante Operationen mit einem Rechenbeispiel mit der folgenden Formel: 

$$ 
(b + a) + (- c - b)
$$

Wir lassen uns nicht von den Klammern verwirren und konzentrieren uns auf das neutrale Element der Addition. Das ist, wie wir wissen, die `0`. Die Null ist in dieser Formel nicht direkt sichtbar, sondern muss erst hervorgehoben werden. Wir schreiben die Formel etwas um, sodass wir die *redundante* Operation deutlich erkennen können.

$$
(b + a) + (-c - b) = b + a - c - b = a - c + b - b
$$

Die redundante Operation ist in diesem Beispiel \\( b - b \\). Dieser Term ergibt bekanntlich `0` und weil die `0` das neutrale Element der Addition ist, verändert dieser Term das Gesamtergebnis nicht. 

<div class="alert alert-primary" markdown="1">
**Definition:** Das unnötige Aufblähen von Operationen durch ein oder mehrere redundante Operationen wird als **Verdunklung** oder im englischen als **obfuscation** bezeichnet. 
</div> 

<div class="alert alert-success" markdown="1">
Sowohl beim wissenschaftlichen Arbeiten als auch bei Datenanalysen sollten Sie solche Verdunklungspraktiken unbedingt vermeiden. 
</div>
 