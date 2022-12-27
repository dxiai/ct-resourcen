## Tabellen und Joins

Zwei Stichprobenobjekte können durch direktes Anfügen von Vektoren oder Datensätzen verknüpft werden. Dabei muss jedoch sichergestellt werden, dass beim Anfügen von Datensätzen beide Stichproben die gleichen Vektoren haben. Dazu verwenden wir in R die Funktion `bind_rows()`.

Beim Anfügen von Vektoren müssen beide Stichproben die gleiche Anzahl von Datensätzen haben und die zusammengehörenden Datensätze müssen in der gleichen Reihenfolge vorkommen. Das wird durch die Funktion `bind_cols()` erreicht.  

Beide Techniken sind wenig flexibel und stellen Anforderungen an die zu kombinierenden Daten. Neben diesen beiden einfachen Vorgehensweisen wurde beim Kodieren mit der Verweistechnik mit einer sog. Referenztabelle (engl. *Lookup-Table*) bereits eine weitere Möglichkeit zur inhaltlichen Verknüpfung vorgestellt. 

Dazu sind drei Anforderungen notwendig: 

1. Beide Stichproben haben mindestens einen gemeinsamen Indexvektor.
2. Dieser Indexvektor der Referenztabelle ist ein *Primärindex*.
3. Der Indexvektor im Stichprobenobjekt ist ein *Sekundärindex*.

In EXCEL können dann zwei Tabellen, die diesen Anforderungen genügen, mittels der Funktion `XVERWEIS()` verknüpft werden. Das Ergebnis enthält alle Werte des Stichprobenobjekts mit dem verknüpfenden Sekundärindex. Diese Werte sind mit den Werten der Tabelle mit dem verknüpften Primärindex kombiniert, die über die Werte im Sekundärindex der ersten Tabelle erreichbar sind. Andere Arten der Verknüpfung lassen sich in EXCEL nur über Entscheidungen umsetzen.

In R stehen zum Verknüpfen (engl. *to join*) von zwei Stichprobenobjekten bzw. Tabellen noch mehr Optionen zur Verfügung. Es werden die folgenden Verknüpfungen (engl. *Joins*) unterschieden: 

- Full Join
- Inner Join
- Anti-Join 
- Left Join
- Right Join

Diese Verknüpfungen sind über *Mengenoperationen* definiert, wobei die Index-Vektoren eines Stichprobenobjekts die eine Menge bilden. Die Datensätze der Stichprobenobjekte sind entsprechend die Elemente der Menge. Alle anderen Vektoren der Stichprobe werden als *Attribut* an die Elemente der Indexmenge angehängt.

Diese Verknüpfungen sind binäre Operatoren. D.h. Es können immer nur mit zwei Tabellen  gleichzeitig verknüpft werden.In R stehen diese Operatoren nur als Funktionen bereit. Wie bisher ist der linke Operand dann der erste Parameter und der rechte Operand der zweite Parameter. Die Namen der beiden Operatoren *Left Join* und *Right Join* beziehen sich auf den Operanden auf der jeweiligen Seite des Operators. 

<p class="alert alert-primary" markdown="1">
**Definition:** Die Werte in den Indexvektoren der beiden Stichproben müssen gleich sein, damit die zugehörigen Datensätze verknüpft werden.
</p>

<p class="alert alert-success" markdown="1">
Sollen mehr als zwei Tabellen verknüpft werden, dann müssen die Verknüpfungen nacheinander erfolgen. 
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Für alle Joins (in R) müssen beide Stichproben mindestens einen gemeinsamen Indexvektor haben, wobei die Indexvektoren vom gleichen Datentyp sein müssen.
</p>

Haben diese Indexvektoren den gleichen Namen, dann erkennt R diese Beziehung automatisch. 

<p class="alert alert-warning" markdown="1">
Das *Kodieren* mit Hilfe einer Referenztabelle wird als **Left Join** bezeichnet, weil das Stichprobenobjekt mit den zu kodierenden Werten per *Konvention* *links* vom Verknüpfungsoperator geschrieben wird.
</p>

<p class="alert alert-success" markdown="1">
Es ist nicht zwingende, dass in den beiden Indexvektoren die gleichen Werte vorkommen.
</p>

<p class="alert alert-danger" markdown="1">
**Achtung!** Falls die gleichen Werte in den Indexvektoren mehrmals vorkommen, enthält das Ergebnis *alle Permutationen* der vorkommenden Datensätze.
</p>

### Beispieldaten

Zu einfachen Illustration der Verknüpfungsarten werden die beiden Stichproben verwendet: 

```R
library(tidyverse)

Stichprobe_A = tribble(
    ~x, ~id, 
    "Ah", 1,
    "Be", 2,
    "Ce", 2,
    "De", 5,
    "Eh", 5, 
    "Ef", 6, 
    "Ge", 6, 
    "Ha", 6, 
    "Ih", 7,
    "Jott", 7
)

Stichprbe_B = tribble(
    ~y, ~id,
    "Kah", 1,
    "Ell", 1,
    "Emm", 3,
    "Enn", 3,
    "Peh", 6,
    "Quh", 6,
)
```

### Inner Join

<p class="alert alert-primary" markdown="1">
**Definition:** Der **inner Join** verknüpft zwei Stichproben über die gemeinsamen Indizes, so dass das Ergebnis nur Datensätze enthält, die einen gültigen Eintrag in beiden Stichproben haben.
</p>

Der inner Join entspricht der Schnittmenge der beiden Indexmengen. 

![Inner Join](https://github.com/dxiai/ct-resourcen/raw/main/bilder/joins/inner_join.svg)

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Natural Join** bezeichnet einen inner Join, bei dem die Indexvektoren der beiden Stichproben gleich benannt sind.
</p>

```r
Stichprobe_A %>% 
    inner_join(Stichprobe_B)
```

|x  | id|y   |
|:--|--:|:---|
|Ah |  1|Kah |
|Ah |  1|Ell |
|Ef |  6|Peh |
|Ef |  6|Quh |
|Ge |  6|Peh |
|Ge |  6|Quh |
|Ha |  6|Peh |
|Ha |  6|Quh |

### Full Join

<p class="alert alert-primary" markdown="1">
**Definition:** Der **full Join** verknüpft zwei Stichproben über die gemeinsamen Indizes, so dass das Ergebnis alle vorkommenden Verknüpfungen zwischen den beiden Stichproben enthält. Dazu gehören auch die Verknüpfungen, bei denen ein Indexwert nur in einer der beiden Stichproben vorkommt. 
</p>

Der Full Join entspricht der Vereinigung der beiden Indexmengen. 

![Full Join](https://github.com/dxiai/ct-resourcen/raw/main/bilder/joins/full_join.svg)

```r
Stichprobe_A %>% 
    full_join(Stichprobe_B)
```

|x    | id|y   |
|:----|--:|:---|
|Ah   |  1|Kah |
|Ah   |  1|Ell |
|Be   |  2|`NA`  |
|Ce   |  2|`NA`  |
|De   |  5|`NA`  |
|Eh   |  5|`NA`  |
|Ef   |  6|Peh |
|Ef   |  6|Quh |
|Ge   |  6|Peh |
|Ge   |  6|Quh |
|Ha   |  6|Peh |
|Ha   |  6|Quh |
|Ih   |  7|`NA`  |
|Jott |  7|`NA`  |
|`NA`   |  3|Emm |
|`NA`   |  3|Enn |

### Left und Right Join

Der left und der right Join sind im Vergleich zum full Join verkürzte Verknüpfungen. Bei diesen Verknüpfungen werden alle Datensätze einer Stichprobe übernommen und nur die Datensätze der jeweils anderen Stichprobe verknüpft, für die es die Indexvektoren eine gleiche Werte haben. 

In ihrer Funktion sind diese beiden Verknüpfungen identisch. Der Name der jeweiligen Verknüpfung bezieht sich auf die Position der Stichprobel, deren Datensätze vollständig übernommen werden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **left bzw. right Join** verknüpft zwei Stichproben, so dass alle Datensätze der linken bzw. rechten Stichprobe mit den zugehörigen Datensätzen der jeweils anderen Stichprobe vorkommen. Falls Datensätze keine Entsprechung im jeweils anderen Indexvektor haben, dann werden diese Werte durch den *leeren Wert* (`NA`) aufgefüllt.
</p>

![Left Join](https://github.com/dxiai/ct-resourcen/raw/main/bilder/joins/left_join.svg)

```r
Stichprobe_A %>% 
    left_join(Stichprobe_B)
```

|x    | id|y   |
|:----|--:|:---|
|Ah   |  1|Kah |
|Ah   |  1|Ell |
|Be   |  2|`NA`  |
|Ce   |  2|`NA`  |
|De   |  5|`NA`  |
|Eh   |  5|`NA`  |
|Ef   |  6|Peh |
|Ef   |  6|Quh |
|Ge   |  6|Peh |
|Ge   |  6|Quh |
|Ha   |  6|Peh |
|Ha   |  6|Quh |
|Ih   |  7|`NA`  |
|Jott |  7|`NA`  |


![Right Join](https://github.com/dxiai/ct-resourcen/raw/main/bilder/joins/right_join.svg)

```r
Stichprobe_A %>% 
    right_join(Stichprobe_B)
```

|x  | id|y   |
|:--|--:|:---|
|Ah |  1|Kah |
|Ah |  1|Ell |
|Ef |  6|Peh |
|Ef |  6|Quh |
|Ge |  6|Peh |
|Ge |  6|Quh |
|Ha |  6|Peh |
|Ha |  6|Quh |
|`NA` |  3|Emm |
|`NA` |  3|Enn |

### Anti-Join

Eine besondere Verknüpfung ist der *Anti-Join*. 

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Anti-Join** wird die Verknüpfung bezeichnet, bei der die Schnittmenge der beiden Stichproben aus der linken Stichprobe entfernt werden. 
</p>

Diese Verknüpfung ist eine effiziente Methode des systematischen Löschens.

![Anti-Join](https://github.com/dxiai/ct-resourcen/raw/main/bilder/joins/antijoin.svg)

```r
Stichprobe_A %>% 
    anti_join(Stichprobe_B)
```

|x    | id|
|:----|--:|
|Be   |  2|
|Ce   |  2|
|De   |  5|
|Eh   |  5|
|Ih   |  7|
|Jott |  7|
