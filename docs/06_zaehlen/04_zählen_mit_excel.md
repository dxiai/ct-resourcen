Das Zählen in Excel reduziert sich im Kern auf die beiden Arbeitsschritte des Abzählens:  

1. Der Bestimmung der **zählbaren Einheiten**
2. Die Bestimmung der Anzahl der zählbaren Einheiten. 

Im Video habe ich zwei Strategien vorgestellt: Die erste Strategie ist das Zählen durch eine Folge und die zweite Strategie das Zählen durch Summenbildung. Beide Strategien haben gemeinsam, dass wir die zählbaren Einheiten bestimmen müssen (Schritt 1). In aktuellen Excel-Versionen wird das Zählen mit einer Folge durch das Nummerieren der zählbaren Einheiten ersetzt. Dazu wählen wir zuerst die zählbaren Elemente aus und nummerieren dann diese Elemente über eine `SEQUENZ()`.

Neben diesen beiden Strategien gibt es in Excel auch noch die Funktionen `ANZAHL()`, `ANZAHL2()` sowie die davon abgeleiteten Funktionen `ZÄHLENWENN()` und `ZÄHLENWENNS()`. 

Die Funktionen `ANZAHL()` und `ANZAHL2()` verwenden wir immer dann, wenn ein Bereich nur zählbare Einheiten oder leere Zellen enthält. Die Funktion `ANZAHL()` kann nur Zahlen zählen. Die Funktion `ANZAHL2()` ist etwas flexibler und zählt alle Zellen, die nicht leer sind. Die beiden Funktionen können auf beliebig adressierte Bereiche angewandt werden. 

<p class="alert alert-warning" markdown="1">
Die Funktionen `ZÄHLENWENN()` und `ZÄHLENWENNS()` sind veraltete Funktionen, weil Sie keine echten logischen Ausdrücke zur Bestimmung der zählbaren Einheiten verwenden. Deshalb sollten Sie diese beiden Funktionen nicht mehr in neuen Excel-Arbeitsmappen verwenden. In aktuellen Excel-Versionen können wir über die Kombination der Funktionen `ANZAHL()` mit `FILTER()` flexibler und konsistenter zählen.
</p>

### Beispiel

<p class="alert alert-info" markdown="1">
Dieses Beispiel können Sie mit Hilfe der [Excel Arbeitsmappe für dieses Beispiel](https://moodle.zhaw.ch/mod/resource/view.php?id=635180) nachvollziehen.
</p>

Gegeben sei ab der Adresse `A2` eine Reihe mit 25 zufälligen Zahlen zwischen 1 und 17. Wir wollen in diesem Beispiel wissen, wie viele dieser Zahlen durch drei teilbar sind? Wir erinnern uns, dass eine ganze Zahl durch eine andere ganze Zahl teilbar ist, wenn die Modulo-Operation 0 als Ergebnis hat. Wir bestimmen die zählbaren Einheiten dieser Reihe mit der folgenden Formel in `B2`: 

```Excel
=REST(A2:A26; 3) = 0
```

Wir erhalten dadurch eine Reihe von 25 Wahrheitswerten. Jetzt haben wir alle zählbaren Einheiten bestimmt. 

<p class="alert alert-success" markdown="1">
**Anmerkung:** In allen Programmiersprachen wird der Wert `WAHR` mit einer `1` und der Wert `FALSCH` mit einer `0` gleichgesetzt.
</p>

Als **erste Variante** bestimmen wir die Anzahl der durch drei teilbaren Werte an der Adresse `G2` durch Summenbildung mit der Formel: `= SUMME(1*B2#)`. 

Als zweites filtern wir die zählbaren Elemente mit der Formel `= FILTER(A2:A26; B2#)` an der Adresse `C2`. Diese Formel gibt uns nur die zählbaren Elemente zurück. 

Die Anzahl der zählbaren Elemente erhalten wir an der Adresse `F2` aus der Formel `= ANZAHL(C2#)`. 

Die gefilterten Daten können wir auch mit einer Sequenz/Folge durchnummerieren. Das erreichen wir mit der Formel `= SEQUENZ(ZEILEN(C2#))` an der Adresse `D2`. Die Anzahl der durch drei teilbaren Zahlen ergibt sich nun aus der höchsten Nummerierung. Diese finden wir mit der Formel `= MAX(D2#)` an der Adresse `E2` heraus. 

<p class="alert alert-success" markdown="1">
Die letzte Variante entspricht dem Zählen durch eine Folge. Diese Variante ist umständlicher als die anderen beiden Varianten. Gelegentlich benötigen wir aber die Zwischenergebnisse unserer Zählung, um z.B. einen Ausschnitt der zählbaren Einheiten zu identifizieren.
</p>