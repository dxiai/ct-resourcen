# Der Aufbau von EXCEL Arbeitsmappen

In EXCEL werden Daten in sogenannten *Arbeitsmappen* organisiert. Es ist also möglich, mehr als eine Tabelle und darauf basierende Operationen in einer Datei zu speichern. Damit wir spezielle Daten aus Arbeitsmappen extrahieren können, müssen wir die Struktur einer Arbeitsmappe kennen.

Eine EXCEL Arbeitsmappe ist eine Datei, die üblicherweise auf `.xlsx` endet. Die Dateiendung signalisiert uns *meistens* die interne Organisation einer Datei. *Interne Organisation einer Datei* bedeutet, in welcher Folge die Daten in einer Datei auf der Festplatte abgelegt sind.

<p class="alert alert-primary" markdown="1">
**Definition:** Die interne Organisation einer Datei wird als **Dateiformat** bezeichnet.
</p> 

Nur das Dateiformat von `.xlsx`-Dateien unterstützt alle Funktionen von EXCEL.

Das Dateiformat wählen wir in EXCEL im `Speichern-Unter`-Dialog. Dieser Dialog erscheint in der Regel, wenn wir eine neue Arbeitsmappe das erste Mal speichern. Wenn wir im Start-Dialog von EXCEL einfach eine neue Arbeitsmappe erstellen, dann erzeugt EXCEL *automatisch* eine Arbeitsmappe im EXCEL-Format. 

<p class="alert alert-info" markdown="1">
**Merke:** EXCEL-Dateien sind Dateien mit der Endung `.xlsx` und werden als **EXCEL Arbeitsmappen** bezeichnet. 
</p>

EXCEL Arbeitsmappen haben vier zentrale Strukturelemente: 

1. Arbeitsblätter 
2. Adressbereiche
3. Zellenwerte 
4. Zellenformeln

Jedes Arbeitsblatt einer Arbeitsmappe hat einen *eindeutigen* Namen. 

Die Adressbereiche sind in Zeilen und Spalten gegliedert. Wir finden Daten daher immer auf einem bestimmten Arbeitsblatt in einem bestimmten Adressbereich. Die konkrete Position der Daten in der Arbeitsmappe legen die Autoren willkürlich fest. 

Jede Zelle eines Arbeitsblatts hat *immer* zwei *gleichzeitige* Zustände, die immer in einer EXCEL Arbeitsmappe gespeichert werden: 

1. Jede Zelle hat einen Wert. 
2. Jede Zelle hat eine Operation.

Aus diesen Strukturelementen ergeben sich zwei Konsequenzen: 

1. Ein Arbeitsblatt kann mehr als eine Tabelle mit Daten enthalten.
2. Die Daten müssen nicht am Anfang (d.h. in der ersten Zeile und ersten Spalte) eines Arbeitsblatts beginnen. 

Um mit den Daten in EXCEL Arbeitsmappen arbeiten zu können, müssen wir zuerst wissen, auf welchem Arbeitsblatt und in welchem Adressbereich die Daten stehen.

<p class="alert alert-info" markdown="1">
**Merke:** Tabellen sind **kein** Strukturelement von EXCEL Arbeitsmappen!
</p>

<div class="alert alert-warning" markdown="1">
**ACHTUNG:** Wenn Sie EXCEL Arbeitsmappen mit EXCEL öffnen, berechnet EXCEL alle Operationen auf *allen* Arbeitsblättern neu. Damit werden die Werte in der Arbeitsmappe verändert. 

Es kommt also vor, dass sich eine Arbeitsmappe ändert, ohne dass Sie eine Interaktion vorgenommen haben. In diesen Fällen fragt EXCEL meistens beim Schliessen einer Arbeitsmappe, ob Sie Ihre Änderungen speichern möchten. 

Wenn Sie eine EXCEL Arbeitsmappe in R (oder in einer anderen Programmiersprache) öffnen, dann wird nur die Arbeitsmappe geöffnet ***ohne*** die Operationen neu zu berechnen. 
</div>

### EXCEL Arbeitsmappen mit R öffnen

Mit den Funktionen der `readxl`-Bibliothek können wir EXCEL Arbeitsmappen nach R importieren. Dabei sind zwei Funktionen von besonderer Bedeutung:

* `excel_sheets(dateiname)` und 
* `read_excel(dateiname, sheet)`

Mit der Funktion `excel_sheets()` können die vorhandenen Arbeitsblätter erkannt werden. Das Ergebnis dieser Funktion ist die Liste der Arbeitsblattnamen in einer Arbeitsmappe. 

Die Funktion `read_excel()` erlaubt es uns einzelne Arbeitsblätter zu importieren. Wenn kein Arbeitsblattname für den Parameter `sheet` übergeben wird, dann nimmt die Funktion das aktive Arbeitsblatt in der Arbeitsmappe. 

Mit den `readxl`-Funktionen können wir keine Formeln aus den Zellen auslesen. 

### Grenzen von EXCEL Arbeitsmappen

EXCEL Arbeitsmappen sind für den Datenaustausch und das Datenmanagement nur für kleine Datenmengen geeignet. Schon bei Arbeitsmappen mit mittelgrossen Stichproben von wenigen tausend Datensätzen und wenigen Operationen erreicht man die Grenzen des mit EXCEL Machbaren. 

Laut [EXCEL Dokumentation](https://support.microsoft.com/de-de/office/spezifikationen-und-beschränkungen-in-excel-1672b34d-7043-467e-8e27-269d656771c3) kann ein Arbeitsblatt 1.048.576 Zeilen und 16.384 Spalten enthalten. Das entspricht theoretisch 17.179.869.184 Zellen. Diese Anzahl bezieht sich **nicht** auf die Anzahl der Werte in den Zellen. In der Praxis können oft deutlich weniger Werte in den Zellen auf einem Arbeitsblatt gespeichert und berechnet werden.

<div class="alert alert-danger" markdown="1">
**Verlassen Sie sich nicht darauf, dass Sie nur wenige Daten in einer Arbeitsmappe haben.** Wenn Sie Daten aus mehreren Arbeitsmappen zusammenführen, kann es schnell passieren, dass die tatsächlichen Grenzen von EXCEL überschritten werden. In solchen Fällen ignoriert EXCEL die überzähligen Daten ohne Warnung oder Fehlermeldung, obwohl die Daten in der Arbeitsmappe angezeigt werden. 
</div>

Solche Probleme passieren auch grossen Organisationen. Der Englische Gesundheitsdienst (Public Health England) hat am Beginn der COVID-19 Pandemie mehrere Tage falsche Daten zum Infektionsgeschehen berichtet, weil die Daten von den Krankenhäusern in einer EXCEL Arbeitsmappe ausgewertet wurden ([Daily Mail, 5.10.2020](https://www.dailymail.co.uk/news/article-8805697/Furious-blame-game-16-000-Covid-cases-missed-Excel-glitch.html)). Das Problem wurde einem alten EXCEL Arbeitsmappenformat zugeschrieben, so dass nur ein Teil der Werte in die Auswertung eingeflossen sind ([BBC, 5.10.2020](https://www.bbc.com/news/uk-54422505)). Ähnliche Probleme treten aber auch mit der aktuellen Version von Excel immer wieder auf.

### Was sind kleine Datenmengen?

"Kleine" Datenmengen definieren wir am Besten über konkrete Stichproben. 

Die Erhebung der [polizeilich erfassten Verkehrsunfälle in der Stadt Zürich](https://data.stadt-zuerich.ch/dataset/sid_dav_strassenverkehrsunfallorte) umfasst seit 2011 48021 Datensätze. Diese Stichprobe kann mit einer aktuellen Version von EXCEL noch bearbeitet werden. *Diese Stichprobe würden wir noch als kleine Stichprobe bezeichnen.*

Die Stadt Zürich führt seit 2009 an 39 Standorten eine automatische [Fussgänger und Velozählung](https://data.stadt-zuerich.ch/dataset/ted_taz_verkehrszaehlungen_werte_fussgaenger_velo) durch. Die Werte werden im 15 Minuten Rhythmus erhoben. Die jährlichen Stichproben dieser Zählung enthalten bereits mehr als 1.2 Millionen Datensätze. Diese Stichprobe ist für eine Auswertung mit EXCEL bereits zu gross.

Im Verhältnis zu den [stündlich erhobenen Zählungen des motorisierten Verkehrs an den 97 Zählstellen](https://data.stadt-zuerich.ch/dataset/sid_dav_verkehrszaehlung_miv_od2031) mit jährlich 1.5 Millionen Datensätzen ist die Velozählung zwar detaillierter aber weniger umfangreich.

Beide Stichproben sind im Verhältnis zu den [ÖV-Daten der SBB](https://opentransportdata.swiss/de/dataset/istdaten) klein. Diese täglich erfasste Stichprobe umfasst rund 2.2 Millionen Datensätze. Die jährliche Stichprobe dieser Daten fällt bereits in den Bereich des Big-Data, d.h. sehr umfangreicher Daten.

