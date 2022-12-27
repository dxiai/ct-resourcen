# Daten in R importieren

Das Einlesen von Datendateien ist ein zentraler Bestandteil von R, weil es die Voraussetzung für die statistische Programmierung bildet. Diese Funktionen gehen jedoch nicht sehr sparsam mit dem Arbeitsspeicher unseres Computers um, sodass sehr grosse Datenmengen immer wieder zu Problemen führen. 

Die `readr`-Bibliothek ersetzt die Base R-Funktionen zum Einlesen von Dateien durch flexiblere und effizientere Funktionen. Diese Funktionen können mit grösseren Datenmengen umgehen und schonen den verfügbaren Arbeitsspeicher. Deshalb sind die `readr`-Funktionen den jeweiligen Gegenstücken von Base R vorzuziehen.


#### Dateitypen

Für den Austausch von Stichproben stehen verschiedene Dateiformate zur Verfügung. Diese Dateiformate unterscheiden sich durch die Strategie, mit der die Werte in den einzelnen Tabellenzellen unterschieden werden. 

Die wichtigsten Formate sind: 

* Tabulator getrennte Werte (TSV, tabulator-separated values)
* Komma getrennte Werte (CSV, comma-separated values)
* Excel Tabellen (via `readxl`-Bibliothek)
* Fixformat Tabellen (FWF, fixed-width format)
* R-Datendateien (RDS, R-data structure)

Diese Dateien können wir mit den folgenden Funktionen einlesen.

| Format | Modern R | Base R |
| --- | --- | --- |
| csv (mit `,` als Trennzeichen) | `read_delim()` | `read.csv()` |
| csv (mit `;` als Trennzeichen) | `read_delim()` | `read.csv2()` |
| tsv | `read_delim()` | `read.delim()` |
| xls (Excel Arbeitsmappen mit `readxl`) | `read_excel()` | - |
| FWF | `read_fwf()` | - |
| RDS | `read_rds()` | `readRDS()` |

<br/>

Bei der modernen `read_` Variante können wir uns leicht an der Dateiendung orientieren, um die richtige `read_`-Funktion auszuwählen. 

Wenn wir eine Datei einlesen, dann gibt uns die jeweilige `read_`-Funktion zurück, wie die Datei eingelesen wurde. Enthält die eingelesene Datei Spaltenüberschriften, dann haben wir das richtige Dateiformat ausgewählt. 

<p class="alert alert-warning" markdown="1">
**CSV**-Dateien können mit Komma oder Semikolon als Trennzeichen erstellt werden. Falls wir eine Datei mit nur **einem** *Datenvektor* importieren wollen, dann müssen wir die Datei mit der `read_csv()` oder `read_csv2()`-Funktion noch einmal einlesen.
</p>

***Beispiel***

Mit dem Aufruf `read_csv("beispieldaten.csv")` werden Daten mit einem Komma als Trennzeichen eingelesen. 

Mit dem Aufruf `read_csv2("beispieldaten.csv")` werden Daten mit einem Semikolon als Trennzeichen eingelesen. 
