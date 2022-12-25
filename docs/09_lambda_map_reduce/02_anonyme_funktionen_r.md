# Anonyme Funktionen

## R-Funktionen

Funktionen sind in R mit anderen Datentypen grundsätzlich gleichwertig. Um eine neue Funktion zu erstellen, teilen wir R mittels des `function` Schlüsselworts mit, dass eine Funktionsdefinition folgt. Anschliessend folgt die Parameterspezifikation und die überführende Operation. Das Ergebnis der Funktion ist immer die letzte Operation in der Funktion. Das folgende Beispiel veranschaulicht das. 

```
function (zähler, nenner)
    zähler / nenner
```

Diese Funktion hat nur eine Operation, so dass die letzte Operation die Division von `zähler` und `nenner` ist. Diese Funktion würde also das Ergebnis der Division als Ergebnis zurückgeben. 

<p class="alert alert-primary" markdown="1">
Diese Funktion bezeichnen wir als **anonym**, weil sie keinen Funktionsnamen hat. 
</p> 

In R können wir anonyme Funktionen nur direkt aufrufen. Weil die Funktion keinen Namen hat, geht sie genauso verloren, wie Werte, die wir keinen Variablen zuweisen. Um eine anonyme Funktion direkt auszuführen, müssen wir die gesamte Funktion in Klammern setzen und danach die Parameter in Klammern übergeben: 

```
(function (zähler, nenner)
    zähler / nenner) (16, 4)
```

Obwohl diese Funktionen funktionieren, haben sie sehr selten Vorteile gegenüber der direkten Ausführung der Funktionsoperationen. Deshalb werden wir meistens selbstgeschriebene Funktionen zuerst Variablen zuweisen, damit wir sie an anderen Stellen in unserem Programmen verwenden können.

```
division = function (zähler, nenner)
    zähler / nenner
```

Der Variablenname gibt der Funktion ihren Namen. Diesen Namen verwenden wir, wenn wir die Funktion ausführen möchten. 

```
division(1, 4) # ergibt 0.25
```

Wir können mehrere Operationen in einer Funktion zusammenfassen. Damit R weiss, welche Operationen zur Funktion gehören, müssen wir die Operationen in geschweifte Klammern setzen. Das folgende einfache Beispiel zeigt das: 

```
ganzzahldivision = function (a, b) {
    zwischenergebnis = a / b
    trunc(zwischenergebnis)
}
```

Weil Funktionen in R zu einem eigenen Datentyp zusammengefasst werden, können wir sie wie alle anderen Werte in unserem Code ablegen und verwenden. Das bringt uns zu einer wichtigen Anwendung: Funktionen können anderen Funktionen als Parameter übergeben werden, damit diese die Funktion mit den richtigen Parametern aufrufen. Diese Vorgehensweise unterscheidet sich von der Funktionsverkettung, bei eine Funktion ausgeführt wird und das Ergebnis an eine andere Funktion weitergegeben wird. Übergeben wir eine Funktion als Parameter, wird die Funktion noch nicht ausgeführt, so dass beim Funktionsaufruf der äusseren Funktion auch noch kein Ergebnis für die innere Funktion vorliegt.

```R
äussereFunktion = function (wert, FUN) 
    FUN(2, wert)   # Erst hier wird das Ergebnis der Funktion FUN bestimmt

innereFunktion = function (basis, erweiterung) 
    basis ** 2 + erweiterung

äussereFunktion(1:5, innereFunktion)
```

> 5, 6, 7, 8, 9

Die `äussereFunktion()` erwartet in diesem Beispiel zwei Parameter. Der erste Parameter ist ein Wert, den wir nicht weiterbestimmen. Als zweiter Parameter wird eine Funktion erwartet. Das kennzeichnen R-Funktionen meistens durch den Parameternamen `FUN`. Uns hindert aber nichts daran auch andere Werte als zweiten Parameter zu übergeben. 

```R
äussereFunktion(1:5, 7:-3)
```

In solchen Fällen erhalten wir aber die folgende Fehlermeldung:

```
Error in FUN(2, wert): konnte Funktion "FUN" nicht finden
```

Wenn wir nicht genau wissen, dass die `äussereFunktion()` als zweiten Parameter eine Funktion erwartet, dann ist diese Meldung nur schwer nachzuvollziehen. Nur in der Funktionsdefinition können wir sehen, dass der zweite Parameter als Funktionsname verwendet wird. Wenn eine äussere Funktion eine andere Funktion als Parameter erwartet, dann muss sie den allgemeinen Namen der übergebenden Funktion nicht kennen, sondern kann die Funktion über den Parameternamen auslösen.  

Diese Möglichkeit ermöglicht dynamischen Code zu entwickeln und die Operationen bei Bedarf anzupassen. Wir können also auch eine `andereInnereFunktion()` schreiben. 

```
andereInnereFunktion = function (summand, exponent) 
    summand ** exponent + summand
```

Diese neue Funktion können wir ebenfalls an die `äussereFunktion()` übergeben.

```
äussereFunktion(1:5, andereInnereFunktion)
```

> 4, 6, 10, 18, 34

Weil die `äussereFunktion()` aus den Parameternamen den Funktionnamen erzeugt, können wir auch anonyme Funktionen an solche Funktionen übergeben. 

```
äussereFunktion(1:5, function (zähler, nenner) zähler / nenner)
```

> 2, 1, 0.666666666666667, 0.5, 0.4


Wenn Funktionen als Parameter akzeptieren können, dann liegt es nahe, dass Funktionen andere Funktionen als Ergebnis haben können. Das ist in R zulässig. 

```
potenzierMaschine = function (wert) {
    function (andererWert) andererWert ** wert
}
```

Mit dieser Funktion können wir die Funktionen `Quadrat()` und `Kubik()` erzeugen.

```
Quadrat = potenzierMaschine(2)
Kubik = potenzierMaschine(3)
```

Diese Funktionen können wir anschiessend benutzen. 

```
Quadrat(3)
Kubik(2)
```

> 9

> 8

Wenn wir nebenbei eine vierte Potenz ausrechnen müssen, dann können wir die Ergebnisfunktion direkt nach der Rückgabe aufrufen.

```
potenzierMaschine(4)(2)
```

> 16

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Lambda-Funktion** bezeichnen wir *anonyme Funktionen*, die als Parameter an eine andere Funktionen übergeben werden, oder die wir als Ergebnis anderer Funktionen erhalten.
</p>
