
#### Kennwerte mit Excel bestimmen

In Excel können wir die beiden Kennwerte unter der Voraussetzung bestimmen, dass eine Stichprobe immer eine rechteckige Struktur ist. Excel stellt uns die beiden Informationsfunktionen `SPALTEN()` und `ZEILEN()` bereit. Diese Funktionen geben uns die Anzahl der Spalten bzw. Zeilen in einem Bereich zurück. Z.B. die Formel `=ZEILEN(A3:D7)` gibt uns den Wert `5` zurück. Analog dazu ist das Ergebnis der Formel `=SPALTEN(A3:D7)` der Wert `4`.

Das erste und offensichtliche Problem mit diesen Funktionen ist, dass die Zellen in diesem Bereich gar keine Werte enthalten müssen. Der Bereich `A3:D7` aus dem Beispiel kann also komplett leer sein. 

Das zweite Problem mit diesen Funktionen ist, dass wir den gesamten Bereich der Stichprobe kennen müssen. Wir müssen also immer die Umfänge des Bereichs schon kennen, bevor wir die beiden Kennzahlen bestimmen. Das ist ein offensichtlicher **Widerspruch**. Im Folgenden wollen wir die Kennzahlen **rechnerisch** ermitteln. Dabei gehen wir davon aus, dass uns nur die Adresse der ersten Zelle des Stichprobenbereichs bekannt ist. 

Das dritte Problem ist, dass Excel keine zusammenhängenden Daten erzwingt, sodass zwischen den Datensätzen unserer Stichprobe Zeilen oder Spalten vorkommen können, die nicht zu den Daten gehören und deshalb nicht mitgezählt werden dürfen. Solche Zeilen und Spalten sind in der Regel leere Zeilen und Spalten, sodass wir nur diesen Fall betrachten. Ohne ein Arbeitsblatt im Detail zu betrachten, können wir nicht feststellen, ob unsere Stichprobe solche nicht zählbaren Objekte enthält.

Die Probleme lassen sich durch zwei unabhängige Lösungsstrategien lösen. 

**Die erste und einfachere Strategie** können wir einsetzen, wenn sichergestellt ist, dass unsere Daten in der ersten Spalte und Zeile *kontinuierlich* sind, d.h. dass es in der ersten Spalte und ersten Zeile **keine fehlenden Werte** gibt. Diese Voraussetzung können wir nicht überprüfen, ohne die Daten anzusehen.

In diesem Fall müssen wir nur die Anzahl der Zeilen und Spalten bestimmen, in denen Werte stehen. Das können wir nicht direkt, sondern müssen einen kleinen Umweg gehen: Dazu bestimmen wir zuerst die Anzahl der Spalten für die *erste Zeile* mit der Formel `=SPALTEN(1:1)`. Anschliessend bestimmen wir die Anzahl der Zellen, die keinen Wert enthalten mit der Formel `=ANZAHLLEEREZELLEN(1:1)`. ***Der Zeilenbereich `1:1` muss auf die Nummer der ersten Zeile unserer Stichprobe angepasst werden.*** Danach ziehen wir die Anzahl der leeren Zellen von der Spaltenzahl ab. Das Ergebnis ist die Anzahl der Zellen, die Werte enthalten. Weil wir annehmen, dass unsere Stichprobe in der ersten Zeile kontinuierlich ist, entspricht dieser Wert der Anzahl der Variablen. Diese Logik wiederholen wir für die erste Spalte, um den Stichprobenumfang `n` zu erhalten. 

**Die zweite Strategie** können wir dann einsetzen, wenn in unserer Stichprobe in der ersten *Spalte* Werte fehlen können. In diesen Fällen liefert der Stichprobenumfang der ersten Strategie falsche Ergebnisse. Wir bestimmen die Anzahl der Vektoren wie in der ersten Strategie. 

Anschliessend wollen wir wissen, welches die letzte Zeile unserer Stichprobe ist, die in einer *beliebigen* Variable Werte enthält. Diese Aussage kehren wir um und fragen: *Welche **Zeile** unserer Stichprobe enthält mindestens eine Zelle, die **nicht leer ist***? 

Dazu bestimmen wir die maximal mögliche Anzahl von Werten ab der ersten Zelle unserer Stichprobe mit der Formel `=ZEILEN(A:A) - ZEILE(A3)`, wobei die Adresse `A3` durch die Adresse unserer ersten Zelle ausgetauscht wird. Diesen Schritt benötigen wir für den nächsten Schritt. Wir wissen jetzt wie viele Spalten unsere Stichprobe breit und wie viele Werte höchstens in unserer Stichprobe sein können. Weil diese Grössen variabel sind und wir sie nicht im Voraus kennen, brauchen wir einen Weg, unseren Bereich *dynamisch* auszuwählen. Das erreichen wir mit der Funktion `BEREICH.VERSCHIEBEN()`. Mit dieser Funktion können wir von einer bekannten Zelle aus einem Bereich dynamisch auswählen, ohne die konkrete Start- und Endadresse kennen zu müssen. Nehmen wir an, dass die Höchstzahl in Zelle `A2` und die Vektoranzahl in Zelle `B2` steht. Wir können mit `BEREICH.VERSCHIEBEN(A3;0;0;A2;B2)` sicherstellen, dass alle Werte in unserer Stichprobe ausgewählt wurden, weil das ausgewählte Rechteck mindestens so gross ist, wie unsere Stichprobe. Für diesen Bereich beantworten wir die Frage: Welche der Zellen sind **nicht leer**? Diese Frage beantwortet uns die Formel: `NICHT(ISTLEER(BEREICH.VERSCHIEBEN(A3;0;0;A2;B2)))`. Abschliessend nummerieren wir alle möglichen Zeilen, die Werte haben, indem wir den vorherigen Ausdruck mit `SEQUENZ(A2)` multiplizieren. Wir erinnern uns an die Regel, dass die Anzahl der zählbaren Einheiten gleich der höchsten Nummerierung der Einheiten ist. Wir bestimmen deshalb das Maximum aus diesem Ergebnis mit der Funktion `MAX()`. Dieses Maximum entspricht `n+1`, weil die Spaltenüberschriften in Excel Teil des ausgewählten Bereichs sind. Diese zusätzliche Zeile müssen wir noch abziehen. 

Daraus ergibt sich die folgende Formel zur Bestimmung von `n`: 

```Excel
=MAX(NICHT(ISTLEER(BEREICH.VERSCHIEBEN(A3;0;0;A2;B2))) * SEQUENZ(A2)) - 1
```

Dieses Beispiel macht deutlich, dass schon einfaches Zählen von Stichprobenumfängen in Excel nur umständlich zu programmieren ist.

<p class="alert alert-warning"  markdown="1">
Excel verfügt über keine Funktion, die Rs `drop_na()` entspricht. Ohne Filter- und Matrix-Operationen können wir diesen zweiten Stichprobenumfang mit Excel *nicht* bestimmen.
</p>
