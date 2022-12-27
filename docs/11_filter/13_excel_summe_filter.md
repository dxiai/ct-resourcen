Bis Juli 2020 mussten wir die Funktionen `SUMMEWENN()` oder `SUMMEWENNS()` verwenden, um schnell Daten nach Kriterien zu bestimmen. Diese Funktionen haben allerdings den Nachteil, dass wir keine echten logischen Ausdrücke verwenden können. Seit Juli 2020 steht uns die `FILTER()`-Funktion zur Verfügung und wir können hier echte logische Ausdrücke als Filterkriterien verwenden. 

Die folgende Formel sollten wir jetzt mit der Filter-Technik umschreiben. 

Alt wurde geschrieben:

```
= SUMMEWENN(B2#; "< 0")
```

Neu schreiben wir:

```
= SUMME( FILTER(B2#; B2# < 0) )
```

Diese Schreibweise hat den Vorteil, dass wir die einzelnen Schritte nach dem Prinzip der Problemzerlegung  trennen und untersuchen können. Das war in der alten Schreibweise nur indirekt möglich. 

Das gleiche Prinzip können wir auch für `ZÄHLENWENN()` und `ZÄHLENWENNS()` anwenden. In diesem Fall verwenden wir die Funktion `ANZAHL()` bzw. `ANZAHL2()`, um unsere Werte zu aggregieren. 

<p class="alert alert-info">Der grösste Vorteil ist aber, dass wir mit dieser Technik beliebige EXCEL-Aggregatoren auf unsere gefilterten Daten anwenden können und nicht mehr auf <code>ZÄHLENWENN()</code> oder <code>SUMMEWENN()</code> eingeschränkt sind. Mit dem Filtern wird es für uns ausserdem möglich, andere logische Ausdrücke als nur einen direkten Vergleich oder, im Fall von <code>SUMMEWENNS()</code> oder <code>ZÄHLENWENNS()</code>, mit Und verknüpfte Vergleiche durchführen zu müssen. </p>

<p class="alert alert-warning" markdown=1>
**Achtung:** Wenn wir komplexe logische Ausdrücke mit  Excels `FILTER()`-Funktion verwenden wollen, dann **müssen** wir für die logischen Operatoren die *arithmetische Schreibweise für die logischen Ausdrücke*  verwenden!
</p>
