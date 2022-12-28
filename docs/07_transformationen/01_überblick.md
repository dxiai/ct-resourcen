## Transformationen 

### Konvertieren, aggregieren und berechnete Visualisierungen

In diesem Abschnitt geht es um *Transformationen*. 

<p class="alert alert-primary" markdown="1">
**Definition:** Jede Operation, die Daten eines Objekt verändert, wird als **Transformation** bezeichnet.
</p>

Wir werden in den meisten Fällen *Stichprobenobjekte* oder *Vektoren* *transformieren*. Beim Transformieren unterscheiden wir immer die urspüngliche Stichprobe \\( S_0 \\) und die Ergebnisstichprobe \\( S_t \\). Diese beiden Stichproben unterscheiden sich durch die Veränderungen, die durch die Transformationsfunktion vorgenommen wurden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Operation, die eine \\( S_0 \\) in \\( S_t \\) transformiert, ohne \\( S_0 \\) zu verändern, folgt dem Prinzip der **Unveränderlichkeit** (engl. *immutability*). 
</p>

In Excel können wir durch Transformationen keine Werte überschreiben, weil eine Operation (Formel) immer an einen *Bereich* gebunden ist und dieser Bereich kann nicht von einer anderen Operation überschrieben werden. Durch diese Eigenschaft erzwingt Excel, dass jede Operation die Ausgangsdaten oder Ergebnisse anderer Operationen nicht verändern kann. Damit folgen alle Excel-Operationen automatisch dem Prinzip der **Unveränderlichkeit**.

Modernes R legt das Prinzip der **Unveränderlichkeit** als Kriterium für Funktionen und Operationen fest. Jede Transformation, die wir in R ausführen, hat ein neues Stichprobenobjekt als Ergebnis. Dieses Ergebnis entspricht unserem \\( S_t \\). Das ursprüngliche Stichprobenobjekt oder ein Vektor entspricht unserem \\( S_0 \\) und bleibt unverändert. 

<p class="alert alert-danger" markdown="1">
In R halten sich nicht alle Funktionen an das Prinzip der Unveränderlichkeit. Dazu gehören viele Funktionen, die Base-R zugerechnet werden. Um Überraschungen und Nebeneffekte zu vermeiden, sollten daher Base-R Funktionen möglichst vermieden werden. 
</p>

<p class="alert alert-info" markdown="1">
In diesem Kurs werden nur Base-R Funktionen verwendet, die dem Kriterium der **Unveränderlichkeit** genügen.
</p>

