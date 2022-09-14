# Exkurs: EXCEL Datentyp Tabelle

Eine **EXCEL-Tabelle** ist ein komplexer Datentyp von EXCEL. EXCEL-Tabellen verbinden verschiedene Vektoren zu einer zusammengehörenden Struktur. Die Vektoren müssen dabei nicht den gleichen Datentyp haben. Damit entsprechen EXCEL-Tabellen grob dem `data.frame`/`tibble` von R. 

Eine EXCEL-Tabelle hat einen Namen und Vektorennamen über die auf die Werte in der Tabelle zugegriffen werden kann. Die Adressierung von EXCEL-Tabellen ähnelt dem direkten Zugriff auf Werte in R: 

```EXCEL
=Tabelle1[Vektor 1]
```

<p class="alert alert-primary" markdown="1">
Jede Tabelle und jeder Tabellen-Vektor ist ein *dynamisches Feld*. 
</p>



## Tabellen erstellen

EXCEL erstellt eine Tabelle als Ergebnis des "Textkonvertierungassistenten", wenn Werte aus einer anderen Tabelle in die Arbeitsmappe eingefügt werden. Sonst müssen Tabellen händisch festgelegt werden. Eine Tabelle kann aus einem Bereich mit Hilfe der Option `Tabelle` im Menübalken `Einfügen` erzeugt werden. Dazu wird zuerst der Tabellenbereich markiert und anschliessend der Menüpunkt ausgewählt. EXCEL-Tabellen müssen Überschriften haben. Deshalb erzeugt EXCEL Überschriften, falls noch keine vorhanden sind. 

![EXCEL Menübalken Einfügen](https://github.com/dxiai/ct-resourcen/raw/master/bilder/excel_tabellen/EXCEL_Menu_Einf%C3%BCgen_Tabelle.png)

Nachdem eine EXCEL-Tabelle festgelegt wurde, kann auf Vektoren und Daten mit einer neuen Adressierung zugegriffen werden. Eine Tabelle wird über ihren Namen angesprochen. Ein Vektor in der Tabelle wird durch den sog. Selektierungsoperator `[]` angesprochen. Wir können so einen Vektor aus einer EXCEL-Tabelle über den Vektornamen auswählen. Beispielsweise mit der Adressierung `=Tabelle1[Vektor 1]`. Das Ergebnis ist immer ein dynamisches Feld, das analog zur Adressierung mit dem `#`-Bereich verwendet wird.

![BEISPIEL FÜR einen EXCEL Bereich](https://github.com/dxiai/ct-resourcen/raw/master/bilder/excel_tabellen/Beispiel_EXCEL_Bereich.png)
![BEISPIEL FÜR eine EXCEL Tabelle](https://github.com/dxiai/ct-resourcen/raw/master/bilder/excel_tabellen/Beispiel_EXCEL_Tabelle.png)

<div class="alert alert-warning" markdown="1"> 
EXCEL-Tabellen können nicht durch eine Funktion erstellt werden und es gibt keine Funktionen, die analog zu R eine Tabelle als Ergebnis erzeugen. Daher bietet diese Struktur *keinen Vorteil* gegenüber der Organisation von Stichproben als Bereich.
</div>

EXCEL erweitert Tabellenstrukturen  automatisch, falls neue Werte direkt unterhalb einer vorhandenen Tabelle eingefügt werden. Damit werden alle Vektoren automatisch um die neuen Daten (i.d.R. leere Daten) erweitert. 

<div class="alert alert-success" markdown="1">
EXCEL-Tabellen fügen eine zusätzliche Komplexität in Arbeitsmappen ein, die Rechenleistung Ihres Computers bindet. Das ist nicht offensichtlich. Sollte Ihr Computer bei der Arbeit mit einer Arbeitsmappe mit Tabellen langsam werden, dann kann die Arbeitsmappe dadurch beschleunigt werden, dass alle Tabellen in Bereiche umgewandelt werden.

Wenn eine Tabelle in einen Bereich umgewandelt wird, hat das kaum Auswirkungen auf die damit verbundenen Operationen: Alle Bezüge auf einen Tabellenvektor werden anschliessend automatisch in Bereichsadressen umgewandelt. 
</div>

![MENÜBALKEN Tabelle](https://github.com/dxiai/ct-resourcen/raw/master/bilder/excel_tabellen/EXCEL_Menu_Tabelle_konvertieren.png)

Eine Tabelle wird in  einen Bereich umgewandelt, indem  im  Menübalken `Tabellenentwurf` (Windows) bzw. `Tabelle` (MacOS) die Option `In Bereich konvertieren` ausgewählt wird. Dazu muss eine Zelle in der gewünschte Tabelle  ausgewählt sein, sonst wird dieser Menübalken *nicht* angezeigt.