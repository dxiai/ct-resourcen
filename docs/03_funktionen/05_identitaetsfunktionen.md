# Die Identitätsfunktion

Beim Computational Thinking hat *eine Funktion* eine besondere Bedeutung: Die **Identitätsfunktion**. 

<p class="alert alert-primary" markdown="1">
Die **Identitätsfunktion** oder kurz **Identität** ist als die Funktion definiert, die für einen beliebigen Eingabewert diesen Wert als Ergebnis liefert. 
</p>

Diese Eigenschaft können wir wie folgt schreiben: 

$$ f_{ID}(x) \to x $$

Diese Funktion ist das *neutrale Element* der Funktionsverkettung. Das bedeutet, dass wir die Identitätsfunktion beliebig oft in eine Funktionskette einfügen können, ohne das Ergebnis der Funktionskette zu beeinflussen. 

<p class="alert alert-success" markdown="1">
Die Identitätsfunktion hat in **Excel** die besondere Bedeutung, dass mit ihr Werte *kopiert* werden. Weil die Funktion die Eingabe als Ausgabe hat, fehlt eine explizite Funktion in Excel. Sie werden deshalb *keine* Funktion im Menuband `Formeln` finden. Stattdessen müssen wir uns jedes Mal eine implizite Identitätsfunktion vorstellen, wenn Adressen oder Adressbereiche in einer Funktion angegeben werden. 
</p>

In **R** existiert eine Funktion `identity()` mit der Eigenschaft der Identitätsfunktion. Diese Funktion verwenden wir in der Regel nicht, sondern denken uns diese Funktion mit. 