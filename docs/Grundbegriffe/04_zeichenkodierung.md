## Zeichenkodierung

Wir schreiben Texte nicht mit Zahlen sondern mit Buchstaben, Satz- und Steuerzeichen. Damit wir Texte digital abbilden können, müssen diese Symbole in Zahlen umgewandelt werden. 

<p class="alert alert-primary" markdown="1">
**Definition:** Beliebige Symbole lassen sich durch Zahlenwerte kodieren.
</p>



Historisch sind vier Kodierungen für uns von Bedeutung. 

- ASCII - kodiert das Anglo-amerikanische Alphabet mit Ziffern und Satzzeichen in 7 Bit
- ANSI - kodiert das Anglo-amerikanische Alphabet mit Ziffern und Satzzeichen in 8 Bit
- ISO-8859 - kodiert verscheidene Schriftsysteme in 8 Bit. 
  - ISO-8859-1 (oder ISO Latin 1) - kodiert das westeuropäische Alphabet mit deutschen und französischen Umlauten.
  - ISO-8859-15 (oder ISO Latin 9) - Kodiert das westeuropäische Alphabet wie ISO-8859-1 aber mit dem Euro Symbol (€)
- UTF-8 - kodiert alle gängigen und viele historische Schriftsysteme inkl. Emojis dynamsich mit 8 bis 32 Bit. 

Alle Kodierungen sind bis zum code 01111111 (oder 0x7F) identisch. 

Ziffern werden auf die Werte 30

### Ziffernkodierung

<p class="alert alert-success" markdown="1">
**Merke:** Ziffen in Zeichenketten sind nicht gleichwertig mit den Ziffern in Zahlen. 
</p>
