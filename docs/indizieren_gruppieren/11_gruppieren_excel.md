Gruppieren funktioniert in EXCEL wenig intuitiv, weil es in mehreren Schritten erfolgen muss und nicht explizit das Wort Gruppe in Funktionsnamen enthält. 

Zu EXCELs Gruppierungsfunktionen gehören alle Funktionen, die auf `WENN` und `WENNS` enden, wobei die beiden Funktionen `WENN()` und `WENNS()` ***nicht*** als Gruppierungsfunktionen verwendet werden können. 

<p class="alert alert-warning" markdown="1">
Vermeiden Sie die Funktionen `SUMMEWENN()`, `ZÄHLENWENN()` oder `MITTELWERTWENN()`. Diese Funktionen erlauben nur Gruppierungen für Aggregationen über den ausgewählten Sekundärindex.
</p>

<p class="alert alert-danger" markdown="1">
Früher waren die Funktionen `SUMMEWENN()`, `ZÄHLENWENN()` oder `MITTELWERTWENN()` sowie die `WENNS`-Entsprechungen zur Kombination eines partiellen logischen Ausdrucks mit einer Aggregation gedacht. Mit der EXCEL Version von 2020 wurden diese Funktionen als Gruppierungsfunktionen **neu definiert**. Die alte Funktionalität sollte in neuen EXCEL Arbeitsmappen durch die Funktionskette der jeweiligen Aggregation mit einem Filter ersetzt werden.
</p>

Zum Gruppieren müssen die Gruppen aus einem Sekundärvektor identifiziert werden. Dazu wird die Funktion `EINDEUTIG()` auf den gewünschten Sekundärindex angewandt. Diese Funktion erzeugt einen neuen Vektor, der alle Werte des Sekundärindex genau einmal enthält. 

Der so erstellte Vektor kann als Gruppierungsvektor in einer Gruppierungsfunktion verwendet werden. 

<p class="alert alert-success" markdown="1">
In der Praxis empfielt es sich, die Ergebnisse der Gruppierungsoperation an einer benachbarten Adresse zum Gruppenvektor auszugeben. 
</p>

