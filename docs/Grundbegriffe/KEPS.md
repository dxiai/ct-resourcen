# Die KEPS-Regel


<p class="alert alert-primary" markdown="1">
Die KEPS-Regel legt die Reihenfolge fest, mit der *mathematische* Operatoren in einer Formel bei einer Berechnung ausgeführt werden müssen. 
</p>


<p>
<video width="560" height="315" controls="true"><source src="https://youtu.be/6Vfzy94ExNw">https://youtu.be/6Vfzy94ExNw</video>
</p>

Die Rechenregeln der Grundrechenarten sollten allen bekannt sein. In der Mathematik führen wir diese Regeln meist intuitiv aus und arbeiten die einzelnen Operationen unserer selbst gewählten Reihenfolge aus. Diese Vorgehensweise ist formell gesehen nicht korrekt. 

Die KEPS-Regel ist die Verallgemeinerung der Regel "Punktrechnung geht vor Strichrechnung". 

<div class="alert alert-primary" markdown="1">
Jeder Buchstabe in KEPS steht für einen Operator in der Berechnungsreihenfolge: 

1. K = Klammern
2. E = Exponenten (und Wurzeln)
3. P = Punktrechnung
4. S = Strichrechnung
</div>

Wir müssen also immer Klammern vor Exponenten, Exponenten vor Punktrechnung und Punktrechnung vor Strichrechnung berechnen. 

Dieser Teil sollte allen bekannt sein.

<p class="alert alert-primary" markdown="1">
Der zweite Teil der KEPS-Regel legt fest, dass die Berechnung *immer* von links nach rechts erfolgen muss.
</p>

Dieser Teil ist weniger bekannt. Auf dem Papier ist das kaum ein Problem, weil die Operatoren der KEPS-Regel entweder dem *Kommutativgesetz* folgen (Addition und Multiplikation) oder als Verbund zusammengehalten werden (Klammern und Exponenten). Hier müssen wir allerdings zwei Einschränkungen beachten:

1. Eine Division ist eine Multiplikation mit dem Kehrwert des Divisors. 
2. Eine Subtraktion ist eine Addition mit einer negativen Zahl. 

<p class="alert alert-success" markdown="1">
**Kommutativgesetz**: Das Kommutativgesetz besagt für einen Operator, dass die beiden Operanden zu beiden Seiten des Operators vertauscht werden können. Wir müssen beachten, dass nicht alle Operatoren *kommutativ* sind.
</p>

#### Operatoren in der Programmierung

Alle Computer und Programmiersprachen halten sich streng an die KEPS-Regel und führen gleichwertige mathematische Operationen von Links nach Rechts aus. Bei der Bestimmung der Reihenfolge der Ausführung von Operatoren müssen wir **beide Teile** der KEPS-Regel berücksichtigen.

#### Verallgemeinerung für alle Operatoren

Wir werden noch einige andere Operatoren kennenlernen. Wir können die KEPS-Regel daher durch zwei Ergänzungen für alle Operatoren erweitern. 

<p class="alert alert-primary" markdown="1">
Alle Operatoren haben eine **Priorität** gegenüber anderen Operatoren!
</p>

<p class="alert alert-primary" markdown="1">
Alle Operatoren haben eine **Richtung** in der gleichwertige Operatoren ausgewertet werden!
</p>

### Warum ist die KEPS-Regel für uns wichtig?

Die KEPS-Regel bildet die Grundlage für die **Problemzerlegung**. Entlang der Operatoren können wir nämlich komplexe Formeln und Funktionen in übersichtliche Teile zerlegen und damit unsere Arbeitsschritte gliedern. Dazu gliedern wir einen Teil der Berechnung aus und fügen das Ergebnis an die entsprechende Stelle in der Formel ein. In unseren Formeln ist dieser Verweis meistens eine Adresse oder eine Variable, die das Ergebnis enthält. 

Diese Technik wird in der Mathematik auch als ***Substitution*** bezeichnet. Beim Programmieren hat die Substitution den schönen Nebeneffekt, dass wir Fehler in komplexen Formeln leichter finden und beheben können.