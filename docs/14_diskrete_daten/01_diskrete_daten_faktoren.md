<p class="alert alert-primary" markdown="1">
**Definition:** Als **diskrete Daten** werden Vektoren bezeichnet, die ausschliesslich *bestimmte* Werte umfassen können, wobei</p>\n<p> nur das Kriterium erfüllt sein muss, dass zwei unterschiedliche Werte auch unterschiedlich sind. 
</p>

Im Gegensatz zu diskreten Daten werden Vektoren als *kontinuierliche Daten* bezeichnet, wenn der gültige Wertebereich auch Zwischenwerte umfasst, sodass der Wertebereich kontinuierlich zwischen den diskreten Werten verläuft. In der Praxis werden *kontinuierliche Daten* ausschliesslich durch reelle Zahlen repräsentiert.

Bei diskreten Daten gibt es *keine* Zwischenwerte. Das beste Beispiel für diskrete Daten sind *Buchstaben*. Die Buchstaben `a` und `b` stellen diskrete Werte dar, weil `a` sich von `b` unterscheidet. Die Werte sind *diskret*, weil zwischen den "benachbarten" Werten `a` und `b` kein weiterer Wert möglich ist.

Diskrete Daten *können* eine Ordnung haben. Im Fall der beiden Buchstaben existiert eine solche Ordnung durch die Reihenfolge im Alphabet. Aus dieser Ordnung ergibt sich, dass `a` < `b` ist `WAHR`.  Diese Ordnung wird per Konvention festgelegt und ergibt sich nicht automatisch. 

<p class="alert alert-primary" markdown="1">
**Definition:** Falls zwischen den einzelnen Werten diskreter Daten *keine Ordnung* existiert, werden die Daten als **nominalskaliert** bezeichnet. 
</p>

Das *Nominal* bedeutet, dass wir Merkmale benennen können. Solche Daten haben nur das Merkmal, dass nur der Unterschied zwischen den Werten definiert ist.  

Ein Beispiel für nominalskalierte Daten sind Betriebssysteme für Computer. Zwischen Werten wie `Windows`, `MacOS`, `Linux` oder `BSD` gibt es Unterschiede in der Verwendung und Anzahl der Buchstaben im Namen. Aus den Namen lässt sich jedoch keine Ordnung der Betriebssysteme ableiten. Diese  Werte sind zwar unterschiedlich, aber bezüglich der Ordnung gleichwertig.   

*Nominalskalierte Daten* sollten nicht mit Zahlenwerten abgebildet werden, weil Zahlen intuitiv eine Ordnung vorwegnehmen, die in diesem Fall nicht gegeben ist. 

<p class="alert alert-primary" markdown="1">
**Definition:** Falls zwischen den einzelnen Werten diskreter Daten *eine Ordnung* existiert, werden die Daten als **ordinalskaliert** bezeichnet. 
</p>

Das *Ordinal* steht für die Sortierbarkeit der Werte nach einer vorgegebenen Reihenfolge. 

Ein Beispiel für *ordinalskalierte* Daten sind Adjektive, die zeitliche Häufigkeiten abbilden: `ab und zu`, `immer`, `nie`, `oft` und `selten`. Die alphabetische Sortierung dieser Werte ist zwar möglich, bildet aber nicht die semantische Ordnung dieser Wörter ab. Intuitiv können wir diese Werte entsprechend der bezeichneten Häufigkeiten ordnen. Daraus ergibt sich die Reihenfolge: `nie` < `selten` < `ab und zu` < `oft` < `immer`. Auch diese Werte sind diskret. Im Prinzip können wir uns Zwischenwerte ausdenken. 

Auch mit Zahlen können diskrete Werte abgebildet werden. Sie können also nicht immer den Werten ansehen, ob es sich um diskrete oder kontinuierliche Daten handelt. In solchen Fällen können Sie der Dokumentation einer Stichprobe entnehmen, ob ein Vektor diskrete Daten enthält. 

<p class="alert alert-primary" markdown="1">
**Definition:** Als **Faktoren** werden diskrete Daten mit einem vorab definierten *endlichen* Wertebereich bezeichnet. Ein Wert in diesem Wertebereich wird auch als **Faktorstufen** (engl. levels) bezeichnet.
</p>

Aus der Definition von Faktoren leitet sich ab, dass sie nur Werte annehmen können, die vorab festgelegt sind. Wir können also für einen Faktor alle Faktorstufen aufzählen, noch bevor wir Werte gemessen haben. Der Wertebereich des Vektors kann daher auch Werte umfassen, die nicht in gemessenen Daten vorkommen. 

<p class="alert alert-success" markdown="1">
Bei der Beschreibung der gemessenen Ergebnisse von Faktoren ist es üblich, den gesamten Wertebereich anzuführen. Dazu gehören auch die nicht gemessenen Faktorstufen.
</p>

Faktoren werden oft als "Einflussgrössen" verwendet, entlang denen wir andere Vektoren gruppieren und vergleichen können.

<p class="alert alert-success" markdown="1">
**Merke:** Faktoren sind wegen der begrenzten Anzahl der Werte für das *Gruppieren* von Werten besonders gut geeignet.
</p>

EXCEL kennt das Konzept von Faktoren nicht. Um Faktoren mit EXCEL zu organisieren, müssen die Faktorstufen als separate Referenztabelle geführt werden. In solchen Tabellen würden auch Ordnungen abgebildet werden. EXCEL kann jedoch nicht automatisch überprüfen, ob die Daten für einen Faktor zulässig sind.

Weil Faktoren für die Statistik von besonderer Bedeutung sind, sind sie ein zentrales Konzept von R. Dazu gehören verschiedene Funktionen, die [separat erklärt](https://moodle.zhaw.ch/mod/page/view.php?id=635258) sind.
