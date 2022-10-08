# Abbilden bzw. Mapping

<p class="alert alert-primary" markdown="1">
Der erste Schritt von Map-Reduce ist das **Abbilden**. Dieser Schritt fasst alle Operationen zusammen, die unabhängig voneinander mit allen Werte eines Vektors durchgeführt werden. 
</p>

<p class="alert alert-primary" markdown="1">
Diese Operationen werden als **unabhängige Operationen** bezeichet, weil sie nur einen einzelnen Wert betreffen und keinen Einfluss auf andere Werte des Vektors haben. 
</p>

Diese unabhängigen Operationen werden in einer **Abbildungsfunktion** festgelegt. Die Abbildungsfunktion bearbeitet immer nur einen einzelnen Wert. Die Abbildungsfunktion bildet mit Hilfe von Operationen einen Wert auf einen Ergebniswert ab.  

<p class="alert alert-success" markdown="1">
Der ursprüngliche Wert und der Ergebniswert der Abbildungsfunktion müssen nicht zwingend vom gleichen Datentyp sein.
</p>

Die Abbildungsfunktion wird im ersten Arbeitsschritt für jeden Wert des Vektors ausgeführt. Diese Aufgabe übernimmt eine *Mapping*-Funktion für alle Wert-Index-Paare eines Vektors. Das Ergebnis der *Mapping*-Funktion ist immer ein Vektor mit der gleichen Länge wie der ursprüngliche Eingabevektor. Der Ergebnisvektor enthält an den jeweiligen Indizes des Ursprungsvektors die Ergebnisse der Abbildungsfunktion. 

<p class="alert alert-danger" markdown="1">
**R** Weil der Datentyp des Abbildungsergebnisses unbekannt ist, erzeugt die **Mapping**-Funktion `map()` das Ergebnis als Liste und nicht als Vektor. Die `reduce()`-Funktion berücksichtigt das. Für andere Funktionen muss diese Liste ggf. in einen Vektor umgeformt werden. 
</p>

Das folgende Beipiel veranschaulicht diesen Schritt mit der Abbildungsfunktion, die einen Wert verdoppelt. 

```R
library(tidyverse)

1:10 %>% map(function (Wert) 2 * Wert)
```

> 2, 4, 6, 8, 10, 12, 14, 16, 18, 20

<p class="alert alert-warning" markdown="1">
Die Arbeitsweise einer *Mapping*-Funktion führt zu den gleichen Ergebnissen wie Algorithmen mit Schleifen. Weil die Funktion alle Werte unabhängig voneinsander auf ihre Ergebniswerte abbildet, muss beim Mapping anders als bei Schleifen die Vektorreihenfolge der Werte nicht zwingend eingehalten werden. Das erlaubt die Verteilung der Operationen auf verschiedene Prozessoren oder auch Computer. Dadurch werden Map-Reduce-Algorithmen oft (sehr viel) schneller ausgeführt, als Implementierungen mit Schleifen, die zum gleichen Ergebnis führen. 
</p>

### Mapping mit Index

Oft ist der Index für eine Abbildungsfunktion ohne Bedeutung. Weil ein Vektor als Menge von Wert-Index-Tupeln betrachtet werden kann, können wir den Index auch nutzen, falls dieser für einen Algorithmus notwendig ist. Für diesen Fall stellt R eine spezielle *Mapping*-Funktion bereit: Die Funktion `imap()`. 

<p class="alert alert-warning" markdown="1">
EXCEL erlaubt *kein* Mapping mit Index. 
</p>

Das folgende Beispiel zeigt eine einfache Abbildungsfunktion, die einen Wert mit dessen Index potenziert.

```R
seq(length = 10, from = 2, by = .5) %>%
    imap(function (Wert, Index) Wert ^ (1/Index))
```

> 2, 1.58113883008419, 1.44224957030741, 1.36778239986738, 1.31950791077289, 1.28489829342533, 1.25849895064183, 1.23750036638556, 1.22028493587281, 1.20584457999404


## Besonderheiten von MAP in EXCEL

EXCELs `MAP()` Funktion lässt nur Lambda-Funktionen als Abbildungsfunktion zu. Es ist damit nicht möglich, eine der regulären EXCEL-Funktionen direkt als Abbildungsfunktion zu verwenden. Damit wir die regulären EXCEL-Funktionen als Abbildungsfunktionen nutzen können, müssen wir sie mit einem `LAMBDA()` Aufruf kapseln. 

Auf diese Weise können wir Funktionen vektorisieren, die keine dynamischen Felder zulassen. 

**Beispiel: Vektorisierte QUOTIENT()-Funktion** 

```EXCEL
=MAP(D1#;LAMBDA(wert; QUOTIENT(wert; 3)))
```

An diesem Beispiel sehen wir, die Vorgehensweise, damit wir die regulären Funktionen als Abbildungsfunktionen verwenden können.

### EXCELs dynamische Felder und MAP

Viele Funktionen erzeugen dynamische Felder als Ergebnis. Die `MAP()` darf aber nur ***einzelne Werte*** als Ergebnis haben. Deshalb **müssen** alle Felder noch in der Abbildungsfunktion auf einen einzelnen Wert reduziert werden.

Im folgenden Beispiel werden Zeichenketten in einzelne Buchstaben zerlegt.

```EXCEL
=MAP(A1:A19;
     LAMBDA(str;
            TEXTVERKETTEN(",";;
                          TEIL(str;SEQUENZ(LÄNGE(str));1)
                         )
           )
    )
```

Die Teiloperation `TEIL(str;SEQUENZ(LÄNGE(str));1)` trennt ein Wort in einzelne Buchstaben. Weil die Buchstaben zusammen aber keine einzelnen Werte sondern ein Feld sind, können sie kein Ergebnis einer mit `LAMBDA()` gebildeten Abbildungsfunktion sein. Deshalb müssen diese Zwischenergebnisse noch innerhalb der `LAMBDA()` Funktion wieder zu einem einzelnen Wert zusammengefasst werden. Diesen Schritt übernimmt die Funktion `TEXTVERKETTEN()`. Mit dieser Funktion wird ein Trennsymbol in die Zeichenkette eingeführt, so dass eine spätere Funktion die Buchstaben leicht aus der Zeichenkette extrahieren und vektorisieren kann
