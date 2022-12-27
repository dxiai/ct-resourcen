# Daten im CSV-Format exportieren

Weil Excel Arbeitsmappen viele Beschränkungen haben, weicht man für den Datenaustausch und das Datenmanagement auf weniger komplexe und textbasierte Datenformate aus. Zwei Formate sind hier von besonderer Bedeutung:

1. Das TSV (Tabulator Separated Values) Format 
2. Das CSV (Comma Separated Values) Format

Beide Formate haben keine Begrenzung über die Anzahl der Datensätze in einer Stichprobe und werden nur durch die Grösse des Speichermediums eingeschränkt, auf der die Datei abgelegt werden soll. 

In Excel können wir Daten in anderen Formaten nur interaktiv über den Speichern-Dialog "exportieren". Unter der Option `Dateiformat` können wir unterschiedliche Formate auswählen. Dort sehen wir, dass es unterschiedliche Varianten von CSV gibt. 

<p class="alert alert-success" markdown="1">
Wenn Sie unter Excel CSV-Dateien exportieren möchten, wählen Sie *immer* das Format `CSV UTF-8`. Nur so stellen Sie sicher, dass die Datei später korrekt importiert werden kann. 
</p>

Wir importieren Daten über den Befehl `Daten abrufen` im Menuband `Daten`. Die zugehörigen Unterbefehle sind von Ihrer Datenquelle abhängig. Wir werden meistens Daten `aus Text`-quellen importieren. Dieser Import ermöglicht uns verschiedene Textformate mit Hilfe des "Textkonvertierungsassistenten" zu importieren.

### Daten mit R exportieren

Gelegentlich müssen wir Daten oder Tabellen aus unserer R Umgebung exportieren. In diesen Fällen verwenden wir die `write_`-Funktionen. Diese Funktionen arbeiten analog zu den `read_`-Funktionen für den Datenimport. 

Für den Datenexport reicht uns aber ein Dateiname nicht. Wir müssen zusätzlich Daten übergeben, die wir speichern möchten. Diese Daten sind immer das Ergebnis eines Tranformationsschritts und werden an die entsprechende Funktion übergeben, damit diese die Daten *persistent* (d.h. dauerhaft, über die Laufzeit eines Programms hinaus) speichert. 

Das folgende Beispiel veranschaulicht diesen Schritt: 

```R
meineDaten %>%      # wir transformieren implizit mit der Identitätsfunktion
   write_csv("meine_beispieldaten.csv")
```

Nach diesem Schritt stehen unsere Daten in der Datei `meine_beispieldaten.csv`. Diese Daten sind dann durch ein Komma getrennt.

Die folgende Aufstellung zeigt die wichtigsten Funktionen zum persistenten Speichern auf Ihrer Festplatte. 

| Format | Modern R | 
| --- | --- | 
| csv (mit `,` als Trennzeichen) | `write_csv()` | 
| csv (mit `;` als Trennzeichen) | `write_csv2()` |
| Excel CSV Datei | `write_excel_csv()` und `write_excel_csv2()` | 
| tsv | `write_tsv()` | 
| RDS | `write_rds()` | 

Die Funktionen `write_excel_csv()` und `write_excel_csv2()` unterscheiden sich von der jeweiligen `excel`-freien Variante dadurch, dass sie der Datei ein spezielles Leerzeichen voranstellen, so wie es Excel macht, wenn Sie beim Speichern das Dateiformat `CSV UTF-8` wählen. Das erleichtert den Import in Excel Arbeitsmappen etwas. 
