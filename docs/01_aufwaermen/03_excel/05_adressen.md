In Formeln und Funktionen wollen wir Werte nicht immer direkt eintippen, sondern wollen Werte aus anderen Zellen in einer Arbeitsmappe oder einem Arbeitsblatt übernehmen. Grundsätzlich ist es ein guter Stil, wenn Sie in einer Excel-Formel keine Werte direkt eingeben, sondern immer auf Werte in anderen Zellen verweisen. Solche Verweise in Formeln oder Funktionsparametern bezeichnen wir als `Bezüge`.

### Das A1-Adressformat

Mit Hilfe der Spalten und der Zeilennummer können wir jede Zelle in einer Tabelle genau adressieren. Für die Adresse einer Zelle lesen wir den Buchstaben für die Spalte ab und dann die Nummer für die Zeile. Anschliessend schreiben wir die beiden Werte nacheinander auf. Daraus ergibt sich die Adresse einer Zelle. Die Adresse können wir als *Bezug auf den Wert in dieser Zelle* in Formeln verwenden. 

Wenn wir eine Formel in eine Zelle schreiben, dann können wir mit der Maus auf eine gewünschte Zelle klicken. Excel fügt dann die ausgewählte Adresse in unsere Formel ein. In diesem Fall übernimmt Excel den Wert der Adresse in die Formel.

<p class="alert alert-info" markdown="1">
Die Adresse der aktiven Zelle wird ganz Links im Funktionsbalken angezeigt. 
</p>

### Das Z1S1-Adressformat

Ein entscheidender Nachteil des A1-Adressformats ist es, dass man die Spaltennummer nicht direkt ablesen kann. Dadurch ist es schwer aus dem Kopf zu sagen, welche A1-Adresse auf die Zelle in der 36 Spalte und der 10 Zeile verweist. Hier setzt das Z1S1 Format an. Dieses Format erfordert zuerst die Zeilennummer und als zweites die Spaltennummer der Zelle.

Mit dem Z1S1-Format können wir leicht die Adressierung unseres Beispiels erstellen: Die Adresse lautet `Z10S36`. 

Im Gegensatz zum `A1`-Format können wir mit dem `Z1S1`-Format auf Zellen relativ zu einer bestehenden Zelle adressieren. Dazu schreiben wir den Abstand relativ zur aktiven Zelle in Zeilen und Spalten jeweils in Klammern. Um von der Zelle `Q5` zwei Zeilen nach unten und drei Spalten nach links zu gehen, können wir im `Z1S1`-Format `Z(2)S(-3)` schreiben.

<p class="alert alert-warning">Das Z1S1-Format kann in Formeln nicht verwendet werden. Einige Adress-Funktionen von Excel folgen aber dem Z1S1 Prinzip und fordern als ersten Parameter die Zeile und als zweiten Parameter die Spalte. </p>

### Bereiche adressieren

Für viele Funktionen ist es wichtig, einen ganzen Bereich zu adressieren. Die Adresse eines Bereichs wird durch die Adressen der Zellen an der linken-oberen und an der rechten-unteren Ecke festgelegt. Wir legen einen Bereich als Adresse fest, indem wir diese beiden Zellen mit dem Doppelpunkt-Operator (`:`) verbinden. Der Operator wird deshalb auch als `Bereichsoperator` bezeichnet. 

Z.B. mit der Adresse `B2:D4` adressieren wir die Zellen `B2`, `B3`, `B4`, `C2`, `C3`, `C4`, `D2`, `D3`, und `D4`. Die Bereichsadressierung ist also sehr viel kompakter als jede Zelle im Bereich einzeln zu adressieren. 

Wenn wir ganze Spalten markieren möchten, müssen wir den Spaltennamen, in der sich die Zelle der linken-oberen Ecke befindet, vor den Operator und den Spaltennamen, in der sich die Zelle der rechten-unteren Ecke befindet, nach dem Operator eingeben. Wir lassen dazu die Zeilennummern weg. Um alle Zellen in den Spalten B bis D auszuwählen, müssen wir also `B:D` eingeben.

<p class="alert alert-info" markdown="1">
Wenn nur eine Spalte ausgewählt werden soll, dann liegen die beiden Ecken in der gleichen Spalte. Entsprechend muss der gleiche Spaltenname vor **und** hinter dem Operator stehen. Z.B. ``C:C`` für die ganze C-Spalte. 
</p>

Die Adressierung ganzer Zeilen funktioniert analog zur Adressierung ganzer Spalten. Anstatt der Spaltennamen müssen wir jedoch die Zeilennummern angeben und den Spaltennamen weglassen. Wenn wir alle Zellen in den Zeilen 3 bis 6 auswählen wollen, lautet die Adresse `3:6`. 

<p class="alert alert-info" markdown="1">
Beachten Sie, dass der Doppelpunkt in Excel **immer** der Bereichsoperator ist und keine Division auslöst. Die Division wird ausschliesslich mit dem Divisionsoperator ``/`` beschrieben. 
</p>

<p class="alert alert-success" markdown="1">
Wenn Sie nur eine Zeile auswählen wollen, dann liegen die beiden Ecken in der gleichen Zeile. Entsprechend muss der gleiche Spaltenname vor **und** hinter dem Operator stehen. Z.B. ``4:4`` für die ganze Zeile 4.
</p> 

Wir adressieren einzelne Zellen meistens direkt mit deren Adresse. Im Abschnitt [Werte und Markierungen](werte.md) wurde bereits erwähnt, dass wir uns eine einzelne Zelle als Bereich vorstellen können. Diese Überlegung können wir auch als Bereichsadresse schreiben. Z.B. die Zelle `D7` deckt den Bereich zwischen der linken oberen Zelle `D7` und der rechten unteren Zelle `D7` ab. Diesen Bereich dürfen wir als `D7:D7` schreiben, ohne dass sich die Funktion einer Formel ändert. 

Einzelne Zellen als Bereich zu formulieren, klingt im ersten Augenblick unsinnig. Diese Technik wird jedoch in Excel häufig dazu verwendet, um Formeln für das [Autoausfüllen](autofill.md) vorzubereiten. 

### Arbeitsblattreferenzen

Bei der Arbeit mit mehreren Arbeitsblättern in einer Arbeitsmappe, hilft Excels Möglichkeit Zellen und Bereiche auf anderen Arbeitsblättern zu adressieren. Um eine Adresse auf einem anderen Arbeitsblatt zu verweisen, stellen Sie dieser Adresse den Tabellennamen mit einem Ausrufezeichen voran. Anstatt die Adresse vom gleichen Tabellenblatt zu liefern, wird Excel nun den Wert aus der Zelle vom anderen Arbeitsblatt übernehmen. 

Wenn Sie eine Formel erstellen, dann können Sie mit der Maus auf ein anderes Arbeitsblatt wechseln und eine Zelle oder einen Bereich mit der Maus auswählen. Excel erstellt dann die richtige Arbeitsblattreferenz für Sie. 

#### Dynamische Feldadressen

Manche Formeln erzeugen mehr als ein Ergebnis und können diese Ergebnisse in einen Bereich schreiben. Diese mehrfachen Ergebnisse werden als *dynamische Felder* (dynamic Arrays) bezeichnet. 

Wenn wir uns auf die Ergebnisse in einem dynamischen Feld beziehen, dann kennen wir die Endzelle natürlich nicht. Entsprechend können wir nicht mit dem Bereichsoperator arbeiten. Stattdessen teilen wir Excel mit einem anderen Operator mit, dass wir ein dynamisches Feld referenzieren möchten. Der Operator ist das Gatter (`#`), der auch als `Feldoperator` bezeichnet wird. Dazu verweisen wir immer auf die linke obere Ecke des dynamischen Felds und hängen den Feldoperator an diese Adresse. 

<p class="alert alert-warning" markdown="1">
Wenn die Adresse nicht der Anfang eines dynamischen Felds ist, dann erhalten wir einen ``#Bezug!``-Fehler. Damit teilt uns Excel mit, dass wir eine Feldfunktion für eine normale Adresse verwenden möchten und unser Bezug ungültig ist.
</p>


<p class="alert alert-info" markdown="1">
Dynamischen Feldadressen lassen sich problemlos mit regulären Bereichsadressen kombinieren. Sie können den Bereich, der durch zwei Felder aufgespannt wird, beispielsweise mit ``A3#:C1#`` adressieren. Dabei müssen Sie beachten, dass die linke obere Ecke dieses Bereichs ausserhalb der Felder liegen kann
</p>

### Benannte Zellen und Bereiche

Im Funktionsbalken wird ganz links die Adresse der aktuellen Zelle angezeigt. Wenn wir in dieses Feld klicken, dann können wir einen Namen für die aktuelle Markierung vergeben. Dieser Name kann nur einmal in einer Arbeitsmappe existieren. Dafür können wir in jeder Zelle in der Arbeitsmappe diesen Namen als Bezug verwenden. Auf diese Weise können wir eine Zelle oder einen Bereich benennen und müssen uns die Adresse für unsere Formeln nicht merken. 

Benannte Zellen helfen uns auf wichtige Zellen in unserer Arbeitsmappe zuzugreifen. Dadurch wird deutlicher, was eine Formel tut. 

<p class="alert alert-info" markdown="1">
Eine benannte Zelle oder ein benannter Bereich sind immer absolut referenziert und werden beim automatischen Ausfüllen nicht verändert.
</p>

<p class="alert alert-info" markdown="1">
Wenn wir in einem benannten Bereich Zellen hinzufügen, dann wird der benannte Bereich um diese Zellen erweitert.
</p>


### Mit Adressen und Namen navigieren

Das Adressfeld im Funktionsbalken erlaubt uns nicht nur die aktuelle Adresse abzulesen und Namen für Zellen und Bereiche festzulegen. Wir können damit auch auf einem Arbeitsblatt navigieren und Bereiche auswählen. Dazu geben wir einfach eine Zelladresse oder eine Bereichsadresse ein. 

Eine Adresse können wir als 

* `A1`-Format,
* `Z1S1`-Format, oder 
* zuvor festgelegten Namen

eingeben. 

<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/direkt_ausw%C3%A4hlen.gif?raw=true"><img alt="direkt_auswählen.gif" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/animation/direkt_ausw%C3%A4hlen.gif?raw=true" width="600" /></a>

Sobald wir die Adresse für eine Zelle oder einen Bereich in das Feld eingegeben haben, passt Excel die Markierung entsprechend an und springt an die entsprechende Stelle in unserer Arbeitsmappe. Wir können dann an dieser Stelle weiterarbeiten. Diese Funktion erleichtert das Arbeiten mit grossen Arbeitsmappen. 

Wenn Sie relativ zur aktuellen Zelle navigieren möchten, können Sie eine relative Adresse im Z1S1-Format in das Adressfeld schreiben. 

### Absolute und relative Adressen

In den meisten Formeln werden Sie die Adressen zu den Werten direkt angeben. Diese Art der Adressierung wird als **absolute Adressierung** bezeichnet. Eine absolute Adresse ist also immer eine Adresse im `A1`-Format, im `Z1S1`-Format oder ein Bereichsname. 

Es gibt aber immer wieder Fälle, in denen wir die Adresse einer Zelle oder eines Bereichs für die Werte beim Erstellen der Formel noch nicht kennen, sondern sich die Adressen erst aus dem Kontext der Daten ergeben. In solchen Fällen müssen wir die Adressen *berechnen*. Das Verwenden von berechneten Adressen wird als **indirekte Adressierung** bezeichnet. 

Excel unterstützt zwei Formen der indirekten Adressierung: 

* Explizite Verweise
* Relative Verweise

#### Exkurs indirekte Adressierung

Jede indirekte Adressierung besteht aus zwei Schritten: 

1. Die Bestimmung der Zieladresse
2. Das Laden des Werts von der Zieladresse

Bei expliziten Verweisen berechnen wir die eine exakte Adresse auf einem Tabellenblatt und holen den Wert von dieser Adresse. Dabei stellt sich für uns die Herausforderung, dass eine Adresse in Formeln im `A1`-Format angegeben werden muss. Leider ist es nicht ganz einfach, aus eine Spaltenzahl den Spaltennamen zu bestimmen. Um aus berechneten Zahlen eine Excel Zellenadresse zu erzeugen, verwenden wir die `ADRESSE`-Funktion. Mit dieser Funktion können wir auch auf Zellen auf anderen Arbeitsblättern verweisen. Den Wert an der berechneten Adresse erhalten wir mit der `INDIREKT()`-Funktion. 

Bei relativen Verweisen berechnen wir eine Adresse relativ zu einer anderen (bekannten) Adresse oder einen Bereich.

Mit der `INDEX`-Funktion können wir den Wert an einer bestimmten Position in einem Bereich zurückgeben lassen. Diese Funktion behandelt einen Bereich auf einem Arbeitsblatt wie eine eigene kleine Tabelle und adressiert in diesem Bereich einzelne Zellen relativ zur links oberen Ecke.

Mit der `BEREICH.VERSCHIEBEN`-Funktion können wir relativ zu einer bekannten Adresse einen beliebigen Bereich auswählen. Die Funktion *verschiebt* die linke obere Ecke ausgehend von der bekannten Adresse um die angegebene Anzahl von Zeilen und Spalten. Ausgehend von diesem Punkt können wir einen Bereich mit einer beliebigen Anzahl von Zeilen und Spalten festlegen. Das Ergebnis der Funktion sind die Werte im festgelegten Bereich. Mit Hilfe der `BEREICH.VERSCHIEBEN`-Funktion können wir gleitende Funktionen, wie z.B. einen gleitenden Mittelwert, berechnen, in dem wir das Ergebnis an Aggregatoren, wie z.B. der `MITTELWERT`-Funktion übergeben. 

Mit der Funktion `XVERGLEICH` können wir die Zeilen oder Spaltenzahl eines Werts bestimmen. Das Ergebnis können wir dann für die `INDEX`-Funktion nutzen. 

Mit der `XVERWEIS`-Funktion können wir zeilen- oder spaltenweise nach einem Wert suchen und dann den analogen Wert in einer Ergebnisbereich ausgeben lassen. Die Funktion `XVERWEIS` arbeitet ähnlich einer Kombination aus `XVERGLEICH` und `INDEX`, ist aber einfacher zu verstehen.
