EXCEL hat zwei Arten der Vektorenselektierung: 

1. Die Tabellenadressierung
2. Die Funktionskette `Spaltenwahl` und `XVERGLEICH`

### Tabellenadressierung

Die Tabellenadressierung setzt voraus, dass die Daten einer Stichprobe als EXCEL Tabelle vorliegen. Eine Tabelle hat einen Namen und die Spaltenüberschriften werden als Vektoradressen handelt. Eine Tabelle wird automatisch beim Import einer EXCEL-Arbeitsmappe oder CSV-Tabelle erstellt. Im Abschnitt [*EXCEL Datetyp Tabelle*](https://moodle.zhaw.ch/mod/page/view.php?id=635147) wird das Erstellen und Adressieren einer EXCEL Tabelle beschrieben. Dort findet sich auch die Auswahl eines einzelnen Vektors. 

Um mehrere Vektoren auszuwählen, müssen die Spaltennamen in einzusätzliches Paar eckige Klammern eingerahmt werden und mit dem Doppelpunkt Operator verknüpft werden. Zum Bespiel wählt die Adressierung `=Tabelle1[[Spalte1]:[Spalte3]]` alle Spalten aus der Tabelle, die zwischen den Namen `Spalte1` und `Spalte3` liegen.  

Mit der Tabellenadressierung ist es nur möglich, zusammenhängende Abfolgen von Vektoren aus einer Tabelle auszuwählen. Es ist nicht möglich nur bestimmte Vektoren einzeln auszuwählen.

### Funktionskette `Spaltenwahl` und `XVERGLEICH`

Die folgenden Vorgehensweise ist flexibler als die Tabellenadressierung und funktioniert auch, wenn die Daten nicht als Tabelle vorliegen.

Neben der Tabellenadressierung bietet EXCEL die Funktion `SPALTENWAHL()`, um Vektoren aus einem Bereich auszulesen. Diese Funktion benötigt aber die Position der gewünschten Spalte, denn oft sollen aber  Vektoren wie in R über Namen ausgewählt werden. Dafür kommt die Funktion `XVERGLEICH()` zur Anwendung. Mit `XVERGLEICH()` erhalten wir die Position eines gesuchten Werts in einem angegebenen Bereich. 

Die Idee hinter dem hier beschriebenen Ansatz ist, dass wir herausfinden, wo unser gewünschter Vektor in der Stichprobe steht. Anschliessend wählen wir alle Werte an dieser Position mit der Funktion `Spaltenwahl()` aus. 

<p class="alert alert-success" markdown="1">
Die Funktion `XVERGLEICH()` ähnelt der Funktion `XVERWEIS()` indem wir einen Wert in einem Vektor suchen können. Anstelle eines Referenzwerts aus einem anderen Vektor liefert `XVERGLEICH()` nur die Position des gesuchten Werts zurück. Falls ein Wert mehrfach vorkommt, dann gibt die Funktion nur die *erste* Position zurück. 
</p>

Der Funktion `XVERGLEICH()` können mehrere Suchwerte übergeben werden, für welche die Positionen bestimmt werden. 

![Beispiel für Vektorenselektion](https://github.com/dxiai/ct-resourcen/raw/main/bilder/gruppieren/Vektorenselektion_Excel.png)


#### Umsetzung

Der Algorithmus zum Selektieren von Vektoren ist durch die folgenden Schritte definiert: 

1. Wir *vektorisieren* nur die Vektornamen auf einem neuen Arbeitsblatt mit der Identitätsfunktion ab Adresse `B1`. Zur Veranschaulichung nenne ich dieses Arbeitsblatt `Stichprobendaten`. 
2. Wir *vektorisieren* *alle* Stichprobendaten mittels der Identitätsfunktion auf dem gleichen Arbeitsblatt ab Adresse `B2`. 
4. Auf einem neuen Arbeitsblatt geben wir in der ersten Zeile die Vektorennamen ab Adresse `A1` ein, die wir auswählen möchten. In diesem Beispiel wird angenommen, dass 3 Vektoren ausgewählt werden sollen.
5. Wir wählen die einzelnen Vektoren mit der folgenden Formel an der Adresse A2 aus: `=SPALTENWAHL(Stichprobendaten!$B$2#; XVERGLEICH(A1:C1; Stichprobendaten!$B$1#))`. 

<a href="https://github.com/dxiai/ct-resourcen/raw/main/beispiele/Beispiel_selektieren.xlsx" class="btn btn-lg btn-primary" download><i class="fa fa-lg fa-download"></i> Beispielarbeitsmappe</a>

