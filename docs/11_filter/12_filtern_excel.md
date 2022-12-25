EXCEL bietet die Funktion `FILTER()` zum Filtern von Daten. Diese Funktion erzeugt einen Ergebnisbereich mit den Werten, die durch den angegebenen logischen Ausdruck ausgewählt wurden. 

<p class="alert alert-danger" markdown="1">
In **EXCEL** können in Tabellen und Pivot-Tabellen für einzelne Vektoren Werte für die *Darstellung* "gefiltert" werden. Dabei verwendet EXCEL nicht immer die Filter Funktion, sondern blendet einzelne Datensätze aus. Dadurch können die Ergebnisse von nachgereihten Operationen nicht dem dargestellten Werten zusammenpassen, weil nicht dargestellte Werte nicht aus den Tabellen entfernt wurden.
</p>

<p class="alert alert-primary" markdown="1">
EXCELs `FILTER()`-Funktion wählt aus einem Vektor die Werte aus, für die ein **Auswahlvektor** den Wert `WAHR` oder einen Wert, der dem logischen `WAHR` entspricht. 
</p>

Das veranschaulicht das folgende Beispiel.

| | A | B | C | D |
| :---: | :---| :---: |  :---: | :---: | 
| **1** | Basel | WAHR | | `=FILTER(A1:A5; B1:B5)` | 
| **2** | Genf | FALSCH | | Basel | 
| **3** | Lugano | FALSCH | | Zug | 
| **4** | Zug | WAHR | | Zürich | 
| **5** | Zürich | WAHR | | | 

Anstelle eines Vektors mit Wahrheitswerten wird meistens ein Vergleich als zweiter Parameter übergeben. Dieser Vergleich muss einen Vektor erzeugen, der genauso lang ist, wie der Vektor im ersten Parameter. Das erreichen wir, indem der Vergleich entweder den Vektor selbst oder einen benachbarten Vektor verwendet.

| | A | B | C | D |
| :---: | :---| :---: |  :---: | :---: |
| **1** | Basel | deutsch | | `=FILTER(A1:A5; B1:B5 = "deutsch")` | 
| **2** | Genf | französisch | | Basel | 
| **3** | Lugano | italienisch | | Zug | 
| **4** | Zug | deutsch | | Zürich | 
| **5** | Zürich | deutsch | | | 


## EXCEL Filter und logische Operationen

<p class="alert alert-warning" markdown="1">
Die logischen EXCEL Funktionen `UND()`, `ODER()` sowie `XODER()` sind **Aggregatoren**. Sie erzeugen deshalb keine Vektoren und können nicht in der Funktion `FILTER()` verwendet werden.
</p>

<p class="alert alert-success" markdown="1">
Die Funktion `NICHT()` ist kein Aggregator und kann in der `FILTER()`-Funktion verwendet werden.
</p>

Um mit komplexen logischen Ausdrücken in Filtern zu verwenden, müssen wir die logischen Operatoren durch ihre *arithmetische Schreibweise* ersetzen.

| | A | B | C | D | E |
| :---: | :---| :---: |  :---: | :---: | :---: |
| **1** | *Name* | *Sprache* | *Einwohner:innen* | | *Formel* |
| **2** | Basel | deutsch | 173863| | `=FILTER(A2:A6;(B1:B5="deutsch")*(C2:C6 > 100000))` | 
| **3** | Genf | französisch | 203856 | | Basel | 
| **4** | Lugano | italienisch | 62315 | | Zürich | 
| **5** | Zug | deutsch | 30934 | | | 
| **6** | Zürich | deutsch | 421878 | | | 
