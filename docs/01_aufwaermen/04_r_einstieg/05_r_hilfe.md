R-Funktionen sind in der Regel gut dokumentiert. Neben der eigentlichen Funktionsbeschreibung finden sich viele ausführliche Problemlösungsstrategien in Form sog. *Vignettes*. Zusätzlich finden sich für die `tidyverse`-Module sog. *Cheat Sheets*. Die einen schnellen Überblick über die Kernfunktionen erlauben. 

<p class="alert alert-success" markdown="1">
<i class="fa fa-lg fa-lightbulb-o"></i> Nutzen Sie die Dokumentation regelmässig, um die richtigen Funktionen für Ihre Problemstellungen auszusuchen. Die verschiedenen Teile der R-Dokumentation helfen Ihnen die Konzepte und Techniken für die Arbeit mit R zu vertiefen.</p>

#### help(funktionsname)

Die `help()`-Funktion ist der erste Anlaufpunkt, um mehr über eine Funktion zu erfahren. 

R-Funktionen sind in der Regel sehr ausführlich dokumentiert. Falls Sie Details über die Arbeitsweise einer Funktion erfahren möchten, können Sie die Dokumentation einer Funktion mit der `help()`-Funktion abrufen. Dazu rufen Sie diese Funktion wie jede andere R-Funktion auf. 

Die `help()`-Funktion ist Teil von `Base R` und ist in jeder Umgebung verfügbar. 

Die Funktion erwartet den gewünschten Funktionsnamen. `help()` kann der Funktionsname direkt oder als Zeichenkette als Parameter übergeben werden. D.h. die beiden folgenden Operationen haben den gleichen Effekt und zeigen die Dokumentation der Funktion `read.csv` an.

```r
> help(read.csv)
> help("read.csv")
```

Jede Funktionsdokumentation besteht aus den folgenden Teilen:

1. Beispielen für den Aufruf der Funktion
2. Beschreibung aller Funktionsparameter
3. Einer Detaillierten Funktionsbeschreibung
4. Beispielen

Die Beispiele zeigen typische Aufrufe der jeweiligen Funktion und finden sich **immer** *am Ende* der Dokumentation. Es lohnt sich häufig zuerst die Beispiele anzusehen und danach die Funktionsdetails zu lesen. 

In Jupyter Notebooks wird die Hilfe direkt unter dem Aufruf der help() Funktion angezeigt. Das ist nicht immer praktisch. Deshalb wird empfohlen, die *Jupyter Notebook Inline Hilfe* zu verwenden. 

<a href="https://github.com/dxiai/r-einstieg/blob/main/bilder/help_functions_ipnb.png?raw=true"  title="Hilfe Funktion in Jupyter  Notebooks"><img alt="help_functions_ipnb.png" src="https://github.com/dxiai/r-einstieg/blob/main/bilder/help_functions_ipnb.png?raw=true" width="400" height="230.55934515689" /></a>

<p class="alert alert-warning" markdown="1">
<i class="fa fa-lg fa-exclamation-triangle"></i> In R-Studio wird die Dokumentation immer separat angezeigt! Beim Aufruf der `help()`-Funktion wird automatisch der Reiter `Help` aktiviert.
</p>

<a href="https://github.com/dxiai/r-einstieg/blob/main/bilder/help_function_rstudio.png?raw=true"  title="Hilfe Funktion in R-Studio"><img alt="help_function_rstudio.png" src="https://github.com/dxiai/r-einstieg/blob/main/bilder/help_function_rstudio.png?raw=true" width="400" height="300.91743119266" /></a>

#### Jupyter Inline Hilfe

Jupyter Notebooks verfügen über die Option einer sogenannten *inline Hilfe*. Diese Funktion ruft die Dokumentation für die Funktion auf, die Sie gerade mit dem Cursor ausgewählt haben. 

<a href="https://github.com/dxiai/r-einstieg/blob/main/bilder/JS_context_hilfe.png?raw=true" title="Jupyter Inline Hilfe"><img alt="Bildschirmfoto 2020-09-21 um 21.35.08.png" src="https://github.com/dxiai/r-einstieg/blob/main/bilder/JS_context_hilfe.png?raw=true" width="400" height="193.4868943606" /></a>

Die Inline Hilfe kann über das `Help`-Menu von Jupyter Notebooks gestartet werden. Damit wir die Hilfe immer im Blick behalten, müssen wir den Reiter mit der inline Hilfe neben unser Notebook verschieben. 

<a href="https://github.com/dxiai/r-einstieg/blob/main/bilder/JL_inline_hilfe_positionieren.gif?raw=true"><img src="https://github.com/dxiai/r-einstieg/blob/main/bilder/JL_inline_hilfe_positionieren.gif?raw=true" width="800" title="Jupyter  Inline Hilfe verschieben"></a>

#### Vignettes

Viele R-Bibliotheken haben komplexe Anwendungen. Diese Anwendungen werden in sogenannten *Vignettes* beschrieben. 

Sie können sich die verfügbaren Vignettes für eine Bibliothek mit der Operation `vignette(package = bibliotheksname)` anzeigen lassen. Wenn Sie z.B. alle Vignettes für die dplyr Bibliothek anzeigen lassen möchten, dann geben Sie `vignette(package = "dplyr")` ein. Das Ergebnis ist die Liste der verfügbaren Vignettes für diese Bibliothek. 

<a href="https://github.com/dxiai/r-einstieg/blob/main/bilder/vignettes_liste_dplyr.png?raw=true"><img alt="vignettes_liste_dplyr.png" src="https://github.com/dxiai/r-einstieg/blob/main/bilder/vignettes_liste_dplyr.png?raw=true" width="400" height="314.37308868502" /></a>

Wenn Sie das gesuchte Thema gefunden haben, dann können Sie sich die Vignette mit dem folgenden Befehl anzeigen lassen: `vignette(thema, package = bibliotheksname)`
 
<p class="alert alert-warning" markdown="1">
<i class="fa fa-lg fa-exclamation-triangle"></i> In **Jupyter Notebooks** können ``vignettes`` nicht direkt angezeigt werden. Hier hilft Ihnen Google weiter: Geben Sie als Suche ``vignette bibliotheksname thema`` ein und der erste Treffer verweist normalerweise auf die entsprechende Vignette. Dabei ist ``thema`` eine Thema, das in der Spalte ``Item`` der Ausgabe der ``vignette()``-Funktion angezeigt wird. z.B. ``vignette dplyr programming``
</p>

#### Cheat Sheets

Die *tidyverse*-Bibliotheken bieten zusätzlich *Schummelzettel* für die wichtigsten Funktionen und Techniken für eine Bibliothek auf zwei Seiten. Diese Schummelzettel werden auch als *Cheat Sheets* bezeichnet. Sie können diese Cheat Sheets doppelseitig ausdrucken und als Schnellreferenz verwenden.

#### Hilfreiche Webseiten und Literatur

Weiterführende Literatur zu verschiedenen Arbeitstechniken mit R finden Sie auf verschiedenen Web-Seiten und Büchern.

Gute allg. Referenzwerke sind: 

* G. Grolemund and H. Wickham (2017). R for Data Science. O'Reilly ([Online Version](https://r4ds.had.co.nz/)). **Deckt die wichtigsten Funktionen von TidyR ab**
* J. Albert and M. Rizzo (2012). R by Example, Use R! Springer.
* J. Long and P. Teetor (2019). R Cookbook. O'Reilly ([Online Version](https://rc2e.com/)).
