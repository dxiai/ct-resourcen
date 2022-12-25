Nicht immer liegen Zeichenketten bereinigt vor. Sehr häufig liegen Texte unstrukturiert vor. Dazu gehören z.B. freie Antworten aus einem Fragebogen oder E-Mails von unseren Kunden sein. Diese Texte werden als Korpus bezeichnet.

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Korpus** bezeichnet die Texte, die *gemeinsam* in eine Analyse einfliessen.
</p>

Die Texte eines Korpus enthalten oft verborgene Information. Um diese Information zu dekodieren, müssen diese Texte zuerst in eine geeignet Form gebracht werden. Dieser Schritt wird als ***Tokenisierung*** bezeichnet. 

Die Tokenisierung ist ein notwendiger Schritt für die Vorbereitung einer quantitativen Textanalyse. 

<p class="alert alert-primary" markdown="1">
**Definition:** Die **Tokenisierung** bezeichnet die systematische Strukturierung eines Texts in kleinere Einheiten. Diese kleineren Einheiten werden als **Tokens** bezeichnet.
</p>

Für die Auswertung von Texten erzeugen wir aus langen Zeichenketten mehrere kurze Teiltexte. Diese Teiltexte sind die *Tokens*, die analysiert werden sollen. Tokens können  *Absätze* (`paragraph`), *Sätze* (`sentence`), *Worte* (`words`), Zeilen (`line`), Seiten (`page`), *Wortfolgen* (`ngram`) oder auch *Buchstabenfolgen* (`character_shingles`) sein. 
 
<p class="alert alert-secondary" markdown="1">
Wenn wir kodieren, dann erzeugen wir ebenfalls Tokens: Der für die Kodierung markierte Text ist ebenfalls ein Token. Beim Kodieren können Tokens mit unterschiedlicher Wortanzahl entstehen. 
</p>

### Sätze und Absätze

Sätze und Absätze sind besondere Tokens in Texten. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Satz** bezeichnet einen *inhaltlich zusammenhängenden Teiltext*, der durch einen Punkt (`.`), ein Fragezeichen (`?`) oder ein Ausrufezeichen (`!`) beendet wird. 
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **Absatz** bezeichnet einen *inhaltlich zusammenhängenden Teiltext*, der aus mindestens einem Satz besteht. 
</p>

Die Tokenisierung in Absätze und Sätze wird oft dazu verwendet, um grössere Korpora aus inhaltlich zusammenhängenden Texten zu erzeugen. 

### n-Gramme 

Die Gliederung von Texten in n-Gramme hat in der Textanalyse eine besondere Bedeutung. 

<p class="alert alert-primary" markdown="1">
**Definition:** Ein **n-Gram** bezeichnet eine Wortfolge, die aus `n` aufeinanderfolgenden Worten besteht. 
</p>

Mit Hilfe von n-Grammen lassen sich inhaltlich-relevante Phrasen identifizieren, die bei einer Tokenisierung auf Wortebene verloren gehen würden. 

<p class="alert alert-success" markdown="1">
Das Tokenisieren von Worten ist gleichbedeutend mit dem Tokenisieren von 1-Grammen.
</p>

