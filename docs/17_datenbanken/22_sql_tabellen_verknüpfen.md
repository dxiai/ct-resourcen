### Problem

Es sollen zwei oder mehr SQL-Tabellen bereits bei der Abfrage miteinander verknüpft werden. 

### Lösung

Verwenden Sie die gewünschte Join-Funktion, um die Daten zu extrahieren.
Der Parameter `by` gibt an, welche Felder die Werte für die Indexvektoren enthalten. 

```r
library(tidyverse)

verbindung = DBI::dbConnect(RSQLite::SQLite(), dbname = "beispieldb.sqlite3")

dozierendeTabelle = tbl(verbindung, "dozierende")
modulDozierendeTabelle = tbl(verbindung, "moduldozierende")

dozierendeTabelle %>% 
    inner_join(modulDozierendeTabelle, by = c("kuerzel" = "kuerzel")) %>% 
    select(everything()) %>% 
    as_tibble() 
```

|name             |kuerzel |modul_name            | jahr|
|:----------------|:-------|:---------------------|----:|
|Christian Glahn  |glah    |Daten & Information   | 2022|
|Christian Glahn  |glah    |Daten & Information 2 | 2022|
|Christian Glahn  |glah    |Daten & Information 1 | 2022|
|Daniel Bajka     |bajk    |Daten & Information 1 | 2022|
|Daniel Bajka     |bajk    |Informatik            | 2022|
|Matthias Nyfeler |nyfe    |Statistik             | 2022|
|Christian Glahn  |glah    |Daten & Information 2 | 2021|
|Christian Glahn  |glah    |Daten & Information 1 | 2021|
|Daniel Bajka     |bajk    |Daten & Information 1 | 2021|
|Christian Glahn  |glah    |Informatik            | 2021|
|Matthias Nyfeler |nyfe    |Statistik             | 2021|
|Christian Glahn  |glah    |Daten & Information 2 | 2020|
|Christian Glahn  |glah    |Daten & Information 1 | 2020|
|Daniel Bajka     |bajk    |Daten & Information 1 | 2020|
|Christian Glahn  |glah    |Informatik            | 2020|
|Matthias Nyfeler |nyfe    |Statistik             | 2020|

### Erklärung

In R können Stichprobenobjekte durch Joins miteinander verknüpft werden. Die gleichen Prinzipien funktionieren auch mit mit SQL-Datenbanken. Anders als mit normalen Stichprobenobjekte versucht R bei SQL-Tabllen nicht, die Indizes zum Verknüpfen automatisch zu entdecken. Damit zwei SQL-Tabellen bereits als Abfrage verknüpft werden, *müssen* alle zugehörigen Indizes mit den `by`-Parameter angegeben werden. 

Der Parameter `by` erwartet einen Vektor mit benannten Zeichenketten. Der Name des Eintrags entspricht dabei dem Feld der linken Datenbanktabelle. Der Wert des Eintrags entspricht dem Feld der rechten Datenbanktabelle. Wenn das Schema für eine Datenbanktabelle mehr als eine Feld als Fremdschlüssel für eine Verknüfung definiert, müssen *alle* Felder an `by` übergeben werden.
