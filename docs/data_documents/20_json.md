**JSON** steht für *JavaScript Object Notation* und ist ein Datenformat zum speichern und übertragen von hierarchisch strukturierten Daten. JSON ist ein Internet-Standard ([RFC 7159](https://www.rfc-editor.org/rfc/rfc7159)). JSON basiert auf der Schreibweise von Objekten in der Programmiersprache JavaScript. Ursprünglich wurde JSON dafür entwickelt, um den Datentransfer zwischen Servern und (interaktiven) Web-Seiten zu beschleunigen. Weil diese Webseiten in Web-Browsern dargestellt werden, war eine effiziente Bearbeitung in JavaScript besonders wünschenswert. 

JSON unterscheidet zwischen Attributen und Werten, wobei 6 Datentypen für Werte möglich sind. Diese Datentypen sind: 

- leerer Wert (`null`)
- Wahrheitswerte (`true`, `false`)
- Zahlen 
- Zeichenketten
- Objekte
- Listen


### Vollständiges Beispiel

```JSON
{
    "Modul": { 
        "Name": "Daten und Information",
        "Jahr": 2022,
        "Dozierende": [
            {
                "Name": "Chrisitan Glahn",
                "Fachgruppe": "Edge Computing & Interfaces"
            },
            {
                "Name": "Daniel Bajka",
                "Fachgruppe": "Edge Computing & Interfaces"
            },
            {
                "Name": "René Hauck",
                "Fachgruppe": "Digital Environment and Sustainability"
            }
        ],
        "Noten": []
    }
}
```

### Attribute

Ein Attribut bezeichnet ein Datenfeld eines *Objekts*. In JSON müssen Attribute in doppelten Anführungszeichen angegeben werden. Ansonsten gelten für Attribute die gleichen Regeln wie für Zeichenketten. 

### Zahlen

Zahlenwerte werden in JSON direkt durch Ziffern immer zur Basis 10 abgebildet. Der ganzzahlige Anteil wird durch einen Punkt (`.`) von den Nachkommastellen getrennt. Zahlen dürfen ein negatives Vorzeichen haben, das Vorzeichen darf aber nicht durch ein Leerzeichen von der Zahl getrennt sein. Die wissenschaftliche Schreibweise ist zulässig.

Zulässige Zahlenwerte sind: 

- `0`
- `1023`
- `0.123`
- `-1.023e2`
- `1.43E-1`

Unzulässige Zahlenwerte sind: 

- `01`
- `+32`
- `- 1.2`
- `1'234`
- `1_234`
- `1,234`

### Zeichenketten

Zeichenketten müssen im JSON-Format in doppelten Anführungszeichen angegeben werden. In einer Zeichenkette sind alle Unicode-Zeichen zulässig (auch Emojis). 

Zwei Symbole müssen besonders marktiert werden: die Anführungszeichen (`"`) und der Backslash (`\`). Diesen Symbolen mus ein zusätzlicher Backslash vorangestellt werden. 

Beliebige Unicode-Zeichen können durch den entsprechenden Code der Unicode-Tabelle erzeugt werden. Dem Unicode-Symbol muss ebenfalls ein Backslash vorangestellt werden. 

Die JSON-Zeichenkette `"\u03bc = \"\u03A3 x / n\""` ergibt die Zeichenkette `µ = "Σ x / n"`. Die Symbole `µ` und `Σ` wurden als [Unicode-Zeichencodes](https://en.wikipedia.org/wiki/List_of_Unicode_characters) angegeben. Die doppelten Anführungszeichen mussten durch jeweils einen Backslash geschützt werden.

### Objekte

Mit JSON-Objekten können Attribute und ihre Werte zusammengefasst werden. Ein JSON-Objekt wird durch eine öffnende geschweifte Klammer (`{`) eingeleitet und durch eine schliessende geschweifte Klammer (`}`) beendet. Ein Attribut wird durch einen Doppelpunkt (`:`) vom zugehörigen Wert getrennt. Zwei Attribut-Wert-Paare müssen durch ein Komma (`,`) getrennt werden. Das letzte Attribut-Werte-Paar eines Objekts darf nicht durch ein Komma gefolgt werden.  

Ein Attribut muss im gleichen Objekt eindeutig sein. Es darf also nur einmal vorkommen.

**Beispiel für ein Objekt mit zwei Attributen**

```JSON
{
    "kurs": "Daten und Information", 
    "Jahr": 2022
}
```


### Listen (Arrays)

JSON-Listen (Arrays) fassen mehrer Werte zusammen. Die Werte in einem Array werden nicht durch Attribute sondern durch ihre Position in der Liste unterschieden. Werte werden in einem Array werden durch Komma getrennt, wobei der letzte Wert nicht von einem  Komma gefolgt werden darf.

**Beispiel einer JSON-Liste mit zwei Werten**

```JSON
[
    87, 
    "Daten und Information" 
]
```
