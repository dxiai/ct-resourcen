Werte in Tabellen zu schreiben ist zwar ganz praktisch. Besser wäre es aber, wenn wir Zellen und Bereiche hervorheben könnten und so die Lesbarkeit der Daten verbessern. 

Damit wir schnell die Werte in unseren Tabellen hervorheben können, bietet Excel sogenannte `Zellenformatvorlagen`.

<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatvorlagen.png?raw=true"><img alt="Bildschirmfoto 2020-09-17 um 11.17.21.png" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatvorlagen.png?raw=true" width="400" height="178.62595419847" /></a>

Wir sind aber nicht auf diese Vorlagen eingeschränkt, sondern können unsere Tabellen nach unseren Anforderungen anpassen. Excel bietet dazu verschiedene Funktionen zum Formatieren von Tabellen an. Diese Formatierungen finden wir im Dialog `Zellen formatieren …` oder als Optionsschalter im Menuband `Start`.  

<div class="container">
<div class="row">
<div class="col-md-6">
<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatieren_contextmenu.png?raw=true"><img alt="Bildschirmfoto 2020-09-17 um 11.19.35.png" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatieren_contextmenu.png?raw=true" width="400" height="176.17237008872" /></a>
</div>
<div class="col-md-6">
<a href="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatieren_dialog.png?raw=true"><img alt="Bildschirmfoto 2020-09-17 um 11.22.39.png" src="https://github.com/dxiai/actup-excel-basics/raw/main/images/formatieren_dialog.png?raw=true" width="400" height="370.48665620094" /></a>
</div>
</div>
</div>

Wir unterscheiden zwischen den folgenden Formatierungsoptionen. Die Reihenfolge ergibt sich aus der Abfolge im `Zellen formatieren`-Dialog.

* Wertdarstellung
* Textausrichtung und -umbruch
* Schriftart und -grösse
* Zellenrahmen
* Schriftfarbe und Zellenhintergrundfarbe
* Zellenhintergrund
* Zellengrösse
* Zusammengefasste Zellen

Zusätzlich können wir die Registerfarbe unserer Arbeitsblätter anpassen.

### Wertdarstellung anpassen

Excel erlaubt es uns Werte in verschiedenen Formaten darzustellen. Eine Schnellauswahl der verschiedenen Formate wird im Menuband `Start` im Abschnitt `Zahlen` angeboten. Neben Zahlen und Text finden sich Buchhaltungs- und Zeitformatierungen. Mit dieser Auswahl können wir die Werteformatierung für einzelne Zellen oder für Zellbereiche einstellen. Am Häufigsten werden wir mit dieser Funktion das Format von Spalten oder Zellen festlegen. 

Eine Besonderheit ist die Formatierung `Standard`. Diese Formatierung ist die Voreinstellung die Excel dazu veranlasst, den Datentyp und die Formatierung anhand der Eingabe zu erkennen. Falls wir das Format einer Zelle oder eines Bereichs vorher angepasst haben, können wir mit dieser Einstellung die normale Arbeitsweise von Excel wiederherstellen.

> Diese Wertdarstellung geht über die reine Formatierung hinaus, denn durch die gewählte Einstellung legen wir den Datentyp und das Format explizit fest. Gleichzeitig unterdrücken wir die automatische Erkennung von Werten und erzwingt Datentypen und -formate.

#### Detailanpassung der Wertedarstellung 

Wir sind nicht gezwungen, uns mit diesen Formatierungen zufrieden zu geben. Wie immer gibt es in Excel die Möglichkeit, Zahlenformate anzupassen. Dazu wählen wir in der Auswahlliste `Weitere Zahlenformate …` aus oder tippen den Kurzbefehl `C + 1`. Daraufhin öffnet sich ein Dialog mit verschiedenen Zahlenformaten. In der Kategorie `Benutzerdefiniert` gibt es verschiedene Formatierungsoptionen. Im rechten Bereich des Dialogs sehen wir eine Liste. Die Einträge in dieser Liste sehen kryptisch aus, denn die Einträge folgen *Formatierungsregeln*, die in den [Regeln für die Formatierung von Zahlen](https://support.microsoft.com/de-de/office/zahlenformatcodes-5026bbd6-04bc-48cd-bf33-80f18b4eae68) dokumentiert sind. Mit diesen Regeln können wir auch unsere eigenen Zahlenformate definieren. Eine eigene Regel können wir in das Eingabefeld über der Liste eingeben. Diese Formatierungsregel wird dann in der Liste abgespeichert und wir können sie von dort auswählen. 

> Es gibt die Möglichkeit Formatierungsregeln mit Farbabstufungen zu versehen. Das ist eine alte Funktion von Excel und Sie sollten diese Funktion in Ihren Arbeitsmappen nicht mehr verwenden. Stattdessen verwenden Sie die [bedingte Formatierung](https://moodle.zhaw.ch/mod/page/view.php?id=172470). Diese Option bietet Ihnen mehr Freiheiten bei der farblichen Formatierung von Werten als das Zahlenformat. 

> Es gibt keine Möglichkeit den Datentyp auf Wahrheitswerte oder Fehlerwerte einzuschränken. 

#### Nachkommastellen erzwingen

Mit der Wertedarstellung können wir ausserdem Nachkommastellen zum Runden festlegen, ohne die ursprünglichen Werte zu verändern. Dadurch können wir Rundungsfehler vermeiden. Für die Formatierung der Nachkommastellen geben wir die Anzahl der Nachkommastellen von Zahlen an. 

Wir können das über die Formatierung der Dezimalstellen in geeigneten Zahlenformaten im Dialog `Zellen formatieren` erreichen. Schneller geht das jedoch über die Schaltflächen `Dezimalstelle hinzufügen` und `Dezimalstelle löschen` im Menuband `Start`.

> Beachten Sie, dass die Funktionen `Dezimalstelle hinzufügen` und `Dezimalstelle löschen` nur die *Darstellung* der Werte verändern. Im Gegensatz zu den Funktionen `RUNDEN` und `GANZZAHL` wird durch diese Einstellung der tatsächliche Wert nicht verändert.

### Wertausrichtung und -umbruch

Excel gibt für die verschiedenen Datentypen unterschiedliche Positionierungen der Werte innerhalb der Zelle vor. Standardmässig stellt Excel Zahlen rechtsbündig dar, Zeichenketten linksbündig, und Wahrheitswerte sowie Fehler werden zentriert dargestellt. Wenn eine Zeichenkette mehr Platz beansprucht, als zur Verfügung steht wird einfach in die folgenden Zellen geschrieben - oder falls dort bereits Werte stehen abgeschnitten. Dieses Verhalten können wir mit den Funktionen im Abschnitt `Ausrichtung` im Menuband `Start` anpassen. 

Excel unterstützt vier Arten der Ausrichtung: 

1. Die horizontale Ausrichtung mit den Varianten `Linksbündig`, `Zentriert` und `Rechtsbündig`.
2. Die vertikale Ausrichtung mit den Varianten `Oben ausrichten`, `Zentriert ausrichten` (mittig) und `Unten ausrichten`. 
3. Die Textneigung, mit der wir die Inhalte in einer Zelle schräg darstellen können.
4. Den Textumbruch, mit dem wir Zeichenketten automatisch an die Spaltenbreite anpassen können.

Die horizontale Ausrichtung ermöglicht uns, die Standardausrichtung der Werte zu ändern. In der Ausgangseinstellung macht Excel einen sehr kleinen Abstand zu den benachbarten Spalten. Das kann bei links- oder rechtsbündiger Ausrichtung störend oder unübersichtlich wirken. Mit den Optionen `Einzug vergrössern` und `Einzug verkleinern` können wir den Abstand zum Zellenrand vergrössern und die grundsätzliche Ausrichtung der Werte beibehalten. 

> Neben den drei Grundorientierungen, bietet Excel im Dialog `Zellen formatieren …` zusätzlich die Ausrichtungen `Blocksatz` und `Verteilt` für die horizontale Ausrichtung an.  

Die vertikale Ausrichtung ist nicht ganz offensichtlich, denn die initiale Zeilenhöhe entspricht genau der Höhe einer Zeile. Wenn wir die Zeilenhöhe anpassen, dann stellen wir fest, dass alle unsere Werte mittig ausgerichtet sind. Wenn eine Zeile im Verhältnis zur Schriftgrösse sehr hoch ist, dann können wir Werte in der Zeile leicht übersehen. Um das zu verhindern können wir die Werte auch am oberen oder unteren Zeilenrand ausrichten. 

> Neben den drei Grundorientierungen, bietet Excel im Dialog `Zellen formatieren …` zusätzlich die Ausrichtungen `Blocksatz` und `Verteilt` für die vertikale Ausrichtung an. 

Mit der Funktion `Ausrichten` können wir den Inhalt einer Zelle neigen. Dabei sind Neigungen von jeweils bis zu 90° im oder gegen den Uhrzeigersinn möglich. Verändern wir die Neigung der Inhalte wird die Zeilenhöhe automatisch so angepasst, dass der gesamte Inhalt weiterhin in die Zelle passt. Das hat Auswirkungen auf die gesamte Zeile. Verkleinern wir die Zeilenhöhe zeigt Excel eine Folge von `#`-Symbolen, um uns zu signalisieren, dass der Inhalt der Zelle nicht in die aktuelle Grösse passt. Die einzige Ausnahme sind Zeichenketten, die einfach abgeschnitten werden.

> Sie können nur Texte neigen, die zentriert, links- oder rechtsbündig formatiert sind. Für alle anderen Ausrichtungen erlaubt Excel keine Neigung der Inhalte.

Die letzte Formatierungsoption für die Inhaltsausrichtung ist der `Textumbruch`. Der `Textumbruch` steht nur für Zeichenketten zur Verfügung. Mit dieser Formatierung zeigen wir Excel an, dass eine Zeichenkette in die aktuelle Zelle einpasst werden soll, indem am Spaltenrand eine neue Zeile angefangen wird. Dadurch laufen Zeichenketten nicht mehr in benachbarte Zellen und werden auch nicht abgeschnitten. 

Aktivieren wir den Textumbruch für eine Zelle, dann werden überlange Zeichenketten so umgebrochen, dass der ganze Text in der Zelle sichtbar ist. Das hat den Nebeneffekt, dass sich die Zeilengrösse entsprechend ändert. Verkleinern wir die Zeilenhöhe, dann wird die Zeichenkette abgeschnitten, wobei jedoch immer klar ist, welcher Teil der Zeichenkette angezeigt wird. 

### Schrift anpassen

Wir können die Schrift in unseren Zellen nach den folgenden Optionen anpassen: 

1. Der Schriftart
1. Dem Schriftschnitt (z.B. Normal, Fett, Kursiv)
1. Der Schriftgrösse
1. Der Schriftfarbe
1. den Hervorhebungen: Einfach unterstrichen, doppelt unterstrichen, durchgestrichen, sowie hoch- oder tiefgestellt. 

Beachten Sie, dass nicht alle Schriftarten auf allen Rechnern auf denen Excel läuft installiert sind. Wählen Sie eine exotische Schriftart, riskieren Sie, dass Ihre Arbeitsmappe auf einem anderen Computer nicht so aussieht, wie Sie es geplant haben. 

### Zellenhintergrund

Auch den Zellenhintergrund können wir anpassen. Diese Option erlaubt es uns, einzelne Zellen oder Bereiche als Fläche hervorzuheben. Im Excel Jargon wird der Zellenhintergrund als *Füllung* der Zelle bezeichnet. Die Farbe dieser Füllung nennt Microsoft entsprechend *Füllfarbe*. Über das Menuband `Start` können wir nur die Hintergrundfarbe anpassen. Im `Zellen formatieren …`-Dialog gibt es zusätzlich die Möglichkeit auch ein Hintergrundmuster einzurichten. 

> Bei Hintergrundmustern müssen Sie beachten, dass es nicht möglich ist, eigene Hintergrundmuster zu definieren. Die vorgegebenen Muster verringern die Lesbarkeit der Inhalte. Deshalb rate ich davon ab, Muster als Hintergrundfüllung zu verwenden, wenn gleichzeitig Werte dargestellt werden sollen.

Die Standardeinstellung für die Hintergrundfarbe ist `Keine`. Wollen Sie die Hintergrundfarbe auf die Standardeinstellung zurücksetzen, müssen sie in der Farbauswahl `Keine` wählen. 

<p class="alert alert-success" markdown="1"> 
Ein oft verwendeter Trick zur einfachen Visualisierung (z.B. von Management-Cockpits) ist das Verstecken der Inhalte in einer Zelle mit Hintergrund. Dazu wird die gleiche Farbe für den Hintergrund und die Schriftfarbe gewählt. 
</p>

Die Schriftfarbe wird nicht automatisch zur Hintergrundfarbe angepasst. Für dunkle Hintergründe, sollten Sie zur besseren Lesbarkeit eine helle Schriftfarbe wählen.

<p class="alert alert-success" markdown="1"> 
Wenn Sie einen Bereich markiert haben, sehen Sie die richtige Hintergrundfarbe erst, wenn Sie die Markierung aufheben. 
</p>

### Zellenrahmen 

Die Übersichtlichkeit einer Tabelle wird traditionell über einen Tabellenrahmen erreicht. Über diesen Rahmen strukturieren wir die Tabelle visuell. Wozu dient aber der Rahmen, wenn Excel uns sowieso das Tabellenraster zeigt? Das Tabellenraster wird uns nur beim Bearbeiten angezeigt. Wenn wir ein Arbeitsblatt ausdrucken oder ein PDF erzeugen, dann sind nur noch die Werte sichtbar. Wenn wir einen Zellenrahmen formatieren, dann können wir den Rahmen in allen Ansichten und Ausdrucken sehen. 

Der Zellenrahmen hat die folgenden Eigenschaften: 

* Rahmenstärke
* Rahmenfarbe
* Linienart

Ein Rahmen besteht aus einzelnen Liniensegmenten, die eine Zelle umranden. In Excel können wir die Eigenschaften einzelnen Segmente unabhängig voneinander festlegen. Dabei werden die folgenden Positionen unterschieden:

* Oben
* Links
* Unten
* Rechts
* Senkrechter Innenrahmen
* Waagerechter Innenrahmen
* Linksorientierte Diagonale 
* Rechtsorientierte Diagonale

Die beiden Innenrahmen beziehen sich auf Zellbereiche. Wenn wir mehrere Zellen ausgewählt haben, dann können wir den Rahmen für die Umrandung des Bereichs und die Trennlinien zwischen den einzelnen Zellen getrennt festlegen.

Im Menuband `Start` gibt es im Abschnitt `Schriftart` einen Schalter für die Rahmeneinstellungen. Dort finden Sie die gängigsten Rahmenformatierungen. 

<a href="https://github.com/dxiai/actup-excel-basics/blob/main/images/rahmenformatierung.png?raw=true"><img alt="Bildschirmfoto 2020-09-17 um 11.25.51.png" src="https://github.com/dxiai/actup-excel-basics/blob/main/images/rahmenformatierung.png?raw=true" width="329.53" height="400" /></a>

Eine Besonderheit sind die beiden Diagonalen. Die Diagonalen sind eigentlich keine Rahmen im engeren Sinn und können entsprechend nur im Dialog `Zellen formatieren …` festgelegt werden. Die Diagonalen lassen sich aber nach den gleichen Regeln formatieren, wie die anderen Rahmensegmente. Damit können Sie Werte durchstreichen und so Bereiche auf Ihrem Arbeitsblatt markieren, die nicht verwendet werden sollen (z.B. ein Preis vor Skonto).

Durch die Eigenschaften des Zellenrahmens können wir einzelne Inhalte besonders hervorheben. Damit ergänzt der Zellenrahmen die Formatierungen für die Schriftfarbe und Schriftstärke sowie den Zellenhintergrund. 

<p class="alert alert-success" markdown="1"> 
Formatierungstipp: Wenn Sie Werte unterstreichen möchten, verwenden Sie besser die Eigenschaften des Zellenrahmens anstelle der Schriftformatierung. 
</p>

### Zellengrösse formatieren

Wir können in Excel die Spalten- und Zeilengrösse anpassen. Manche Einstellungen, wie der Wertumbruch oder die Wertausrichtung beeinflussen die Zellengrösse automatisch. 

Die Zellengrösse ergibt sich aus der Zeilenhöhe und der Spaltenbreite. Aus dem Aufbau von Excel Arbeitsblättern als Raster folgt, dass die Zeilenhöhe und Spaltenbreite immer für alle Werte einer Zeile bzw. einer Spalte gilt. Die Grösse einzelner Zellen lässt sich nicht unabhängig vom Raster des Arbeitsblatts festlegen! Deshalb müssen wir auf die Anordnung unserer Werte auf einem Arbeitsblatt achten. 

Wir können die Zellengrösse über das `Format`-Menu im Abschnitt `Zellen` im `Start`-Menuband festlegen. Wir können dort zwischen einer automatischen oder expliziten Einstellung wählen. Die automatische Zeilenhöhe oder Spaltenbreite verändert die Grösse der Zeile oder Spalte so, dass die grössten Werte in der entsprechenden Richtung optimal in eine Zelle passen. Bei der expliziten Grösseneinstellung erwartet Excel einen Wert von uns. Wir können so die jeweilige Höhe oder Breite exakt festlegen. 

<a href="https://github.com/dxiai/actup-excel-basics/blob/main/images/zellengroesse.png?raw=true"><img alt="Bildschirmfoto 2020-09-17 um 11.29.08.png" src="https://github.com/dxiai/actup-excel-basics/blob/main/images/zellengroesse.png?raw=true" width="400" height="178.03335250144" /></a>

Mit der Maus geht die Grösseneinstellung intuitiver. Dazu ziehen wir unseren Mauszeiger über die Linie zwischen zwei Zeilen bzw. Spalten im jeweiligen Beschriftungsbereich. Wenn der Mauszeiger sich auf die Höhen- bzw. Breitenanpassung ändert, bewirkt ein Doppelklick die automatische Höhen- oder Breitenanpassung. Bei der Anpassung der Zeilenhöhe mit der Maus, bezieht sich die Veränderung immer auf die Zeile über bzw. die Spalte links neben der Trennlinie. 

![Zeilenhöhe und Spaltenbreite mit der Maus anpassen](https://github.com/dxiai/actup-excel-basics/blob/main/images/animation/zeilen_und_spalten_anpassen.gif?raw=true)

Wenn wir mehrere Spalten oder Zeilen markiert haben und dann die äusserst rechte bzw. die unterste Trennung ziehen, dann erhalten alle markierten Zeilen oder Spalten die gleiche Höhe bzw. Breite. So können wir einfach mehrere Spalten oder Zeilen vereinheitlichen.

<p class="alert  alert-success" markdown="1">
Wenn Sie Werte mit unterschiedlichen Zeilengrössen oder Spaltenbreiten darstellen möchten, dann verteilen Sie diese auf verschiedene Arbeitsblätter. 
</p>

### Zusammengefasste Zellen

Manchmal wollen wir eine Überschrift für mehrere Spalten oder Zeilen einfügen, um Zusammenhänge zwischen den Spalten oder Zeilen hervorzuheben. Dazu markieren wir den Bereich, den wir zusammenfassen wollen. Anschliessend wählen wir im Menuband `Start` im Abschnitt `Ausrichten` die Funktion `Verbinden und zentrieren`. Dadurch wird der Inhalt der Linken oberen Zelle auf den ganzen Bereich ausgedehnt.

Häufig werden Bereiche horizontal oder vertikal zusammengefasst, um zum Beispiel übergreifende Überschriften zu erzeugen. Es können aber beliebige zusammenhängede Bereiche zusammengefasst werden. 

<p class="alert  alert-warning" markdown="1">
Befinden sich weitere Werte in den Zellen des markierten Bereichs, werden diese nach einer Warnung überschrieben! Die Werte sind damit  gelöscht. 
</p>

### Arbeitsblätter farblich hervorheben

Excel bietet uns die Möglichkeit die Registerfarbe eines Arbeitsblatts anzupassen. Dadurch fällt es uns leichter Arbeitsblätter unabhängig von ihrem Namen zu unterscheiden. 

<p class="alert  alert-success" markdown="1">
Geben Sie wichtigen Arbeitsblättern in Ihren Arbeitsmappen eine besondere Registerfarbe.
</p>
