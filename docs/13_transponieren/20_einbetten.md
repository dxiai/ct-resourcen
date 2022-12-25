Vektoren, Stichprobenobjekte und Matrizen haben wir bereits als komplexe Datentypen kennengelernt. Bisher haben wir in diesen Datenstrukturen nur atomare Datentypen abgelegt. In EXCEL erschöpfen sich damit die Möglichkeiten für komplexe Datenstrukturen. R unterliegt dieser Beschränkung für komplexe Datentypen nicht: *R erlaubt auch die Verwendung von komplexen Datentypen als Elemente von Vektoren, Listen und Stichproben.* 

<p class="alert alert-primary" markdown="1">
**Definition:** Werden in R komplexen Datentypen als Werte für Vektoren, wird das als **Einbetten** von Daten bezeichnet. 
</p>

### Komplexe Datentypen als Stichprobenvektoren

Für das strukturierte und systematische Arbeiten ist ein durchgehend einheitlicher Arbeitsprozess wichtig. Die tidyverse-Bibliotheken unterstützeneine solche Systematik. Allerdings stellen diese Bibliotheken nicht alle Funktionen bereit, die für die tägliche Arbeit oder spezielle Analysen benötigt werden. Für diese Aufgaben müssen spezielle Funktionen aus Base-R oder aus anderen Bibliotheken verwendet werden. Diese Funktionen erwarten sehr oft bestimmte komplexe Datentypen als Parameter und können meistens *nicht* mit gruppierten oder transponierten Daten umgehen oder sie erzeugen Ergebnisobjekte, die für R wie Vektoren erscheinen. Damit wir diese Funktionen für komplexe Stichproben verwenden können, müssen wir unsere Stichproben entsprechend vorbereiten und die Ergebnisse abfangen. 

<p class="alert alert-success" markdown="1">
Neue Bibliotheken sind zu den `tidyverse`-Funktionen kompatibel und unterstützen den Arbeitsprozess mit gruppierten Daten. 
</p>

<p class="alert alert-warning" markdown="1">
Im Internet finden sich viele ältere Beiträge, die auf veraltete bzw. nicht mehr unterstützte Bibliotheken verweisen. In den letzten sehchs Jahren hatte R eine sehr schnelle und dynamische Weiterentwicklung. Deshalb sollten Beiträge, die älter als vier Jahre sind, als Hinweis auf eine Lösungsstrategie dienen. Sehr häufig existieren modernere und einfachere Lösungen für die gleiche Problemstellung. 
</p>
