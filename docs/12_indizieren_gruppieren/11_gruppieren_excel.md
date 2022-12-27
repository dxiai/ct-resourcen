Gruppieren funktioniert in Excel wenig intuitiv, weil es in mehreren Schritten erfolgen muss und nicht explizit das Wort Gruppe in Funktionsnamen enthält. 

Zu Excels Gruppierungsfunktionen gehören alle Funktionen, die auf `WENN` und `WENNS` enden, wobei die beiden Funktionen `WENN()` und `WENNS()` ***nicht*** als Gruppierungsfunktionen verwendet werden können. 

<p class="alert alert-danger" markdown="1">
Früher waren die Funktionen `SUMMEWENN()`, `ZÄHLENWENN()` oder `MITTELWERTWENN()` sowie die `WENNS`-Entsprechungen zur Kombination eines partiellen logischen Ausdrucks mit einer Aggregation gedacht. Mit der Excel Version von 2020 wurden diese Funktionen als Gruppierungsfunktionen **neu definiert**. Die alte Funktionalität sollte in neuen Excel Arbeitsmappen durch die Funktionskette der jeweiligen Aggregation mit einem Filter ersetzt werden.
</p>

Die alten und neuen Strategien sind in [[fa-download] dieser Arbeitsmappe](https://github.com/dxiai/ct-resourcen/raw/main/beispiele/Beispiel_gruppieren2.xlsx) gegenübergestellt. 

Zum Gruppieren müssen die Gruppen aus einem Sekundärvektor identifiziert werden. Dazu wird die Funktion `EINDEUTIG()` auf den gewünschten Sekundärindex angewandt. Diese Funktion erzeugt einen neuen Vektor, der alle Werte des Sekundärindex genau einmal enthält.

Der so erstellte Vektor kann als Gruppierungsvektor in einer Gruppierungsfunktion verwendet werden. 


<p class="alert alert-success" markdown="1">
In der Praxis empfiehlt es sich, die Ergebnisse der Gruppierungsoperation an einer benachbarten Adresse zum Vektor mit den eindeutigen Gruppenhashes auszugeben. 
</p>

Die folgenden Gruppierungsfunktionen stellt Excel bereit: 

| Normaler Aggregator | Gruppierungsfunktion | 
| :---: | :---: |
| `ANZAHL()` | `ZÄHLENWENNS()` |
| `MAX()` | `MAXWENNS()` |
| `MIN()` | `MINWENNS()` |
| `MITTELWERT()` | `MITTELWERTWENNS()` |
| `SUMME()` | `SUMMEWENNS()` |

<p class="alert alert-warning" markdown="1">
Vermeiden Sie die Funktionen `SUMMEWENN()`, `ZÄHLENWENN()` oder `MITTELWERTWENN()`! Diese Funktionen erlauben nur Gruppierungen für Aggregationen über den ausgewählten Sekundärindex. Verwenden Sie anstelle dieser Funktionen, die entsprechende `WENNS`-Variante, um die Gruppierungsoperation deutlich zu machen.
</p>

### Beispiel

Die Stichprobe in der Arbeitsmappe <a href="https://github.com/dxiai/ct-resourcen/raw/main/beispiele/Beispiel_gruppieren.xlsx" download>[fa-download] Beispiel Gruppieren</a> besteht aus drei Vektoren, wobei der erste Vektor `Tag` die Nummer des Tages eines Experiments enthält. Im folgenden Beispiel sollen Wochenmittelwerte für die beiden anderen Vektoren bestimmt werden. In der Stichprobe liegen aber nur Tageswerte im Vektor `Tag` vor. Es muss also zuerst ein Sekundärvektor für die zugehörige Woche erstellt werden. 

![Anfang der Beispielstichpobe](https://github.com/dxiai/ct-resourcen/raw/main/bilder/gruppieren/Stichprobenausschnitt_excel_gruppieren.png)

Eine Woche besteht aus sieben aufeinanderfolgenden Tagen. Damit Tage aus der gleichen Woche zusammengefasst werden können, müssen die Werte im Sekundärindex immer den gleichen Wert für die gleiche Woche erhalten.

<p class="alert alert-success" markdown="1">
Immer wenn aufeinanderfolgende Werte und ein durchnummerierter Vektor vorliegt, bietet sich die Ganzzahldivision als Hashing-Funktion an. Der Divisor ist dabei die Anzahl der aufeinanderfolgenden Werte im Referenzvektor. 
</p>

Im Fall der Wochenzuordnung werden die Werte im Vektor `Tag` als Basis für den Sekundärindex verwendet. Weil die Stichprobe nicht als Tabelle vorliegt und noch nicht vektorisiert ist, müssen die [Werte zuerst vektorisiert]() werden. Das wird mit der Operation `=FILTER(A:A; ISTZAHL(A:A)` Die vektorisierten Werte fliessen in die Ganzzahldivision ein. 

Für die Ganzzahldivision wird ein neuer Vektor mit dem Namen `Woche` erstellt. Dieser Vektor wird über die *Hashingfunktion* `=GANZZAHL(A2#/7)+1` aus dem Vektor `Tag` erzeugt. Die Addition mit 1 ist für die weiteren Berechnungen nicht notwendig, sondern dient nur dazu, dass die Wochennummern bei `1` und nicht bei `0` beginnen. Damit wurde der Sekundärindex erzeugt. 

Um die einzelnen Gruppen zu erhalten, werden die Hashes des neuen Sekundärindex mit `=EINDEUTIG(E2#)` zusammengefasst. Damit liegen die *Kriterien* für die Gruppierungsfunktion vor.

Nun können die gruppierten Mittelwerte mit der Operation `=MITTELWERTWENNS(B2#; $E$2#; $H$3#)` für den Vektor `Haus 1` berechnet werden. Der erste Parameter bezieht sich auf die zu aggregierenden Werte. Der zweite Parameter bezieht sich auf den Sekundärindex. Der dritte Parameter verweist auf den gerade erzeugten Vektor mit den eindeutigen Gruppenwerten. Der zweite und dritte Parameter verwendet die feste Adressierung mit `$`, damit diese Formel für den zweiten Vektor nach rechts aufgefüllt werden kann. 

<p class="alert alert-secondary" markdown="1">
**Fingerübung:** Wiederholen Sie das Beispiel, um die Durchschnittswerte für die Wochentage zu bestimmen. Sie wollen für die gleichen Wochentage immer den gleichen Wert erhalten. Verwenden Sie dazu den Modulo-Operator. 
</p>
