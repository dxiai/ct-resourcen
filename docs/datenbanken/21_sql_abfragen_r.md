SQL-Abfragen sind komplex und sind eine häufige Fehlerquelle. Deshalb versuchen wir möglichst **nie** SQL-Abfragen in unserem Programmcode direkt einzugeben. Stattdessen verwenden wir sog. *Wrapper-Bibiliotheken*, die die Komplexität der SQL-Abfragen durch normale Funktionsaufrufe verstecken. Dadurch werden Tipp- und Logikfehler in den Abfragen stark reduziert und können meistens vermieden werden. 

In R verwenden wir dazu die Bibliothek [`dbplyr`](https://dbplyr.tidyverse.org/). Diese Bibliothek ermöglicht es mit den vertrauten Funktionen `select()`, `mutate()`, `summarise()`, `group_by()` und  `filter()` auf Werte in Datenbanken zuzugreifen.

<p class="alert alert-secondary" markdown="1">
In allen Beispielen wird eine sog. `sqlite3`-Datenbank verwendet. [SQLite3](https://www.sqlite.org) ist eine Open Source Datenbank für normale Dateisysteme. Die Datenbank liegt als Datei auf einem Rechner und kann so direkt verwendet werden.
</p>

<p class="alert alert-success" markdown="1">
SQLite ist auf MacOS vorinstalliert und kann direkt von der Kommandozeile gestartet werden. Die Jupyter R-Umgebung enthält ebenfalls SQLite und hat  Beispieldatenbanken vorinstalliert.
</p>

<p class="alert alert-success" markdown="1">
SQLite muss auf Windows selbst installiert werden. 
</p>

### Eine Verbindung zu einer Datenbank herstellen

### Auf eine Datenbanktabelle zugreifen

### Daten aus einer Datenbanktabelle abfragen

### Daten filtern

### Das Ergebnis einer Datenbankabfrage in ein `tibble` konvertieren


