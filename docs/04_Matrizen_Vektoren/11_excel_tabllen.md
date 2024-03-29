# Exkurs: Excel Datentyp Tabelle

Eine **Excel-Tabelle** ist ein komplexer Datentyp von Excel. Excel-Tabellen verbinden verschiedene Vektoren zu einer zusammengehörenden Struktur. Die Vektoren müssen dabei nicht den gleichen Datentyp haben. Damit entsprechen Excel-Tabellen grob dem `data.frame`/`tibble` von R. 

Eine Excel-Tabelle hat einen Namen und Vektorennamen über die auf die Werte in der Tabelle zugegriffen werden kann. Die Adressierung von Excel-Tabellen ähnelt dem direkten Zugriff auf Werte in R: 

```Excel
=Tabelle1[Vektor 1]
```

<p class="alert alert-primary" markdown="1">
Jede Tabelle und jeder Tabellen-Vektor ist ein *dynamisches Feld*. 
</p>

<p class="alert alert-success" markdown="1">
Werden externe Daten aus CSV-Tabellen oder Excel-Arbeitsmappen eingebunden, dann erfolgt das immer in Form einer Tabelle. 
</p>

## Tabellen erstellen

Excel erstellt eine Tabelle als Ergebnis des "Textkonvertierungassistenten", wenn Werte aus einer anderen Tabelle in die Arbeitsmappe eingefügt werden. Sonst müssen Tabellen händisch festgelegt werden. Eine Tabelle kann aus einem Bereich mit Hilfe der Option `Tabelle` im Menübalken `Einfügen` erzeugt werden. Dazu wird zuerst der Tabellenbereich markiert und anschliessend der Menüpunkt ausgewählt. Excel-Tabellen müssen Überschriften haben. Deshalb erzeugt Excel Überschriften, falls noch keine vorhanden sind. 

![Excel Menübalken Einfügen](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_tabellen/Excel_Menu_Einf%C3%BCgen_Tabelle.png)

Nachdem eine Excel-Tabelle festgelegt wurde, kann auf Vektoren und Daten mit einer neuen Adressierung zugegriffen werden. Eine Tabelle wird über ihren Namen angesprochen. Ein Vektor in der Tabelle wird durch den sog. Selektierungsoperator `[]` angesprochen. Wir können so einen Vektor aus einer Excel-Tabelle über den Vektornamen auswählen. Beispielsweise mit der Adressierung `=Tabelle1[Vektor 1]`. Das Ergebnis ist immer ein dynamisches Feld, das analog zur Adressierung mit dem `#`-Bereich verwendet wird.

![BEISPIEL FÜR einen Excel Bereich](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_tabellen/Beispiel_Excel_Bereich.png)
![BEISPIEL FÜR eine Excel Tabelle](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_tabellen/Beispiel_Excel_Tabelle.png)

<div class="alert alert-warning" markdown="1"> 
Excel-Tabellen können nicht durch eine Funktion erstellt werden und es gibt keine Funktionen, die analog zu R eine Tabelle als Ergebnis erzeugen. Daher bietet diese Struktur *keinen Vorteil* gegenüber der Organisation von Stichproben als Bereich.
</div>

Excel erweitert Tabellenstrukturen  automatisch, falls neue Werte *direkt* unterhalb einer vorhandenen Tabelle eingefügt werden. Damit werden alle Vektoren automatisch um eine Zeile (i.d.R. mit leeren Daten) erweitert. 

## Tabellen zurück in Bereiche umwandeln

Excel-Tabellen können wieder in Bereiche umgewandelt werden. Bei alten Installationen von Excel war das notwendig, weil Tabellen zusätzliche Rechenleistung erforderten. In aktuellen Excel Versionen verhalten sich Tabellen wie Bereiche

Wenn eine Tabelle in einen Bereich umgewandelt wird, hat das kaum Auswirkungen auf die damit verbundenen Operationen: Alle Bezüge auf einen Tabellenvektor werden anschliessend automatisch in Bereichsadressen umgewandelt. 

![MENÜBALKEN Tabelle](https://github.com/dxiai/ct-resourcen/raw/main/bilder/excel_tabellen/Excel_Menu_Tabelle_konvertieren.png)

Eine Tabelle wird in  einen Bereich umgewandelt, indem  im  Menübalken `Tabellenentwurf` (Windows) bzw. `Tabelle` (MacOS) die Option `In Bereich konvertieren` ausgewählt wird. Dazu muss eine Zelle in der gewünschte Tabelle  ausgewählt sein, sonst wird dieser Menübalken *nicht* angezeigt.