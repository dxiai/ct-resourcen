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

In R können wir anonyme Funktionen nicht einfach verwenden. Damit wir eine Funktion verwenden können, müssen wir sie einer Variablen zuordnen.

```
division = function (zähler, nenner)
    zähler / nenner
```

Der Variablenname gibt der Funktion ihren Namen, über den wir die Funktion aufrufen können. 

```
division(1, 4) # ergibt 0.25
```

Wir können mehrere Operationen in einer Funktion zusammenführen. Damit R weiss, welche Operationen zur Funktion gehören, müssen wir die Operationen in geschweifte Klammern setzen. Das folgende einfache Beispiel zeigt das: 

```
ganzzahldivision = function (a, b) {
    zwischenergebnis = a / b
    trunc(zwischenergebnis)
}
```

## EXCELs LAMBDA()-Funktion

EXCEL hat sog. benannte Funktionen. Diese Funktionen sind beim Öffnen einer Arbeitsmappe bereits festgelegt und können von Anwendenden nicht geändert und nur eingeschränkt erweitert werden.

Mit `LAMBDA()` eigene EXCEL-Funktionen programmieren. 
