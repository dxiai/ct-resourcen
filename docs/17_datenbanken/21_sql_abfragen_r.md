Für den Zugriff auf Datenbanken stehen viele bekannte Funktionen und Konzepte zur Verfügung. Dadurch kann leicht der Eindruck entstehen, dass man auf den Datenbankdaten direkt so arbeiten könnte, wie direkt in R. Das ist leider nicht der Fall. Genau wie bei einer CSV- oder Excel-Tabelle müssen die Daten zuerst in R ***importiert*** werden, damit alle R-Funktionen bereitstehen. 

Theoretisch könnten SQL-Abfragen in R direkt eingegeben werden. Diese Praxis wird allerdings als schlechter Stil angesehen.

<p class="alert alert-warning" markdown="1">
SQL-Abfragen sind komplex und sind eine häufige Fehlerquelle. Deshalb versuchen wir möglichst **nie** SQL-Abfragen in unserem Programmcode direkt einzugeben. Stattdessen verwenden wir sog. *Wrapper-Bibiliotheken*, die die Komplexität der SQL-Abfragen durch normale Funktionsaufrufe verstecken. Dadurch werden Tipp- und Logikfehler in den Abfragen stark reduziert und können meistens vermieden werden. 
</p>

Der Datenimport aus einer Datenbank erfolgt immer in drei Schritten: 

1. Eine Verbindung zur Datenbank wird hergestellt.
1. Eine Datenbankabfrage wird formuliert.
2. Die Daten werden in ein Stichprobenobjekt umgewandelt.  

In R werden diese Schritte durch die Bibliothek [`dbplyr`](https://dbplyr.tidyverse.org/) unterstützt. Diese Bibliothek ermöglicht es, mit den vertrauten Funktionen `select()`, `mutate()`, `summarise()`, `group_by()` und  `filter()` auf Werte in Datenbanken zuzugreifen.

<p class="alert alert-secondary" markdown="1">
In allen Beispielen wird eine sog. `sqlite3`-Datenbank verwendet. [SQLite3](https://www.sqlite.org) ist eine Open Source Datenbank für normale Dateisysteme. Die Datenbank liegt als Datei auf einem Rechner und kann so direkt verwendet werden.
</p>

<p class="alert alert-success" markdown="1">
SQLite ist auf MacOS vorinstalliert und kann direkt von der Kommandozeile gestartet werden. Die Jupyter R-Umgebung enthält ebenfalls SQLite.
</p>

<p class="alert alert-success" markdown="1">
SQLite muss auf Windows separat installiert werden. 
</p>

### Ein vollständiges Beispiel

Alle Beispiele in diesem Dokument verwenden diese [[fa-download] SQLite3 Datenbank](https://github.com/dxiai/ct-resourcen/raw/main/beispiele/beispieldb.sqlite3){download=download}.

```r
library(tidyverse)

verbindung = DBI::dbConnect(RSQLite::SQLite(), dbname = "beispieldb.sqlite3")

beispielTabelle = tbl(verbindung, "beispiel")

(beispielTabelle %>% 
    select(everything()) %>% 
    filter(studiengang == "FM") %>% 
    count(jahr) %>% 
    as_tibble() -> FMBeispielDaten)
```

| jahr|  n|
|----:|--:|
| 2020|  2|
| 2021|  2|
| 2022|  2|

### Eine Verbindung zu einer Datenbank herstellen

Damit mit eine Datenbank verwendet werden kann, muss diese zuerste mit der Arbeitsumgebung verbunden werden. Das wird mit der Funktion `DBI::dbConnect()` erreicht. 

```r
verbindung = DBI::dbConnect(RSQLite::SQLite(), 
                            dbname = DatenbankDateiName)
```

Damit eine Verbindung aufgebaut werden kann, muss die Variable `DatenbankDateiName` noch korrekt initialisiert werden. 

```r
DatenbankDateiName = "beispieldb.sqlite3"

verbindung = DBI::dbConnect(RSQLite::SQLite(), 
                            dbname = DatenbankDateiName)
```

### Auf eine Datenbanktabelle zugreifen

Um mit R auf eine Datenbank-Tabelle zuzugreifen, müssen diese zuerst bekanntgeben werden. Dazu wird die `tbl()` Funktion verwendet. Mit dieser Funktion wird R darüber informiert, dass eine Datenbanktabelle über eine Datenbankverbindung abgerufen werden kann. 

Das folgende Beispiel registriert die Datenbanktabelle `beispiel` für weitere Operationen.

```r
beispielTabelle = tbl(verbindung, "beispiel")
```

Diese Registrierung teilt R mit, dass die Datenbanktabelle `beispiel` über die vorher erzeugte Verbindung zur Datenbank erreichbar ist. Mit dieser Registrierung kann diese Tabelle nun als Datenquelle verwendet werden.  

Um Daten aus dieser Tabelle zu erhalten muss der Datenbank mitgeteilt werden, welche Vektoren aus der jeweiligen Tabelle abgefragt werden sollen. Hier sollten Sie sich auf die notwendigen Vektoren beschränken, um nicht unnötig viele Daten zu übertragen. Entsprechend geht der folgende Code mit guten Beispiel voraus und fordert alle Vektoren der Tabelle `beispiel` an. 

```r
beispielTabelle %>% 
    select(everything())
```

```
# Source:   table<beispiel> [?? x 3]
# Database: sqlite 3.36.0 [/home/jovyan/lehre/dxiai/ADLS/LVs/beispieldb.sqlite3]
   name                   jahr studiengang
   <chr>                 <int> <chr>      
 1 Daten & Information    2022 ADLS       
 2 Daten & Information 1  2022 FM         
 3 Daten & Information 2  2022 FM         
 4 Statistik              2022 UI         
 5 Informatik             2022 UI         
 6 Daten & Information 1  2021 FM         
 7 Daten & Information 2  2021 FM         
 8 Statistik              2021 UI         
 9 Informatik             2021 UI         
10 Daten & Information 1  2020 FM         
# … with more rows
```

Damit erhalten wir einen ersten Blick auf den Inhalt der Tabelle. 


### Daten filtern und andere Operationen

Falls wir nur einen Ausschnitt der Daten erhalten möchten, können wir die Daten wie gewohnt filtern. 

```r
beispielTabelle %>% 
    select(everything()) %>%
    filter( studiengang == "ADLS" )
```

```
# Source:   SQL [1 x 3]
# Database: sqlite 3.36.0 [/home/jovyan/lehre/dxiai/ADLS/LVs/beispieldb.sqlite3]
  name                 jahr studiengang
  <chr>               <int> <chr>      
1 Daten & Information  2022 ADLS       
```

Wir sehen nun, dass wir nur eine Durchführung eines ADLS-Moduls in unserer Datenbank gespeichert haben. 

<p class="alert alert-success" markdown="1">
Führen Sie komplexe Operationen in R und nicht schon in der Datenbankabfrage aus.
</p>

Sind wir mit unserer Abfrage zufrieden, speichern wir diese Abfrage in eine eigene Variable.

```r
beispielTabelle %>% 
    select(everything()) %>%
    filter( studiengang == "ADLS" ) -> SQLAbfrage
```

### Das Ergebnis einer Datenbankabfrage in ein `tibble` konvertieren

Mit diesen Abfragen haben wir eine Datenbankabfrage *vorbereitet*. Damit diese Daten auch in R verwendet werden können, müssen die Daten noch in ein Stichprobenobjekt *konvertiert* werden. 

```r
SQLAbfrage %>% 
    as_tibble() -> DB_Stichprobe
```

Erst mit diesem Schritt werden die Daten endgültig aus der Datenbank als Stichprobe in die Arbeitsumgebung ***importiert***. 
