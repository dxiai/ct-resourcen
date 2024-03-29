Jupyter Notebooks ist eine Web-basierte Entwicklungsumgebung für *reproduzierbares wissenschaftliches Rechnen*. Wir verwenden Jupyter Notebooks in einer *Cloud-Computing-Umgebung*, sodass Sie **keine Software installieren** müssen. Sie brauchen lediglich einen Web-Browser, um auf die Arbeitsumgebung zuzugreifen. 

Die folgenden Webbrowser arbeiten problemlos mit Jupyter Notebooks: 

* Firefox (empfohlen)
* Google Chrome (empfohlen)
* Safari

<p class="alert alert-danger" markdown="1">
<i class="fa fa-lg fa-exclamation-triangle"></i> Die beiden **Windows** Browser *Internet Explorer* und *Edge* werden nicht von Jupyter Notebooks unterstützt.
</p>

#### Durchstarten

In unserer Computational Thinking Cloud haben Sie eine persönliche Arbeitsumgebung, in der Ihre Daten und Lösungen gespeichert sind. 
Wenn Sie Jupyter Notebooks starten, wird Ihr persönlicher Arbeitsbereich angelegt. Das kann ein paar Augenblicke dauern, weil Ihnen ein eigener kleiner Computer für Ihre Arbeit bereitgestellt wird.

<p class="alert alert-warning" markdown="1">
Gelegentlich dauert dieser Prozess etwas länger oder die Verbindung wurde unterbrochen. Sollten Sie nach 2 Minuten keine Oberfläche sehen, dann laden Sie die Seite im Browser neu.
</p>

<a href="https://github.com/dxiai/r-einstieg/raw/master/bilder/Bildschirmfoto%202020-09-22%20um%2023.43.02.png"><img alt="Bildschirmfoto 2020-09-22 um 23.43.02.png" src="https://github.com/dxiai/r-einstieg/raw/master/bilder/Bildschirmfoto%202020-09-22%20um%2023.43.02.png" width="400" height="83.25266214908" /></a>

#### Nach dem Start

Sobald Ihre Arbeitsumgebung bereitsteht, werden Sie in Ihre Arbeitsumgebung weitergeleitet. 

Die Oberfläche besteht aus zwei Hauptbereichen: 

* Dem Werkzeugbereich (mit dem Dateimanager)
* Dem Arbeitsbereich

Bei Start ist im Arbeitsbereich der *Launcher* geöffnet. Mit dem Launcher können wir neue Notebooks erstellen, die Kontexthilfe aufrufen oder andere Werkzeuge öffnen. 

<a href="https://github.com/dxiai/r-einstieg/raw/master/bilder/lab_launcher.png"><img alt="Bildschirmfoto 2020-09-22 um 22.36.47.png" src="https://github.com/dxiai/r-einstieg/raw/master/bilder/lab_launcher.png" width="400" height="262.40875912409" /></a>

<p class="alert alert-info">Falls Ihr Bildschirm zu klein ist, können Sie den Werkzeugbereich ausblenden, indem Sie mit der Maus auf das Icon des  aktiven Bereichs klicken. Ein weiterer Klick öffnet den Werkzeugbereich wieder.</p>

#### Ein neues Notebook erstellen

Im *Launcher* sehen Sie, dass Sie zwei unterschiedliche Jupyter Notebooks erstellen können. In *UI Informatik* und *Daten und Information* arbeiten wir *ausschliesslich* mit `R-Notebooks`.

Wir erstellen ein neues Notebook, indem wir auf das Quadrat mit dem R-Logo klicken. Daraufhin öffnet sich das eigentliche Notebook. 

<p class="alert alert-info" markdown="1">
Ein Notebook besteht aus zwei Teilen: erstens dem Dokument, das alle Inhalte und Ergebnisse speichert. Zweitens dem *Kernel*, der unsere R-Befehle ausführt.
</p>

<p class="alert alert-danger" markdown="1">
Das `Python 3`-Notebook versteht die R-Syntax nicht! Wenn Sie ein `Python 3`-Notebook erstellen und darin R Code ausführen wollen, dann erhalten Sie eine Fehlermeldung! 
</p>

Das Notebook besteht aus einem Eingabe-Bereich und einem kleinen Menubalken. Ganz rechts im Menubalken sehen wir einen kleinen Kreis und die Sprache des *Kernels*. Für R-Notebooks muss dort *immer* `R` stehen. 

Unser neues Notebook hat den Namen `Untitled.ipynb`. Im Werkzeugbereich sehen wir unser neues Notebook auch schon. Der grüne Punkt neben dem Dateinamen zeigt uns an, dass dieses Notebook gerade aktiv ist und Speicher reserviert.

<a href="https://github.com/dxiai/r-einstieg/raw/master/bilder/Bildschirmfoto%202020-09-23%20um%2000.12.08.png"><img alt="Bildschirmfoto 2020-09-23 um 00.12.08.png" src="https://github.com/dxiai/r-einstieg/raw/master/bilder/Bildschirmfoto%202020-09-23%20um%2000.12.08.png" width="400" height="275.96899224806" /></a>

#### Ein Notebook umbenennen

Wir können ein Notebook umbenennen, indem wir mit der rechten Maustaste auf den Namen in Reiter unseres Arbeitsbereichs klicken. Dort finden wir in der Mitte den Punkt `Rename Notebook...`. Wählen wir diesen Punkt aus, erscheint ein kleiner Dialog, mit dessen Hilfe wir die Datei umbenennen können. Im Dateimanager im Werkzeugbereich können wir die Datei auf die gleiche Weise umbenennen. Beim Umbenennen müssen Sie das Notebook nicht schliessen. 

<p class="alert alert-warning" markdown="1">
Sie sollten **nicht** die Dateiendung `.ipynb` überschreiben! Falls Sie versehentlich die Endung gelöscht haben, müssen Sie die Endung wieder anfügen, weil Sie sonst die Datei nicht mit dem Notebook Editor öffnen können!
</p>

#### Ein Notebook schliessen

Mit dem X im Reiter des Arbeitsbereichs können wir ein Notebook schliessen. Beachten Sie, dass nur die Inhalte geschlossen werden. Der zugehörige Kernel wird nicht beendet. Das ist praktisch, wenn Sie ein Fenster schliessen möchten, um beispielsweise die Arbeit dort fortzusetzen, wo Sie aufgehört haben. 

Um sowohl die Inhalte zu schliessen **und** den zugehörigen Kernel zu beenden, müssen Sie aus dem `File`-Menu den Punkt `Close and Shutdown Notebook` wählen. Alternativ können Sie das Tastenkürzel `C + S + q` verwenden.

#### Ein Notebook öffnen

Ein bestehendes Notebook können Sie durch einen Doppelklick auf die Datei im Dateimanager im Werkzeugbereich öffnen. 

#### Code Zellen und Dokumentation

Jupyter Notebooks sind deshalb so populär, weil sie Dokumentation und Programmcode miteinander verbinden. Diese beiden Teile sind in Form von *Zellen* organisiert. Den Typ der Zelle erkennen wir mittig im Menubalken. Wir können den Typ einer Zelle verändern, indem wir an dieser Stelle die Option `Markdown` auswählen, wenn die Zelle Dokumentation enthalten soll. 

Wenn wir ein neues Notebook starten, dann erscheint zuoberst ein graues Rechteck mit zwei eckigen Klammern links davon. Im Menubalken erkennen wir, dass es sich dabei um eine `Code`-Zelle handelt. Diese Zelle können wir befüllen, indem wir auf der Tastatur die `Eingabe`-Taste drücken oder mit der Maus in diese Zellen klicken.

<a href="https://github.com/dxiai/r-einstieg/raw/master/bilder/notebook_content.png" title="Notebook mit Dokumentation, Code und Ergebnissen"><img alt="Bildschirmfoto 2020-09-23 um 01.18.10.png" src="https://github.com/dxiai/r-einstieg/raw/master/bilder/notebook_content.png" width="400" height="293.25153374233" /></a>

Mit dem `Abspiel`-Knopf im Menubalken beenden wir unsere Eingabe und führen diese Zelle aus. Unter der `Code`-Zelle erscheint dann das Ergebnis unseres Codes, falls unser Code Ergebnisse zum Anzeigen erzeugt. 

Bei einer `Markdown`-Zelle funktioniert dieses Prinzip auch. Der wichtige Unterschied zur `Code`-Zelle ist, dass der Text "schön" formatiert wird.

Wir können Zellen nachträglich bearbeiten und noch einmal ausführen lassen. Die Befehle in unseren `Code`-Zellen werden immer in der Reihenfolge des Ausführens interpretiert und nicht in der Position im Dokument. 

Der Code, die Ergebnisse und die Dokumentation werden gemeinsam im Notebook gespeichert. So können wir Analysen erstellen und können das Ergebnis weitergeben, ohne dass die Empfänger den Code selbst ausführen müssten. 

Um neue Zellen in unser Notebook einzufügen, verwenden wir den Plus-Schalter im Menubalken. Mit dem Schere-Schalter können wir einzelnen Zellen wieder Löschen. 

<p class="alert alert-info" markdown="1">
Jupyter bietet eine Markdown-Referenz für die Formatierung von Markdown Zellen. Sie finden die Markdown-Referenz im Hilfe-Menu.
</p>
