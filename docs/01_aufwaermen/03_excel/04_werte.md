Mit einem leeren Arbeitsblatt lässt sich nicht gut arbeiten. In der Regel wollen wir in Excel mit Daten arbeiten. Diese Daten können wir direkt auf einem Arbeitsblatt eingeben. 

Am einfachsten können wir Werte eingeben, indem wir einfach auf der Tastatur tippen. Excel fügt dann unsere Eingabe in die aktive Zelle ein.

<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/markierung_verschieben.gif?raw=true"><img alt="markierung_verschieben.gif" title="Markierungen verschieben" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/markierung_verschieben.gif?raw=true" width="400"></a>

Wir schliessen die Eingabe mit der Eingabe- oder der Tabulator-Taste ab. Wenn wir die Eingabe-Taste verwenden, dann wird die aktive Markierung eine Zeile nach unten verschoben. 

<p class="alert alert-info" markdown="1">
Gelegentlich wollen wir nicht, dass die Markierung verschoben wird, wenn wir mit einer Eingabe fertig sind. Wir erreichen das, indem wir die Eingaben mit ``C + Eingabe`` beenden. Die Markierung bleibt auf der gerade bearbeiteten Zelle.
</p>

Gelegentlich wollen wir die *Eingabe abbrechen*, um vorhandene Werte nicht zu überschreiben. In diesem Fall drücken wir die ``Esc``-Taste, um eine Eingabe abzubrechen und den ursprünglichen Wert einer Zelle wieder herzustellen. 


Wenn wir Werte in einer Markierung löschen möchten, dann verwenden wir die ``Backspace``- oder der ``Löschen``-Taste auf unserer Tastatur.

### Markierungen

#### Markierung ändern

Wir können die Markierung mit der Maus zu einer anderen Zelle verschieben. Häufig wollen wir eine Markierung verschieben. Neben dem Verschieben mittels der Maus können wir die Markierung auch mit der Tastatur bewegen. In diesem Fall verschieben wir die Markierung mit einer der *Cursor*-Tasten. Tippen wir einen der Pfeile, dann bewegt sich die Markierung eine Zelle in die entsprechende Richtung.


Bei langen Wertekolonnen hilft uns die Kommandosequenz `C + Pfeiltaste` (Win) bzw. `Cmd + Pfeiltaste` (Mac), um auf den ersten oder letzten Wert einer Zeile oder Spalte zu springen. Genau genommen springt die Markierung bei dieser Kommandosequenz auf die nächste Zelle in der entsprechenden Richtung, in der ein Wert steht und die an eine leere Zelle grenzt oder am Anfang der Spalte oder Zeile steht. 

<p class="alert alert-info"  markdown="1">
Die markierte Zelle wird beim Speichern der Arbeitsmappe mitgespeichert. Deshalb fragt Sie Excel, ob Sie die Änderungen in Ihrer Arbeitsmappe speichern wollen, obwohl Sie *nur* die Markierung verschoben haben. 
</p>

#### Mehrere Zellen markieren

Wir können mehrere Zellen gleichzeitig markieren. Dazu klicken wir mit der Maus in eine Zelle und halten die Maus gedrückt. Dann ziehen wir die Maus bis zu der Zelle, die das Ende der Markierung sein soll und lassen dann die Maustaste los. Diese Markierung umfasst nun alle Zellen in der Fläche zwischen der linken oberen Ecke und der rechten unteren Ecke. Solche Markierungen bezeichnen wir als `Bereich`. 

Natürlich können wir auch mit der Tastatur mehrere Zellen markieren. Dazu drücken wir die Hochstelltaste und halten sie gedrückt. Dann bewegen wir das Ende der Markierung mit den Pfeiltasten bis zur gewünschten Zelle. Selbstverständlich funktioniert die Kontrollsequenz zum schnellen Bewegen weiterhin. 

<p class="alert alert-info"  markdown="1">
Excel erlaubt es uns schnell Zeilen oder Spalten zu markieren. Dazu klicken wir auf die Zeilen- oder Spaltennummer in der Tabellenansicht. 
</p>

<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/spalten_zeilen_markieren.gif?raw=true"><img alt="spalten_zeilen_markieren.gif" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/spalten_zeilen_markieren.gif?raw=true" width="400" height="291.3190529876" /></a>

In der Excel Dokumentation werden in der Regel nur Bereiche erwähnt. Wir können uns eine einzelne Zelle als den Bereich vorstellen, bei dem die linke obere Zelle und die rechte untere Zelle identisch sind. 

#### Mit Bereichsmarkierungen arbeiten

Eine Markierung über mehrere Zellen erlaubt es uns, Eingaben in diesem Bereich zu machen. Dabei ist die aktuelle Zelle hell hervorgehoben. Wir springen mit Eingabe oder der Tabulator-Taste in die nächste Zelle. Haben wir nur Zellen in einer Spalte oder einer Zeile markiert, dann bewegt sich die aktuelle Zelle bei Zeilenmarkierung nach rechts oder bei Spaltenmarkierung nach unten. Sind wir am Ende der Markierung angelangt und drücken die Eingabe- oder die Tabulator-Taste, dann springt die aktive Zelle auf die erste Zelle in der Markierung. 

#### Spezielle Mausfunktionen für Markierungen

Wir können eine Markierung mit der Maus verschieben. Dazu bewegen wir den Mauszeiger über den Rand der Markierung bis eine kleine Hand erscheint. 

Wenn die Hand angezeigt wird, können wir die gesamte Markierung "greifen" und verschieben. Dazu klicken wir auf den Rand und ziehen die Markierung an die gewünschte Stelle. Wenn an dieser Stelle bereits Werte stehen, fragt uns Excel, ob wir die alten Werte überschreiben möchten. 


Drücken wir dabei die `Hochstelltaste` beim Ziehen, dann können wir die Markierung *zwischen* zwei Bereiche einfügen. Excel zeigt uns beim Ziehen die Position an, an der die Markierung eingefügt wird. Excel schafft dazu Platz und überschreibt keine Werte. 

Drücken wir die `Strg`-Taste beim Ziehen, dann *kopieren* wir den markierten Bereich an die gewünschte Stelle. Die Werte des ursprünglich markierten Bereichs bleiben dabei erhalten. Wenn an der neuen Position bereits Werte stehen, fragt uns Excel, ob wir die alten Werte überschreiben möchten. 
Wenn wir die `Strg`- und die `Hochstelltaste` kombinieren, dann lassen sich Zellen zwischen zwei Bereichen *kopieren*. 

### Werte

Excel kennt 5 Grundarten für Werte: 

1. Zahlen
2. Zeichenketten
3. Wahrheitswerte
4. Fehler
5. leere Zelle


Diese Arten werden als `Datentypen` bezeichnet.

**Zahlen** sind in Excel immer reelle Zahlen. Viele Werte werden von Excel intern als Zahlen behandelt. Dazu gehören:

* Prozentwerte
* Währungswerte
* Zeitangaben
* Datumsangaben

Die Darstellung einer Zahl, hängt von ihrer Formatierung ab. Deshalb werden Datentypen im Excel-Jargon als `Zahlenformat` bezeichnet

**Zeichenketten** sind Folgen von Symbolen. Meistens sind das Worte und Beschriftungen. Zeichen werden von Excel als `Text` bezeichnet.


**Wahrheitswerte** bezeichnen die beiden Werte `WAHR` und `FALSCH`. Bei Bedarf wandelt Excel Wahrheitswerte in Zahlen um. Dabei wird der Wert `WAHR` in die Zahl `1` und der Wert `FALSCH` in die Zahl `0` umgewandelt. Umgekehrt wandelt Excel Zahlen automatisch in Wahrheitswerte um. Dabei wird die Zahl `0` in den Wert `FALSCH` und alle anderen Zahlen in den Wert `WAHR` umgewandelt. 

<p class="alert alert-warning" markdown="1">
Wollen wir die **Zeichenketten** ``Wahr`` oder ``Falsch`` eingeben, müssen wir unabhängig von der Gross- und Kleinschreibung dieser Werte immer ein Apostroph ``'`` als erstes Zeichen eingeben. Vergessen wir den Apostroph, dann wandelt Excel unsere Eingabe automatisch in einen Wahrheitswert. 
</p>

**Fehler** sind Werte, die einen bestimmten Status anzeigen. Normalerweise werden diese Werte von Funktionen erzeugt, um auf ein Problem hinzuweisen. Excel kennt in der aktuellen Version nur die folgenden Fehlerwerte: 

* ``#WERT!``
* ``#DIV/0!``
* ``#NV``
* ``#NULL!``
* ``#NAME?``
* ``#ZAHL!``
* ``#BEZUG!``
* ``#ÜBERLAUF!``
* ``#DATEN_ABRUFEN``

<p class="alert alert-warning"  markdown="1">
Wollen wir einen dieser Werte als Zeichenkette eingeben, dann müssen wir immer ein Apostroph ``'`` als erstes Zeichen eingeben. Vergessen wir den Apostroph wandelt Excel unsere Eingabe automatisch in einen Fehlerwert um. 
</p>

**Leere Zellen** werden in Excel besonders behandelt. Es handelt sich dabei um einen Datentyp mit speziellen Eigenschaften. Leere Zellen sind ungleich leeren Zeichenketten, obwohl wir in der Ansicht den Unterschied nicht erkennen können.

#### Bestimmung des Wertes und des Datentyps

Bei der Eingabe versucht Excel den Datentypen zu erkennen. Auf dieser Basis wird der interne Wert einer Eingabe bestimmt. Dadurch kann es vorkommen, dass eine Eingabe "plötzlich" als ein anderer Wert dargestellt wird, als wir es angenommen haben.  Diese als "Auto-Konvertierung" bekannte Eigenschaft kann zu unerwünschten Nebeneffekten führen, weil z.B. aus Zeichenketten Zahlen oder Datumsangaben werden. 

#### Erzwingen eines Datentyps 

Wir können den Datentyp einer Zelle, eines Bereichs, Spalte, Zeile explizit festlegen und Excel davon abhalten, den Datentyp einer Eingabe zu raten. 

Dazu benötigen wir die folgenden Schritte: 

1. Wir markieren den gewünschten Bereich mit der Maus oder der Tastatur.
2. Im Menuband ``Start`` wählen wir im Bereich ``Zahlen`` aus der Auswahlliste den gewünschten Datentypen aus.

Sobald wir einen Datentyp für einen Bereich festgelegt haben, versucht Excel den gewählten Datentyp für unsere Eingaben zu übernehmen.

<p class="alert alert-warning" markdown="1">
Beachten Sie, dass Wahrheitswerte und Fehler nicht als Datentyp vorgegeben werden können. 
</p>