
<div class="alert alert-success" markdown="1">
Die logischen Operationen und deren Eigenschaften werden in Rautenberg (2008) Kapitel 1 **Aussagenlogik** (Seite 1-13) erklärt. Diese Erläuterungen werden in der Folge als bekannt vorausgesetzt.

**Insbesondere müssen Sie die benannten Regeln auf Seite 9 beherrschen!**
</div> 

<video width="580" height="353" controls="true"><source src="https://youtu.be/xyfeJtY6uQ0">https://youtu.be/xyfeJtY6uQ0</video>

## Wahrheitstafeln 

Die logischen Operationen werten wir mit Hilfe von Wahrheitstafeln aus. Wahrheitstafeln sind ein Hilfsmittel zur Überprüfung von logischen Verknüpfungen und den darin verwendeten Operationen.

Zur Analyse von logischen Ausdrücken werden häufig sog. ***Belegungstafeln*** oder **Wahrheitstafeln** verwendet. Eine solche Tafel ist eine Tabelle, die für alle *Belegungen* eines logischen Ausdrucks die Ergebniswerte zeigt. Als eine Belegung werden die Kombinationen von möglichen Werten für den logischen Ausdruck bezeichnet. 

### Beispiel für eine Wahrheitstafel

Gegeben sei der logische Ausdruck \\( a \land b \\)

Dieser logische Ausdruck hat zwei Variablen a und b. Weil es sich um eine logische Verknüpfung handelt, können diese Variablen nur Wahrheitswerte als Belegung haben. Weil es genau zwei Wahrheitswerte gibt, folgen aus der *Permutation* dieser Werte alle möglichen *Belegungen* für den logischen Ausdruck. Für jede dieser Belegungen können wir nun das Ergebnis des logischen Ausdrucks angeben. Aus der Auflistung der Belegungen und den Ergebnissen erhalten wir eine Belegungstafel.

| a | b |  a \\( \land \\) b | 
| :---: | :---: | :---: | 
| WAHR | WAHR | WAHR | 
| WAHR | FALSCH | FALSCH | 
| FALSCH | WAHR | FALSCH | 
| FALSCH | FALSCH | FALSCH |

Für einfache logische Ausdrücke werden Belegungstafeln häufig als Kreuztabelle dargestellt. Dabei lässt der Autor die Spalten- und Zeilenüberschriften weg. Die oben gezeigte Belegungstafel würde dann wie folgt aussehen: 

| a \ b | WAHR | FALSCH |
| :---: | :---: | :---: |
| **WAHR** | WAHR | FALSCH |
| **FALSCH** | FALSCH | FALSCH |

Diese Darstellung einer Belegungstafel wird in Rautenberg (2008) als **Wertematrix** bezeichnet. 

## Logische Operationen und ihre arithmetische Entsprechung

Die logischen Operationen `Und` sowie `Oder` können wir arithmetisch mit der Multiplikation und der Addition ausdrücken. Dabei gilt: 

<div class="alert alert-success" markdown="1">
**Merke:**

* das logische Und entspricht der Multiplikation 
* das logische Oder entspricht der Addition
</div>

Diese Entsprechungen sind für die Programmierung in Excel wichtig, weil die Funktionen `UND` sowie `ODER` immer den gesamten übergebenen Bereich auswerten. Das ist immer dann hinderlich, wenn wir paarweise Operationen über einen dynamischen Bereich durchführen müssen. Eine solche Verknüpfung haben wir im Video Beispiel "Zählen und Abzählen" bereits gesehen. 

Beachten Sie unbedingt, dass Sie bei der `Oder`-Operation das Ergebnis der Summe als Wahrheitswert interpretieren müssen und nicht als Zahl. Also Werte ungleich 0 müssen als `WAHR` verstanden werden. Aus diesem Grund dürfen Sie mit diesem Ergebnis nicht wie mit einer Zahl weiterrechnen, sondern müssen sich merken, dass es sich um Wahrheitswerte handelt. 

<div class="alert alert-dark" markdown="1">
**Reflexion:** Begründen Sie die arithmetischen Entsprechungen. Beachten Sie dabei das neutrale Element der jeweiligen Operationen sowie die Zahlen, die den  Wahrheitswerten zugewiesen werden.
</div>

## Spickzettel

Die folgende Tabelle stellt die logischen Operationen und die verschiedenen Schreibweisen gegenüber.

| Operation | neutrales Element |  Mathematisch |   R | Excel | arithmetische Operation |
| :--- | :--- | :--- | :--- | ---: | :---: |
| Nicht | - | $$ \lnot $$ |  `!`  | `NICHT()` | 1 - a |
| Und | WAHR |  $$ \land $$ | `&` |   `UND()` |  a * b | 
| Oder  | FALSCH | $$ \lor $$ |  `|` | `ODER()` | a + b |
| Exklusiv-Oder/Antivalenz  |  - | $$ \oplus $$ | `xor() ` | `XODER()` |  (a + b)*(1 - a * b) |

<p class="alert alert-info">In Rautenberg (2008) wird für die Antivalenz das Plus-Symbol verwendet (S. 3). Ich verwende hier das üblichere eingekreiste Plus (\( \oplus \)) für die Antivalenz, um sie von der Addition zu unterscheiden. 
 </p>

<div class="alert alert-dark" markdown="1">
**Reflexion:** Zeigen Sie, dass sich die arithmetische Operation für die Antivalenz aus der konsequenten Anwendung der Regeln ergibt, die in Rautenberg (2008, S. 9) aufgelistet sind.
</div>

## Logische Operationen in Excel und R

Die logischen Operationen werden in Excel und in R unterschiedlich behandelt. In Excel stehen die logischen Operationen ausschliesslich als Funktionen zur Verfügung. In R stehen die logischen Operationen als *binäre* Operatoren zur Verfügung, bzw. als Funktionen mit genau zwei Parametern.

Am Ende dieser Seite findet sich eine Übersicht zu den wichtigsten logischen Operatoren in Excel und R.

Excel und R wandeln numerische Werte automatisch in Wahrheitswerte um, wenn sie in logischen Operationen verwendet werden. Dabei gilt: 

* `FALSCH`/`FALSE` entspricht `0`
* `WAHR`/`TRUE` entspricht *ungleich* `0`

<p class="alert alert-info" markdown="1">**Logisches Nicht**: In Excel können wir der `NICHT`-Funktion einen Bereich übergeben und erhalten die Ergebnisse als dynamisches Feld zurück. In R funktioniert der Nicht-Operator (`!`) genau gleich.</p>

#### Beispiel logisches Nicht mit Excel

Für den folgenden Vektor 

| | A |
| :---: | :---: | 
| **1** | WAHR | 
| **2** | FALSCH | 
| **3** | FALSCH | 
| **4** | WAHR | 
| **5** | WAHR |

ergibt die Formel `=NICHT(A1:A5)` das folgende Ergebnis:

| |
| :---: | 
| FALSCH | 
| WAHR | 
| WAHR |
| FALSCH | 
| FALSCH |
 
#### Beispiel logisches Nicht mit R

Wir wiederholen das Beispiel in R: 

```R
logischer_vektor = c(TRUE, FALSE, FALSE, TRUE, TRUE)

! logischer_vektor   # ergibt c(FALSE, TRUE, TRUE, FALSE, FALSE)
```

### Besonderheiten von Excel

In Excel können Sie an die Funktionen `UND()`, `ODER()` sowie `XODER()` Bereiche übergeben. Die Funktionen werten alle Werte in diesen Bereichen aus und geben den gemeinsamen Wahrheitswert zurück. 

<p class="alert alert-warning" markdown="1">
**Achtung:** Die Logischen Excel-Funktionen `UND()`, `ODER()` sowie `XODER()` sind **Aggregatoren**. Es ist nicht möglich, diese Funktionen für paarweise Verknüpfungen von zwei Vektoren zu verwenden.  
</p>

<p class="alert alert-success" markdown="1">
**Merke:** Um Wahrheitswerte in Vektoren paarweise logisch zu verknüpfen, muss die jeweilige arithmetische Operation verwendet werden. 
</p>

**Beispiel** 

| | A | B |
| :---: | :---: |  :---: | 
| **1** | WAHR | WAHR | 
| **2** | FALSCH | WAHR | 
| **3** | FALSCH | FALSCH | 
| **4** | WAHR |  FALSCH | 
| **5** | WAHR | WAHR | 

Für die beiden Vektoren in `A1:A5` und `B1:B5` ergibt die Operation `=UND(A1:A5; B1:B5)` das Ergebnis `FALSCH`, weil die logische Und-Operation als Ergebnis `FALSCH` ergibt, sobald ein Wert in der Belegung `FALSCH` ist.

Für die paarweise Verknüpfung **muss** die Operation `= A1:A5 * B1:B5` verwendet werden. Diese liefert das Ergebnis: 

| C |
| :---: | 
| 1 | 
| 0 | 
| 0 |
| 0 | 
| 1 |

Solche paarweisen Verknüpfungen sind für logische Ausdrücke in der `FILTER()`-Funktion notwendig. In diesen Fällen übernimmt Excel die Umwandlung in Wahrheitswerte automatisch. 

### Besonderheiten von R

#### Paarweise Verknüpfungen sind Standard

Wenn Sie in R zwei Vektoren mit dem Und- (`&`), dem Oder-Operator (`|`) oder der  Antivalenz (`xor()`) verknüpfen, dann werden die Werte **immer** *paarweise* miteinander verglichen. Ein einzelner Vektor kann nicht an die Funktion des jeweiligen Operators übergeben werden. 

**Beispiel paarweise Verknüpfung**

```R
vektor_a = c(TRUE, FALSE, FALSE, TRUE, TRUE)
vektor_b = c(TRUE,  TRUE, FALSE, FALSE, TRUE)

vektor_a & vektor_b # ergibt c(TRUE, FALSE, FALSE, FALSE, TRUE)
```
#### Logische Aggregationen mit `reduce()`

<p class="alert alert-success" markdown="1">
**Merke**: Um logische Vektoren in **R** genauso wie in Excel zu aggregieren, müssen Sie den Vektor **reduzieren** (engl. *reduce*). Das *Reduzieren* ist eine besondere *Aggregation* über eine Reihe von Werten, bei der jeder Wert gemeinsam mit dem Ergebnis der Vorgängerwerte an eine Funktion übergeben wird.</p>

**Beispiel logische Aggregation**

```
beispielWerte = c(TRUE, TRUE, FALSE, TRUE)

beispielWerte %>% reduce(`&`)   # Ergibt FALSE
beispielWerte %>% reduce(`|`)   # Ergibt TRUE
beispielWerte %>% reduce(`xor`) # Ergibt TRUE
```

Beim Reduzieren beachten wir, dass wir eine Funktion und nicht den Operator übergeben müssen. Deshalb müssen wir den jeweiligen logischen Operator in Akzente gesetzt übergeben. 
