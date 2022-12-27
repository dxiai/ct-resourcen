
<p  class="alert alert-warning" markdown="1">
**Sie müssen alle Vergleichsoperatoren auswendig und jederzeit korrekt anwenden können!**
</p>

Neben den logischen Operationen sind Vergleiche ein wichtiges Konzept, das wir in logischen Ausdrücken regelmässig anwenden. 

Es gibt genau sechs (6) Vergleichsoperatoren:

* Gleich (Excel: `=`; R: `==`)
* Ungleich (Excel: `<>`; R: `!=`)
* Grösser als (`>`)
* Grösser gleich (`>=`)
* Kleiner als (`<`)
* Kleiner gleich (`<=`)

<p class="alert alert-danger" markdown="1">
Bei Vergleichen müssen Sie sich sicher sein, dass Sie Werte vom gleichen Typ vergleichen.
</p>

Die Vergleiche funktionieren für alle Datentypen. 

Bei Zeichenketten werten Excel und R die alphabetische Reihenfolge der Symbole vom Beginn einer Zeichenkette aus, um grösser oder kleiner Vergleiche durchzuführen.

## Die Existenz eines Werts in einem Vektor überprüfen

Häufig müssen Sie überprüfen, ob ein Wert in einer Liste vorkommt. Grundsätzlich können Sie das mit komplizierten logischen Verknüpfungen in der Art des folgenden R-Beispiels schreiben.

```
meinWert = 3
wertVektor = c(8, 2, 3)

meinWert == wertVektor[1] | meinWert == wertVektor[2] | meinWert == wertVektor[3]
```

Einfacher ist aber ein sogenannter *Existenztest*. Dabei überprüfen Sie, ob Ihr Wert in einem Vektor vorkommt. 

Wir können dann das obige Beispiel wie folgt schreiben: 

```
meinWert = 3
wertVektor = c(8, 2, 3)

meinWert %in% wertVektor
```

### Existenztest mit Excel (XVERGLEICH und XVERWEIS)

In Excel verwenden wir für den Existenztest die `XVERGLEICH()`-Funktion. Diese Funktion gibt die Position des gesuchten Werts im Suchbereich zurück. Wenn der Wert nicht vorhanden ist, wird der Fehler `#NV` (Nicht Vorhanden) zurückgegeben.

<p class="alert alert-danger" markdown="1">
In Excel sollten Sie die ``VERGLEICH()``-Funktion nicht mehr verwenden!
</p>

Interessanter ist allerdings die Funktion `XVERWEIS()`. Mit dieser Funktion können wir einen Wert aus einem Vektor auswählen, wenn ein Vergleichswert in einem anderen Vektor existiert. 

#### Beispiel `XVERWEIS()`

Gegeben seien die beiden Vektoren `A1:A5` und `B1:B5`. 

| | A | B |
| :---: | :---: |  :---: | 
| **1** | 1 | "Fred" | 
| **2** | 7 | "Urs" | 
| **3** | 16 | "Lisa" | 
| **4** | 10 |  "Emilia" | 
| **5** | 4 | "Pia" | 

Die Formel `=XVERWEIS(10; A1:A5; B1:B5)` gibt `Emilia` als Ergebnis zurück. Diese Funktion sucht den Wert `10` im Bereich `A1:A5` und falls der Wert gefunden wurde, wird das Ergebnis an der entsprechenden Stelle in `B1:B5` zurückgegeben. Das Interessante an dieser Funktion ist, dass der Suchbereich und der Ergebnisbereich nur gleich gross sein müssen, sie müssen nicht benachbart sein oder in den gleichen Zeilen liegen. 
