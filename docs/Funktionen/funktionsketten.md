# Funktionsketten in EXCEL und R

Wir können Funktionen aufrufen und das Ergebnis an eine andere Funktion übergeben. So können wir komplexe Funktionen als Kombination einfacherer Funktionen verstehen. Dieses Kombinieren kennen wir aus der Mathematik und haben es im Zusammenhang mit der KEPS-Regel bereits besprochen. Wir kombinieren zwei Funktionen, indem wir das Ergebnis der vorangehenden Funktion als Parameter der nachfolgenden Funktion übergeben. 

Nehmen wir zum Beispiel eine fiktive ein-parametrische Funktion \\( h(x) \\) an, die wir aus der Kombination der Funktionen \\( f(x) \\) und \\( g(x) \\) erhalten, wobei zuerst die Funktion \\( g \\) ausgeführt werden soll. Wir können die Funktion \\( h(x) \\) dann wie folgt definieren: 

$$
h(x) = f(g(x))
$$

Bei dieser Notation müssen wir beachten, dass die Funktion \\( g(x) \\) **vor** der Funktion \\( f(x) \\) ausgeführt werden muss. 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Kombination von Funktionen, bei der Resultate vorangehender Funktionen als Parameter nachfolgender Funktionen verwendet werden, wird als **Funktionskette** bezeichnet. 
</p>

In der *Mathematik* wird als *Verkettungsoperator* das Symbol \\( \circ \\) verwendet. Wir können also die Funktionskette aus dem Beispiel auch wie folgt schreiben: 

$$
h(x) = (g \circ f)(x)
$$

In dieser Notation ist deutlich, welche der Funktionen als erstes aufgerufen wird. 

<p class="alert alert-success" markdown="1">
**Merke:** Um praktische Aufgaben zu lösen, strukturieren wir diese Aufgaben *immer* in einfachere, weniger komplexe Teilaufgaben, die wir anschliessend verketten. Die Funktionsverkettung ist das Leitprinzip der **Problemzerlegung**.
</p>

<div class="alert alert-info" markdown="1">
*Exkurs:* Funktionsketten sind ein Konstrukt des sog. *Lambda-Kalküls*. Dabei handelt es sich um eine mathematische Theorie zur Untersuchung von komplexen Funktionen. 

In dieser Lehrveranstaltung müssen Sie nur das Konzept der *Funktionsverkettung* verstehen und anwenden können. 
</div>

### Chaining: Funktionsketten in EXCEL und R 

<div class="alert alert-primary" markdown="1">
**Konvention:** In der Programmierung wird die Funktionsverkettung als **function chaining** oder kurz als **chaining** bezeichnet. Alle modernen Programmiersprachen unterstützen dieses Konzept. 
</div>

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/BUTjBJuJ8OI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/iiuGhFRh-UQ" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

#### Chaining in EXCEL 

<div class="alert alert-warning" markdown="1">
EXCEL kennt keinen Verkettungsoperator. Die Funktionsverkettung erreichen wir in EXCEL durch die Gliederung von einfacheren Funktionen auf mehrere Zellen auf einem Arbeitsblatt. Die Verkettung erzeugen wir durch den Verweis auf die vorangehende Zelladresse. 
</div>

<p class="alert alert-success" markdown="1">
In EXCEL können wir uns Funktionsketten mit den Befehlen `Spur zum Nachfolger` und `Spur zum Vorgänger` aus dem Menuband `Formeln` anzeigen lassen.
</p>

<a href="https://github.com/dxiai/ct-resourcen/blob/master/bilder/funktionen/excel_chaining_verfolgen.png?raw=true"><img src="https://github.com/dxiai/ct-resourcen/blob/master/bilder/funktionen/excel_chaining_verfolgen.png?raw=true" width="600"></a>

#### Chaining in R

<div class="alert alert-info" markdown="1">
Modernes R stellt den  Operator `%>%` zur einfachen Funktionsverkettung bereit. Dieser Operator ist für Sie erst dann verfügbar, *nachdem* Sie die Bibliothek `tidyverse` mit `library(tidyverse)` in Ihre Arbeitsumgebung eingebunden haben.

Der Operator `%>%` verkettet das Ergebnis einer vorangehenden Operation mit dem *ersten Parameter* der nachfolgenden Operation.
</div>

Sie können sich den Chaining-Operator als Anzeige für den Datenfluss Ihres Programms vorstellen. Ihre Daten fliessen in Pfeilrichtung von einem Funktionsschritt zum nächsten.

<p class="alert alert-success" markdown="1">
Es ist eine gute Praxis, wenn Sie in den ersten Zeilen Ihres R-Codes die von Ihnen benötigten Bibliotheken in Ihre Arbeitsumgebung laden. In einem Notebook sollten alle Aufrufe von `library()` in der ersten Code-Zelle stehen. 
</p>

<p class="alert alert-warning" markdown="1">
In Base R können wir eine Funktionsverkettung ausschliesslich mit Hilfsvariablen oder geschachtelten Funktionsaufrufen realisieren. Dadurch wird der resultierende R-Code schnell unübersichtlich.
</p>

