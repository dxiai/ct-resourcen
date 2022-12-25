Logische Ausdrücke basieren auf der Verknüpfung von **Wahrheitswerten**.

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **logischer Ausdruck** ist eine Verknüpfung von Operationen, die einen Wahrheitswert als Ergebnis haben.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Wahrheitswerte** werden die Werte `WAHR` (`TRUE`) und `FALSCH` (`FALSE`) bezeichnet. 
</p>

Aus diesen Definitionen folgt direkt, dass die beiden einfachsten logischen Ausdrücke die Wahrheitswerte sind.

Wahrheitswerte *können* als Zahlen geschrieben werden. Gängig ist dabei für `FALSCH` der Wert `0` und für `WAHR` der Wert `1`. Diese Unterscheidung ist unvollständig, denn die meisten Programmiersprachen interpretieren ausserdem `0` für `FALSCH` und **ungleich** `0` für `WAHR`. Diese unterschiedliche Behandlung bei der Umwandlung von Wahrheitswerten in Zahlen macht deutlich, dass Wahrheitswerte **keine** Zahlen sind, sondern ein separater **Datentyp**. 

Gelegentlich werden Zahlen als *logische Ausdrücke* verwendet. In diesem Fall wird ***implizit*** die Zahl mit dem Wert `0` verglichen. In solchen Fällen müssen wir uns diesen zusätzlichen Vergleich dazu denken. In **EXCEL** ist dieser gedachte Vergleich `ZAHL <> 0`, wobei `ZAHL` der jeweilige Wert einer Zahl ist. Z.B. `= 123174 <> 0`  oder `= 0 <> 0` oder `= SUMME(AQ16:BC18) <> 0`.  In **R** ist der gedachte Vergleich `ZAHL != 0`, wobei `ZAHL` eine beliebige Variable sein kann, die einen Vektor enthält. Mit diesem impliziten Vergleich erzwingen die beiden Umgebungen einen geforderten Wahrheitswert, falls dieser nicht explizit aus einer Operation folgt. 

$$ $$