## Datensätze sortieren

<p class="alert alert-success" markdown="1">
**Merke:** Wir sortieren oft Ergebnisse zur Präsentation.  Gehen Sie sparsam mit Sortieroperationen um und sortieren Sie Daten möglichst spät in Ihren Funktionsketten. 
</p>

<p class="alert alert-warning" markdown="1">
Anwendungsbeispiele für die Excel Funktionen finden Sie in der [[fa-download] Beispielarbeitsmappe](https://moodle.zhaw.ch/mod/resource/view.php?id=666403)
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Sortieren** bezeichnen wir die Anordnung von Werten in einem Vektor in der Reihenfolge der Werte. 
</p>

Grundsätzlich werden 2 Sortierreihenfolgen unterschieden. Diese sind für Zahlen, Zeichenketten und Wahrheitswerte definiert: 

1. Aufsteigende Sortierung (engl. ascending)
2. Absteigende Sortierung (engl. descending)

Die Sortierrichtung basiert auf zwei paarweisen Vergleichen: 

- Die aufsteigende Sortierung beginnt mit dem kleinsten Wert des Sortierkriteriums und endet mit dem grössten Wert der Sortierung. Dabei gilt für alle Werte des sortierten Vektors  die folgende Ungleichung: 

$$
v_{Vorgänger} \le v_{Nachfolger}
$$

- Die absteigende Sortierung arbeitet genau entgegengesetzt vom grössten Wert des Sortierkriteriums zum kleinsten Wert. Entsprechend gilt für diese Reihenfolge die Ungleichung: 

$$
v_{Vorgänger} \ge v_{Nachfolger}
$$


Die Basisfunktionen für das Sortieren sind die Funktionen `sort()` (R) und `SORTIEREN()` (Excel). Diese Funktionen bringen einen Vektor in die gewünschte Reihenfolge.  Beide Funktionen können nur nach einem Vektor sortieren. Deshalb eignen sie sich  nur für einfache Sortierungen. 

<div class="alert alert-secondary" markdown="1">
**Excels `SORTIEREN()`-Funktion** kann einen Bereich zeilen- oder spaltenweise sortieren. Diese Funktion hat vier Parameter: 

-  `Matrix` - der zu sortierende Bereich, der *keine* Matrix sein muss.
- `Sortierindex` - die Spalten- oder Zeilennummer, nach der sortiert werden soll. Standardmässig wird die erste Spalte bzw. die erste Zeile angenommen. 
- `Sortierreihenfolge` - legt die Sortierreihenfolge fest. `1`, um aufsteigend und `-1`, um absteigend zu sortieren.
- `nach_Spalte` - Ein Wahrheitswert, ob die Spalten oder die Zeilen sortiert werden sollen. `WAHR` bedeutet, dass die Spalten (horizontal) sortiert werden sollen. `FALSCH` bedeutet, dass die Zeilen (vertikal) sortiert werden sollen. Standardmässig wird zeilenweise sortiert. 
</div>


### Die Funktionen `arrange()` und `SORTIERENNACH()`

Für allgemeine Sortierungen nach mehreren Vektoren stellen Excel und R eigene Funktionen bereit. Zwei dieser Funktionen heben sich wegen ihrer Flexibilität besonders ab. Ihnen liegt der gleiche Denkprozess zu Grunde. Diese beiden Funktionen sind:

- Die R-Funktion `arrange()` und 
- die Excel-Funktion `SORTIERENNACH()`.

Beide Funktionen ermöglichen uns, mehrere Vektoren auf einmal nach **mehreren** gemeinsamen Kriterien zu sortieren. Dazu müssen wir zuerst die Sortierkriterien identifizieren. 

#### Schritt 1: Sortierkriterien festlegen. 

Die Sortierkriterien sind durch die Werte in Vektoren festgelegt, nach denen sortiert werden soll. Wir können dazu mehrere Vektoren festlegen, deren Werte nacheinander zum Sortieren unserer Daten verwendet werden. In R legen wir die Suchkriterien über die entsprechenden *Vektornamen* und in Excel über entsprechende Vektoren oder Bereiche fest. 

- In R müssen die Vektoren mit den Suchkriterien im Stichprobenobjekt vorhanden sein.  
- In Excel können die Vektoren mit den Suchkriterien an einer beliebigen Position in einer Arbeitsmappe liegen. Dabei müssen zwei Bedingungen erfüllt sein: 
  1. Die Vektoren müssen die gleiche Länge haben. 
  2. Die Vektoren müssen die gleiche Orientierung haben. 

Sowohl in Excel als auch in R können mehrere Sortierkriterien festgelegt werden. In beiden Umgebungen werden die Suchkriterien von links nach rechts berücksichtigt. Die jeweils rechtere Bedingung kommt zum Einsatz, wenn die linkere Bedingung mehrmals den gleichen Wert nacheinander sortiert. 

#### Schritt 2: 

Im zweiten Schritt werden die zu sortierenden Vektoren ausgewählt.

In R wird dieser zweite Schritt automatisch auf die vorgegebene Stichprobe angewandt. In Excel können wir zusammenhängende Vektoren als "Matrix" an die `SORTIERENNACH()`-Funktion übergeben. Hängen die Vektoren nicht direkt zusammen, dann müssen mehrere Sortieroperationen mit den gleichen Referenzen auf die Sortierreferenzen durchgeführt werden. 

### Sortierreihenfolge

In Excel wird die Sortierrichtung als `Sortierreihenfolge` bezeichnet und als separater Parameter für das jeweilige Sortierkriterium angegeben. Dabei steht `1` für die aufsteigende Sortierung und `-1` für die absteigende Sortierung. 

In R wird grundsätzlich von einer aufsteigenden Sortierung ausgegangen. Um eine absteigende Sortierung zu erreichen, verwenden wir die Hilfsfunktion `desc()` (für engl. *descending* ~ *absteigend*). 

Das folgende R-Beispiel zeigt, wie die Daten im Stichprobenobjekt, zu erst absteigend nach dem `natel`-Vektor und anschliessend nach dem `geschlecht`-Vektor sortiert werden. 

```
daten %>% 
    arrange(
         desc(natel), # Sortierkriterium absteigend sortiert
         geschlecht   # Sortierkriterium aufsteigend sortiert
    )
```
