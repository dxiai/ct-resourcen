Sehr häufig liegen uns umfangreiche Daten mit vielen Vektoren vor. Gelegentlich wollen wir unsere Analyse auf einzelne Vektoren beschränken. Analog zum Filtern von Datensätzen wollen wir in solchen Fällen nur bestimmte Vektoren auswählen. 

<p class="alert alert-primary" markdown=1>
**Definition:** Das Filtern von Vektoren wird als **selektieren** bezeichnet. 
</p>

Weil die Vektoren einer Stichprobe Namen haben, *selektieren* wir in der Regel über die Vektoren Namen. 

Die Vektorennamen einer Stichprobe haben besondere Eigenschaften: 

1. Vektorennamen sind immer von Datentyp `Zeichenkette`.
2. Vektorennamen einer Stichprobe bilden einen **Vektor**.
3. Die Vektorennamen einer Stichprobe sind **eindeutig**

Die dritte Eigenschaft ist nicht ganz offensichtlich, denn in einer manuell eingegebenen Tabelle kann eine Überschrift mehrfach verwendet werden. Sobald eine solche Tabelle in ein Stichprobenobjekt umgewandelt wird, erzwingen EXCEL und R eindeutige Vektorennamen.
 
Aus diesen Eigenschaften folgt, dass die Auswahl von Vektoren durch die Eigenschaften von Zeichenketten unterstützt wird. Wir können zur Auswahl die folgenden Operationen verwenden: 

- Identischer Vektorname
- Vektorname beginnt mit einer bestimmten Zeichenkette
- Vektorname endet mit einer bestimmten Zeichenkette
- Vektorname enthält an einer beliebigen Position eine bestimme Zeichenkette
