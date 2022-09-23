Wir schreiben Texte nicht mit Zahlen sondern mit Buchstaben, Satz- und Steuerzeichen. Damit wir Texte digital also in Zahlen abbilden können, müssen diese Symbole in Zahlen umgewandelt werden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Beliebige Symbole lassen sich durch Zahlenwerte kodieren.
</p>

Weil sich Buchstaben und andere Zeichen nicht direkt als Zahlen übersetzen lassen, bedarf es eines Tricks. Dazu werden alle zu kodierenden Zeichen in einer Liste aufgeschrieben, und anschliessend werden alle Zeichen durchnummeriert. Die Nummer des Zeichens wird als Zahlenwert stellvertretend für das jeweilige Zeichen. 

Historisch sind vier Kodierungen für uns von Bedeutung. 

- ASCII - kodiert das Anglo-amerikanische Alphabet mit Ziffern und Satzzeichen in 7 Bit (Zahlen mit max. 7 Stellen binär).
- ANSI - kodiert das Anglo-amerikanische Alphabet mit Ziffern und Satzzeichen in 8 Bit (Zahlen mit max. 8 Stellen binär).
- ISO-8859 - kodiert verschiedene Schriftsysteme in 8 Bit (Zahlen mit max. 8 Stellen binär).
  - ISO-8859-1 (oder ISO Latin 1) - kodiert das westeuropäische Alphabet mit deutschen und französischen Umlauten.
  - ISO-8859-15 (oder ISO Latin 9) - Kodiert das westeuropäische Alphabet wie ISO-8859-1 aber mit dem Euro Symbol (€)
- UTF-8 - kodiert alle gängigen und viele historische Schriftsysteme inkl. Emojis dynamich mit 8 bis zu 32 Bit. 

Diese Kodierungen sind bis zum Code 01111111 (oder 0x7F) identisch. 



<div class="alert alert-secondary" markdown="1">
**Vollständige ASCII-Kodierungstabelle** 

| | 0	| 1	| 2	| 3	| 4	| 5	| 6	| 7	| 8	| 9	| A	| B	| C	| D	| E	| F |
| :--- |  :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | 
| 0x	| ***NUL***	| SOH	| STX	| ETX	| EOT	|	ENQ	|	ACK	|	BEL	|	***BS***	|	***HT***	|	***LF***	|	VT	|	FF	|	***CR***	|	SO	|	SI	|
|1x	|	DLE	|	DC1	|	DC2	|	DC3	|	DC4	|	NAK	|	SYN	|	ETB	|	CAN	|	EM	|	SUB	|	***ESC***	|	FS	|	GS	|	RS	|	US	|
| 2x	|	 ***SPACE***	| 	!	|	"	|	#	|	$	|	%	|	&	|	'	|	(	|	)	|	*		| +	|	,	|	-	|	.	|	/ |
| 3x	|	0	|	1	|	2	|	3	|	4	|	5	|	6	|	7	|	8	|	9	|	:	|	;	|	<	|	=	|	>	|	?	|
| 4x	|	@	|	A	|	B	|	C	|	D	|	E	|	F	|	G	|	H	|	I	|	J	|	K	|	L	|	M	|	N	|	O	|
| 5x	|	P	|	Q	|	R	|	S	|	T	|	U	|	V	|	W	|	X	|	Y	|	Z	|	[	|	\	|	]	|	^	|	_	|
| 6x	|	`		|a	|	b	|	c	|	d	|	e	|	f	|	g	|	h	|	i	|	j	|	k	|	l	|	m	|	n	|	o	|
| 7x	|	p	|	q	|	r	|	s	|	t	|	u	|	v	|	w	|	x	|	y	|	z	|	{	|	\|	|	}	| ~	| ***DEL*** |

</div>

Neben Buchstaben werden auch sog. *nicht-druckbare Zeichen* wie Buchstaben kodiert. Dazu gehören u.a. Leerzeichen, Tabulatoren und Zeilenumbrüche. Viele dieser besonderen Buchstaben haben heute keine Bedeutung mehr. Die Ausnahmen sind: 

- *Leerzeichen/Leerschlag* (`0x20`)
- *Tabulator* (`0x09`)
- *Zeilenumbruch* (`0x0D`) und *Zeilenvorschub* (`0x0A`).
- *ESC* (`0x1B`)
- *Backspace* (`0x08`)
- *Löschen* (Delete) (`0x7F`)


### Ziffernkodierung

Arabische Ziffern werden mit den Werten `0x30` (Ziffer `0`) bis `0x39` (Ziffer `9`) kodiert.

<p class="alert alert-success" markdown="1">
**Merke:** Ziffern in Zeichenketten sind nicht gleichwertig mit den Ziffern in Zahlen. 
</p>

Eine Zahl wird als eine Abfolge von Ziffern dargestellt. Wird ein Wert als Zahl dargestellt, dann werden die Ziffern entsprechend der gewählten Basis interpretiert. Werden Ziffern als Zeichekette kodiert, dann entspricht der *Wert* der Ziffer der entsprechenden Kodierung. D.h.z.B. die Ziffer `"1"` in einer Zeichenkette hat nicht den Wert `1`, sondern den Wert `49` (`0x31`). Folgen mehrere Ziffern aufeinander in einer Zeichenkette, dann werden die kodierten Zahlen aneinandergereiht. Die Ziffern `"123"` entsprechen deshalb nicht dem Wert `123`, sondern den Wert `3224115` (`0x313233`). 

<p class="alert alert-success" markdown="1">
**EXCEL**, *R* und *Python* konvertieren Ziffern in Zeichenketten *oft* automatisch in die richtigen Zahlenwerte, **solange** keine anderen Zeichen in der jeweiligen Zeichenketten kodiert wurden.
</p>

<p class="alert alert-warning" markdown="1">
Nicht alle Programmiersprachen konvertieren Ziffern in Zeichenketten automatisch in Zahlenwerte
</p>

### Serialisierung

<p class="alert alert-primary" markdown="1">
**Definition:** Ein Zahlwert kann bei einer Darstellung zu einer Basis in mehreren Ziffern erfolgen. Diese Zifferndarstellung wird als **Serialisierung** bezeichnet. 
</p>

*Serialisierung* bedeutet, dass die Ziffern ein Werts *in einer bestimmten Reihenfolge* dargestellt werden. Jede Ziffer einer solchen Darstellung können wir uns als ein *Symbol* einer Nachricht vorstellen. 

Weil ein Zahlenwert in verschiedenen Zahlensystemen dargestellt werden kann, ergibt sich daraus der folgende Merksatz:

<p class="alert alert-success" markdown="1">
Ein Zahlenwert hat *mehrere* zulässige Serialisierungen. 
</p>

### Anwendung in EXCEL und R

Damit Werte in EXCEL und R als Zeichenketten erkannt werden können, müssen die Zeichenketten in doppelte Anführungszeichen (`"`) eingerahmt werden. Ohne diese Anführungszeichen erkennen die beiden Umgebungen die Eingabe nicht als Zeichenkette. 

<div class="alert alert-warning" markdown="1">
**EXCELs Formel- und Wertemodi**: EXCEL kennt zwei Modi: Den Formelmodus und den Wertemodus. Der Formelmodus wird bei der Eingabe **immer** durch ein Gleichheitszeichen am Anfang der Eingabe in einer Zelle aktiviert. Im Wertemodus wird ein Wert direkt eingegeben. 

Im Formelmodus **müssen** Zeichenketten **immer** in doppelten Anführungszeichen (`"`) eingerahmt werden. Beispiel Zahl als Zeichenkette im Formelmodus: ``= "12.34"`` (Die Zeichen werden direkt eingegeben).

Im Wertemodus werden Zeichenketten optional mit einem einfachen Anführungszeichen (`'`) eingeleitet. D.h. Das einfache Anführungszeichen **muss** angegeben werden, wenn eine Zeichenkette nur aus Ziffern besteht, wie ein Währungsbetrag oder wie ein Datum aussieht oder die Zeichenkette mit einem Gleichheitszeichen beginnt. Durch das einleitende Anführungszeichen wird  EXCEL signalisiert, dass der Wert nicht automatisch in ein anderes Format umgewandelt werden soll. Das einleitende Anführungszeichen wird in der Darstellung verborgen und wird nur beim Bearbeiten der Werte angezeigt. Beispiel Zahl als Zeichenkette im Wertemodus: ``'12.34`` (Die Zeichen werden direkt eingegeben). 
</div>


### Zusammenfassung 

Eine Nachricht kann also in Symbole auf verschiedenen Ebenen zerlegt werden: 

1. Eine Nachricht kann in strukturelle Elemente gegliedert werden (z.B. Sätze). 
2. Strukturelle Elemente können in Worte und Satzzeichen gegliedert werden. 
3. Worte werden in Buchstaben gegliedert
4. Buchstaben können als Zahlen kodiert werden 
5. Zahlen können in einem Zahlensystem dargestellt werden und diese Darstellung kann in Ziffern serialisiert werden. 

Auf jeder dieser Ebene arbeiten wir mit **Symbolen**.