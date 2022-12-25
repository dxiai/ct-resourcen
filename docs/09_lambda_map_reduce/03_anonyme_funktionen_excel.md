## EXCELs LAMBDA()-Funktion

EXCEL hat ein statische Funktionen aus benannte Funktionen. Diese Funktionen sind beim Öffnen einer Arbeitsmappe bereits festgelegt und können durch das Ausführen von Operationen nicht geändert und nur eingeschränkt erweitert werden. Auch EXCEL kennt Lambda-Funktionen, um komplexe Operationen mit Hilfe von anonymen Funktionen zu definieren.

<div class="alert alert-warning" markdown="1">
Lambda-Funktionen in EXCEL funktionieren im Prinzip wie Lambda-Funktionen in R. Hat aber eine Funktion eine Lambda-Funktion als Ergebnis, dann muss diese Funktion in der gleichen Operation verwendet werden. 

In EXCEL können wir deshalb zwar Funktionen wie `potenzierMaschine()` als Lambda-Funktion umsetzen. Wir können aber die Ergebnisfunktionen nicht für mehrere Aufrufe verwenden. 
</div>

Lambda-Funktionen werden in EXCEL mit der `LAMBDA()`-Funktion definiert. 

Die `LAMBDA()`-Funktion erwartet als letzten Parameter immer eine Operation. Wir können so eine parameterlose Lambda-Funktion schreiben. 

```EXCEL
= LAMBDA(1 + 1)
```

Weil EXCEL-Formeln an Ort und Stelle aus geführt werden müssen, muss auch eine so definiert die `LAMBDA()`-Funktion sofort ausgeführt werden. Einfach nur die Funktionsdefinition mit `LAMBDA()` führt immer zum Fehler `#KALK!`. Dieser Fehler bedeutet hier, dass die Operation nicht ausgeführt werden kann. 

Damit eine `LAMBDA()`-Funktion ausgeführt wird, muss eine Parameterliste wie folgt angefügt werden.

```EXCEL
= LAMBDA(1 + 1)()
```

Jetzt erhalten wir eine `2` als Ergebnis.

Zusätzliche Parameternamen werden dieser Operation vorangestellt. Passen wir die Funktion so an, dass sie einen Wert als Parameter akzeptiert und um eins erhöht. 

```EXCEL 
= LAMBDA(Wert; Wert + 1)(A2)
```

Falls an Adresse kein Wert steht erhalten wir eine `1` als Ergebnis. 

`LAMBDA()`-Funktionen können immer mit Vektoren umgehen, solange keine nicht vektorisierten Operationen in der Funktionsdefinition verwendet werden. Wir können die letzte `LAMBDA()`-Funktion auch auf einen Bereich anwenden.

```EXCEL 
= LAMBDA(Wert; Wert + 1)(A2:A5)
```

Diese Operation erhöht alle Werte im übergebenen Bereich um 1.

Weil `LAMBDA()`-Funktionen sofort ausgeführt werden müssen, erscheinen diese Funktionen auf den ersten Blick nicht besonders Sinnvoll. Die `LAMBDA()`-Funktion spielt ihre Stärken aus, sobald sie mit den entsprechenden Hilfsfunktionen kombiniert wird. 

Die `LAMBDA()`-Hilfsfunktionen sind in der Funktionsrubrik `Logisch` kategorisiert. 

Die folgende Liste zeigt die aktuell verfügbaren Hilfsfunktionen für die `LAMBDA()`-Funktion.

- `MAP()`
- `REDUCE()`
- `SCAN()`
- `NACHZEILE()`
- `NACHSPALTE()`
- `MATRIXERSTELLEN()`
