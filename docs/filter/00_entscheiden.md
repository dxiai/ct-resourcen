<p class="alert alert-primary" markdown=1>
**Definition:** Eine **Entscheidung** beschreibt eine Funktion, die mit Hilfe eines *logischen Ausdrucks* (oder mehr Ausdrücken) aus zwei (oder mehr) alternativen Ergebnissen *auswählt*. Eine Entscheidung ist eine besondere Transformationsfunktion zum *Umwandeln* von Daten.
</p>

## Einfache Verzweigungen

EXCEL's Entscheidungsfunktion ist die `WENN()`-Funktion. Diese Funktion hat drei Parameter: 

1. Einen logischen Ausdruck - dieser Parameter wird als Wahrheitswert interpretiert. 
2. `WAHR`-Ergebnis - dieser Parameter wird als Ergebnis zurückgegeben, wenn der erste Parameter `WAHR` ist.
3. `FALSCH`-Ergebnis - dieser Parameter wird als Ergebnis zurückgegeben, wenn der erste Parameter `FALSCH` ist. 

Diese Funktion entscheidet mit Hilfe des logischen Ausdrucks, welcher der beiden anderen Parameter zurückgegeben werden muss. 

In R heisst diese Funktion `ifelse()` und hat genau die gleichen Parameter. 

Häufig finden wir Formeln in denen einfach ein Wert als erster Parameter an die `WENN()`-Funktion übergeben wird. Dieser Wert wird als logischer Ausdruck interpretiert und prüft in der Regel, ob der Wert ungleich 0 ist. 

## Abbruchbedingungen 

<p class="alert alert-primary" markdown=1>
<b>Definition:</b> Eine **Abbruchbedingung** ist eine spezielle Entscheidung, die einen Algorithmus beendet. Dabei wird zwischen einem *konstanten* Wert und einem *dynamischen* Wert entschieden.
</p>

Mit Hilfe von Abbruchbedingungen "schützen" wir unsere Programmlogik vor unerwünschten oder fehlerhaften Werten. 

<p class="alert alert-warning" markdown=1>
Genau genommen bricht dieses Konzept nicht ab, sondern verwendet  die dynamischen Werte des Vektors nicht mehr. Stattdessen werden konstante Werte zurückgegeben. Für diese Werte müssen wir einen Wert wählen, der den logischen Ausdruck der Abbruchbedingung weiterhin so erfüllt, dass der Algorithmus diese Werte ignoriert. 
</p> 

## Komplexe Entscheidungen

Komplexe Entscheidungen können wir uns als eine Folge einfacher Entscheidungen vorstellen. Weil solche Entscheidungen sehr unübersichtlich sein können, bieten EXCEL und R Kurzformen an, mit denen wir solche Folgen einfacher schreiben können.

<p class="alert alert-primary" markdown=1>
**Definition:** Eine Verkettung von Entscheidungen wird als **Entscheidungsbaum** bezeichnet.
</p>

<p class="alert alert-primary" markdown=1>
**Definition:** Ein *Entscheidungsbaum*, der nur für einen Fall von logischen Ausdrücken nachfolgende Entscheidungen vorsieht, heisst **linearer Entscheidungsbaum**.
</p>


### EXCEL's WENNS

Die `WENNS()`-Funktion erlaubt es uns, verschiedene Entscheidungen zusammenzufassen. Dabei gibt es immer Paare von logischen Ausdrücken und Ergebniswerten. Die `WENNS()`-Funktion prüft nacheinander die logischen Ausdrücke und liefert als Ergebnis den Wert, der zum ersten logischen Ausdruck gehört, der WAHR ergibt. 

**Beispiel A: linearer Entscheidungsbaum**

```
=WENNS( A1 > 5; "Sehr gut"; A1 > 4; "Gut"; A1 > 3; "Genügend"; A1 <= 3; "Ungenügend")
```

Beachten Sie, dass im Beispiel der zweite logische Ausdruck auch für die Werte des ersten logischen Ausdrucks WAHR ergeben würde. Weil aber diese Fälle bereits durch den ersten logischen Ausdruck abgefangen werden, kommen diese gar nicht mehr zum zweiten logischen Ausdruck. Entsprechend müssen Sie aufpassen, dass die logischen Ausdrücke sich nicht überschneiden. 

**Beispiel B: nicht erreichbare Entscheidungen**

```
=WENNS( A1 > 5; "Sehr gut"; A1 > 3; "Genügend"; A1 > 4; "Gut"; A1 <= 3; "Ungenügend")
```

In Beispiel B kann nie das Ergebnis "Gut" angezeigt werden, weil der zweite logische Ausdruck (A1 > 3) alle Werte "maskiert", die durch den dritten logischen Ausdruck (A1 > 4) als "Gut" markiert werden müssten. "Ungenügend" würde trotzdem angezeigt werden, wenn der Wert in A1 entweder 1, 2 oder 3 ist.

In diesem Beispiel kann die Entscheidung `A1 > 4` nicht erreicht werden, weil das vorherige und allgemeinere Kriterium `A1 > 3` für die gleichen Werte zutrifft.  

<p class="alert alert-success" markdown=1>
**Merke:** Es müssen also immer die spezielleren Kriterien vor den allgemeineren Kriterien geprüft werden.
</p>

<p class="alert alert-success" markdown=1>Es ist guter Stil, das letzte Parameterpaar immer für den gültigen logischen Ausdruck `WAHR` zu reservieren. Damit stellen Sie sicher, dass für jeden möglichen Eingabewert ein gültiges Ergebnis zurückgegeben wird. Dieser Schritt ist notwendig, weil `WENNS()` keine Alternativausgabe hat.</p>

**Beispiel C: Abschliessender Standardwert mit `WAHR`**

```
=WENNS( A1 > 5; "Sehr gut"; A1 > 4; "Gut"; A1 > 3; "Genügend"; UND(A1 <= 3; A1 > 0); "Ungenügend"; WAHR; "Nicht angetreten")
```
### R's `case_when()` Funktion

Die Funktion `case_when()` ist die Entsprechung für `WENNS()` in EXCEL. Allerdings ist die Schreibweise für die Fälle etwas anders. 

**Beispiel D: `case_when()`  Entscheidungsbaum.**

```R
data = c(1,2,3,4,5,6,0,4)

case_when(
    data <= 3 ~ "ungenügend",
    data > 5 ~ "Sehr gut",
    data > 4 ~ "gut",
    data > 3 ~ "ausreichend"
)
```

Für jeden Fall können wir einen logischen Ausdruck angeben. Dieser logische Ausdruck wird vom Tilde-Symbol (`~`) gefolgt. Dabei handelt es sich um den *"aus `a` folgt `b`"-Operator*. Die rechte Seite dieses Operators  zeigt an, welcher Wert aus dem logischen Ausdruck folgt.

<p class="alert alert-info" markdown=1>
Den Parameter `data <= 3 ~ "ungenügend"` wird wie folgt gelesen: "Aus den Werten in `data`, die kleiner oder gleich `3` sind, folgt die Zeichenkette `ungenügend`. 
</p>

Wie in EXCEL müssen auch bei dieser Funktion die spezifischeren logischen Ausdrücke vor den unspezifischeren Ausdrücken im Entscheidungsbaum angegeben werden. 

Es ist üblich, ebenfalls eine immer zutreffende allgemeine Bedingung als letzten Parameter zu übergeben. 

**Beispiel E: abschliessende allgemeine Bedingung.**

```R
data = c(1,2,3,4,5,6,0,4)

case_when(
    data <= 3 & data > 0 ~ "ungenügend",
    data > 5 ~ "Sehr gut",
    data > 4 ~ "gut",
    data > 3 ~ "ausreichend",
    TRUE ~ "nicht angetreten"
)
```

### Sonstige Entscheidungen in EXCEL

In EXCEL gibt es zusätzlich die beiden Funktionen `WENNFEHLER()` und deren spezialisierte Form `WENNNV()`. Diese Funktionen erlauben eine kompaktere Schreibweise der typischen Fehlerbehandlung: Wenn kein Fehler erzeugt wird, dann wird das Ergebnis der Formel des ersten Parameters als Ergebnis geliefert. Wird ein Fehler erzeugt, dann wird der 2. Parameter als Rückfallwert  zurückgegeben. 

Wir sparen uns mit diesen beiden Funktionen die Schreibweise: 

```
=WENN(ISTFEHLER(A1); "Rückfallwert", A1)
```

Stattdessen schreiben wir.

```
=WENNFEHLER(A1, "Rückfallwert")
```

Das ist leichter verständlich als die ausführliche Variante mit `WENN()`.