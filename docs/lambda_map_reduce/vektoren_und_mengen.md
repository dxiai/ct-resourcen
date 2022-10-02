# Vektoren und Mengen

Bisher haben wir Vektoren als eine komplexe Datenstrukturen betrachtet, in denen Werte nach einem Index sortiert vorliegen. Wir haben diese Sturkturen z.B. zum Zählen transformiert. 

Ein Vektor ist eine Struktur für Werte des gleichen Datentyps, in der jeder Wert einem aufsteigenden Index zugeordnet ist. Entlang dieser Definition haben wir Vektoren als eine Folge von Werten dargestellt und angenommen, dass der Index eine *Sequenz* mit der gleichen Länge des Vektors ist. Diese Eigenschaft kann ausgenutzt werden, um Werte an einer bestimmten Position im Vektor zu finden.

Wir können die gleiche Definition verwenden und uns Vektoren als ungeordnete Datenstrukturen vorzustellen. Ein Vektor besteht dann aus **Wertepaaren** `w` und `i`, wobei `w` dem Wert entspricht und `i` dem jeweiligen Index, wobei jeder Wert in `i` nur einmal vorkommen darf, die Reihenfolge ist aber nicht von Bedeutung. 

Wir könnten mit diesen Überlegungen beispielsweise den Vektor V mit `c(3,2,1,8,4,2,4)` auch wie folgt darstellen: 

| i: | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 
| :---: | :---: |  :---: |  :---: |  :---: |  :---: |  :---: |  :---: | 
| w: | 3 | 2 | 1 | 8 | 4 | 2 | 4 |  

Weil die Reihenfolge dieser Paare nicht mehr wichtig ist, könnte auch die folgende Darstellung verwendet werden. 

| i: | 5 | 2 | 7 | 6 | 1 | 4 | 3 | 
| :---: | :---: |  :---: |  :---: |  :---: |  :---: |  :---: |  :---: | 
| w: | 4 | 2 | 4 | 2 | 3 | 8 | 1 |  

Durch die eindeutige Zuordnung von Werten und Indizes in beiden Darstellungen, können wir die beiden Darstellungen grundsätzlich als gleichwertig erkennen. In diesem Fall wird der Vektor als Menge behandelt. 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine **Menge** (engl. *set*)ist eine Anzahl von unabhängigen Elementen, die eindeutig identifiziert werden können. 
</p>

Das Identifizieren der Elemente erfolgt z.B. mittels Durchnummerieren bzw. Abzählen. Dabei erhält jeder Wert eine eindeutige Nummer, die wir schon als *Index* kennen. 

Betrachten wir einen Vektor als Menge, dann spielt die Reihenfolge der Elemente keine Rolle und die einzelnen Elemente können als **unabhängig** voneinander betrachtet werden. 
