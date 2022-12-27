<p class="alert alert-warning" markdown="1">
SQL-Datenbanken sind eine wichtige IT-Komponente in Unternehmen. Beim Mischen von SQL-Abfragen mit Logiken in anderen Programmiersprachen lauern viele Sicherheitsprobleme bis hin zum vollständigen Datenverlust. 
</p>

<p class="alert alert-success" markdown="1">
Damit SQL-Abfragen sicherer werden, stellen die meisten modernen Programmiersprachen spezielle Schnittstellen bereit, sodass die eigentliche SQL-Abfrage nicht mehr im Code auftaucht und so die gängigsten Fehlerquellen vermieden werden. In R kapselt die Bibliothek `dbplyr` SQL-Abfragen in der gleichen Logik, die wir bereits von der Arbeit mit normalen Stichprobenobjekten her kennen. 
</p>

Die Datenabfragelogik von SQL besteht aus mehreren Teilen.

1. Dem Selektor für die Vektoren
2. Der Auswahl der Tabellen 
3. Einem optionalen Auswahlfilter
4. Einer optionalen Gruppierungsregel
5. Einer optionalen Sortierungsreihenfolge
6. Einer optionalen Ergebnisbegrenzung

Eine minimale Abfrage besteht aus einem Selektor und der Tabellenauswahl.

Das folgende Beispiel fragt alle Vektoren der Tabelle `beispiel` ab. 

```sql
SELECT * FROM beispiel
```
 
Um nicht alle Vektoren zu erhalten, können einzelne Vektoren angegeben werden. Das folgende Beispiel wählt nur die Vektoren `name` und `jahr` aus der Tabelle `beispiel` aus. 

```sql
SELECT name, jahr FROM beipiel
```

### SQL-Filter

SQL-Filter werden an die Auswahl der Daten angehängt und mit `WHERE` eingeleitet. Wie in R werden Filter mit logischen Ausdrücken umgesetzt. In SQL stehen zur Verknüpfung von logischen Ausdrücken die logischen Operatoren `AND`, `OR` und `NOT`. 

Das folgende Beispiel fragt die Vektoren `name` und `jahr` aus der Tabelle `beispiel` ab, für die das `jahr` grösser als `2000` ist. 

```sql
SELECT name, jahr FROM beispiel WHERE jahr > 2000
```

SQL verwendet die gleichen Vergleichsoperatoren wie R und hat zusätzlich die Vergleichsopertatoren Operatoren `IN` sowie `BETWEEN`. 

`IN` entspricht dem R-Operator `%in%` und gibt wahr zurück, wenn der Wert in einem Vektor in der angegebenen Werteliste vorkommt. 

`BETWEEN` verknüpft die zwei kleiner Vergleichsoperatoren. Der logische Ausdruck `vektorname BETWEN 13 AND 21` entspricht dem Vergleich `13 &lt; vektorname AND vektorname &lt; 21` 

Beide Operatoren können mit `NOT` umgekehrt werden. Zum Beispiel schreibt man in SQL `vektorname NOT BETWEN 13 AND 21` anstatt `NOT(vektorname BETWEN 13 AND 21)`.

### SQL Gruppierungen und Aggregatoren

Ein SQL-Selektor kann Aggregationsfunktionen enthalten. Aggregatoren werden sehr häufig gemeinsam mit einer Gruppierungsregel eingesetzt. Typische Aggregatoren sind COUNT() oder SUM(). In vielen Fällen empfielt es sich jedoch, die Aggregation von R durchführen zulassen. 

### SQL-Ergebnisse sortieren

Wird eine SQL-Abfrage durch `ORDER BY` ergänzt, dann werden die Ergebnisse nach den folgenden Vektoren sortiert. Folgt einem Vektornamen der Zusatz `DESC` erfolgt die Sortierung absteigend, sonst werden die Werte aufsteigend sortiert. Werden mehrere Vektoren angegeben, dann ist die Sortiuerung von der Reihenfolge der angegebenen Vektoren abhängig. 

Im folgenden Beispiel werden die Ergebnisse zuerst aufsteigend nach den Werten im Vektor `name` sortiert und anschliessend nach absteigend nach `jahr`. 

```sql
SELECT name, jahr FROM beispiel WHERE jahr > 2000 ORDER BY name, jahr DESC
```

### SQL-Ergebnisse begrenzen

SQL kennt ein ähnliches Konzept wir R's `head()` Funktion. Mit dem Zusatz `LIMIT` kann die Anzahl der Ergebnisse begrenzt werden.

Das folgende Beispiel fragt für die ersten `10` Datensätze aus der Tabelle `beispiel` ab. 

```sql
SELECT * FROM beispiel LIMIT 10
```

