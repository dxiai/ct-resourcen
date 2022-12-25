# EXCEL Exkurs: Vektoren aus Matrizen extrahieren

### Problem

Wir haben eine Matrix aus unseren Daten vektorisiert und möchten auf einen einzelnen Vektor zugreifen.

### Lösung

Angenommen an der Adresse `A1` steht die Spaltennummer unseres Vektors.

```EXCEL
= INDEX(M1#; SEQUENZ(ZEILEN(M1#)); A1)
```

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=544758" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download">* Vollständiges Beispiel</a>

### Erklärung

Die `INDEX()` Funktion erlaubt uns nicht nur auf einzelne Werte einer Matrix zuzugreifen. Wir können auch einzelne Datensätze oder Vektoren auswählen, wenn wir alle Zeilen- bzw. Spaltennummern übergeben, die unser Ergebnis umfassen soll.

Um einen Vektor aus einer Matrix zu extrahieren, nummerieren wir alle Zeilen durch und geben die gewünschte Spalte an. Wenn unsere vektorisierte Matrix zusätzlich Überschriften enthält, müssen wir die Zeilennummern um eine Zeile verkürzen und bei `2` starten lassen, sonst wird die Überschrift als Teil unserer Daten übernommen. 

Falls wir mehrere Spalten und Zeilen extrahieren möchten, dann muss der Vektor für die Spaltennummern *horizontal* orientiert sein. Um alle Spalten und alle Zeilen auszulesen, könnten wir die folgende Formel verwenden.

```EXCEL
= INDEX(M1#; SEQUENZ(ZEILEN(M1#)); SEQUENZ(1;SPALTEN(M1#)))
```

Allerdings ist das eine etwas umständlich formulierte Identitätsfunktion. 

Eine elegante Anwendung ist hier die Kombination mit der `XVERGLEICH()` Funktion, um über die Spaltenüberschrift die Nummer der Spalte herauszufinden. Dazu ermitteln wir in den Spaltenüberschriften die gewünschten Spaltennummern und übergeben diese als Vektor der `INDEX()`-Funktion. 