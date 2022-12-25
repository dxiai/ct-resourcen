<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=635245" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download"></i> Beispiel EXCEL Pivot-Tabelle </a>

In EXCEL gibt es die Funktionalität der *Pivot-Tabellen*. Diese finden wir im Menuband `Einfügen` unter dem Punkt `PivotTabelle`. Wenn wir als ersten Schritt diesen Menupunkt auswählen, dann erscheint ein Dialog, mit dem wir den Datenbereich auswählen. Damit wir möglichst flexibel sind, wählen wir hier häufig die gesamte Stichprobe aus.

![Menupunkt Pivot-Tabelle](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_menubar_pivottabelle.png)

Anschliessend müssen wir auswählen, ob wir die Pivot-Tabelle auf dem gleichen Arbeitsblatt oder auf einem neuen Arbeitsblatt erstellen möchten. In der Regel sollte hier ein *neues Arbeitsblatt* ausgewählt werden. 

![Dialog Pivot-Tabelle Mac](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_pivot_dialog1.png)
![Dialog Pivot-Tabelle Windows](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_pivot_dialog_windows.png)

Daraufhin erstellt EXCEL ein neues Arbeitsblatt und stellt einen Informationsbereich für unsere Kreuztabelle dar. Am rechten Rand des EXCEL-Fensters wird ausserdem der Pivot-Dialog angezeigt. Mit diesem Dialog können wir die Daten und Operationen auswählen, die wir transponieren möchten. Anders als R fasst EXCEL in Pivot-Tabellen *transponieren* und *aggregieren* zusammen. Diese zwei Schritte können wir in EXCEL nicht trennen. 

Im Pivot-Dialog werden uns alle Vektoren angezeigt, die wir im ersten Schritt für unsere Pivot-Tabelle ausgewählt haben. Nun wählen wir den Vektor aus, entlang welchem wir transponieren möchten. Dieser Vektor gibt uns die Spaltennamen in der Kreuztabelle. Dazu ziehen wir den Vektornamen im Pivot-Dialog in den Bereich `Spalten`.

Im dritten Schritt wählen wir aus, welche Daten im Wertebereich angezeigt werden sollen. Dazu ziehen wir den gleichen Vektor in den Bereich `Werte` im Pivot-Dialog. Nun zeigt uns EXCEL die Aggregationsfunktion an, die nach dem Transponieren verwendet wird, um das Ergebnis zu erzeugen. Standardmässig wird in diesem Fall die *Anzahl der Werte* ausgewählt, falls es sich um Zeichenketten handelt, oder die *Summe der Werte*, falls es sich um Zahlen handelt. 

Falls wir zwei Vektoren haben, die wir gemeinsam auswerten möchten, können wir den zweiten Vektornamen in das Feld `Zeilen` ziehen. Nun wertet EXCEL automatisch das gemeinsame Auftreten der Werte für uns aus. 

![Pivot-Tabelle als Kreuztabelle animiert](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_pivot_animiert.gif)

Im Pivot-Dialog können wir die Aggregationsfunktion für den Wertebereich anpassen, indem wir auf das i-Icon klicken. Dadurch öffnen wir den Dialog zum Konfigurieren der Aggregation und wir können aus verschiedenen Aggregationen auswählen. Diese Aggregationen sind vorgegeben und können nicht durch eigene Operationen ergänzt werden. Der gleiche Dialog bietet auch verschiedene Auswahlmöglichkeiten, ob die Ergebniswerte als absolute Werte oder als  relative Werte mit verschiedenen Bezugsgrössen dargestellt werden sollen. 

![Pivot-Aggregationen Dialog Mac](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_pivot_aggregation_dialog.png)
![Pivot-Aggregationen Dialog Windows](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_pivot/excel_pivot_aggregation_dialog_windows.png)

<p class="alert alert-warning" markdown="1">
Pivot-Tabellen können in EXCEL leider nur mit der Maus erstellt werden und stehen nicht als Funktion zur Verfügung. Es ist auch nicht *direkt* möglich, aufgefächerte Daten in die Langform umzukehren.
</p>

