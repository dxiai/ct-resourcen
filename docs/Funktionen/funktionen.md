# Funktionen

<div class="alert alert-info" markdown="1">
Dieses Kapitel umfasst die zentralen Definitionen von Funktionen.
</div>

### Funktionen ganz allgemein

<p class="alert alert-info" markdown="1">
**Merke**:  Funktionen und Operatoren bilden die Grundlage für die Programmierung in einer Programmierumgebung bzw. einer Programmiersprache. Sie legen fest, welche Arbeiten wir in Algorithmen ausdrücken können.
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Funktion erzeugt aus Eingaben Ergebnisse. Eine mathematisch korrekte Funktion erzeugt für die gleichen Eingaben **immer** die gleichen Ergebnisse. 
</p>

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Funktion, die für jede Eingabe immer den gleichen Ergebniswert \\( e \\) erzeugt, wird als **konstante Funktion** bezeichnet.
</p>

Für konstante Funktionen gilt die folgende Eigenschaft: 

$$
f(x) \to e
$$

Das bedeutet, dass unabhängig von der Eingabe immer der Wert von \\( e \\) als Ergebnis folgt. 

<p class="alert alert-primary" markdown="1">
**Definition:** Die Eingabe einer Funktion wird als **Parameter** bezeichnet. Eine Funktion kann mehrere Parameter haben. Eine Funktion **akzeptiert** diese Parameter als Eingabe. 
</p>

Per Konvention werden die Parameter einer Funktion in Klammern nach dem Funktionsnamen dargestellt. 

<p class="alert alert-primary" markdown="1">
**Definition:** Eine Funktion, die keine Parameter akzeptiert, wird als **parameterlose Funktion** bezeichnet.
</p>

Eine parameterlose Funktion akzeptiert keine Eingaben. Folgen wir der Definition für *konstante Funktionen*, dann müssten parameterlose Funktionen ebenfalls konstante Funktionen sein. In Programmiersprachen gibt es aber parameterlose Funktionen, die für jeden Aufruf unterschiedliche Ergebnisse liefern. Ein Beispiel für diese Funktionen ist die Funktion `ZUFALLSZAHL()` von EXCEL. Diese Funktion erfüllt die Kriterien für eine mathematisch korrekte Funktion *nicht*. 

Sie können diesen Gedankengang für parametrische Funktionen weiterführen, die für die gleichen Eingaben nicht immer das gleiche Ergebnis erzeugen. 

### Funktionen in EXCEL

EXCEL Funktionen bestehen aus einem Funktionsnamen, einer Parameterliste und einem Ergebnis. Die Funktionsnamen können wir aus dem Menuband `Formeln` ableiten. Bei der Eingabe einer Funktion wird Ihnen eine Schnellübersicht zu den Parametern einer Funktion angezeigt. 

EXCEL kennt nur die eingebauten Funktionen. Sie finden alle verfügbaren Funktionen und eine detaillierte Beschreibung über das Menuband `Formeln`. In diesem Bereich sind alle verfügbaren Funktionen nach Kategorien sortiert aufgeführt. Über die Funktionsleiste oder den Formeleditor haben Sie Zugang zur vollständigen Dokumentation für diese Funktionen. In der Praxis müssen Sie geeignete Funktionen für eine konkrete Aufgabenstellung finden können. 

<p class="alert alert-danger" markdown="1">
Die meisten Aufgaben können nicht durch einen einzigen Funktionsaufruf gelöst werden. In den meisten Fällen **müssen** Sie mehrere Funktionen zu komplexen Operationen *kombinieren*!
</p>

Die Parameter von EXCEL-Funktionen haben eine bestimmte Reihenfolge. Diese Reihenfolge **muss** eingehalten werden, weil EXCEL sonst eine Fehlermeldung erzeugt. In der deutschsprachigen EXCEL-Fassung werden die Parameter durch Semikola getrennt. Gelegentlich sind bestimmte Parameter von EXCEL-Funktionen *optional*. Optional bedeutet, dass diese Werte nur bei Bedarf angegeben werden müssen. In allen anderen Fällen verwendet EXCEL einen geeigneten Wert für die jeweiligen Parameter.

<p class="alert alert-warning" markdown="1">
Achten Sie darauf, dass Sie die Parameterliste der aktuellen Funktion jeweils mit einer schliessenden Klammer beenden. Verlassen Sie sich nicht darauf, dass EXCEL schon weiss, was Sie machen möchten. Gerade in komplexen Formeln führt die "automatische Korrektur" einer Formel zu unerwarteten Effekten.
</p>

### Funktionen in R

In R bilden Funktionen den zentralen Kern der Programmiersprache. Im Gegensatz zu EXCEL wird in R nicht zwischen Operatoren und Funktionen unterschieden. Das bedeutet, dass jeder R-Operator über eine Funktion definiert ist.

In R sind Funktionen immer über drei Eigenschaften definiert: 

1. Die Parameterliste 
2. Die Ergebnisse
3. Die Überführungslogik

Die **Parameter** einer Funktion werden in R durch Kommata getrennt. Die Parameter von R-Funktionen sind immer benannt und können über diese Namen gezielt angesprochen werden.

R-Funktionen haben immer genau ein Datenobjekt als **Ergebnis**. Das können Stichproben, Listen, Vektoren oder auch einzelne Werte sein.

Der **Funktionskörper** legt fest, wie die Parameter in ein Ergebnis überführt werden. Es ist nicht ungewöhnlich, dass ein Funktionskörper eine oder mehrere andere Funktionen aufruft.

Auch R-Funktionen haben Namen. Diese Funktionsnamen sind aber nichts anderes als Variablen, in denen wir auch Daten speichern würden. Auf diese Weise können wir bestehenden Funktionen einen neuen Namen geben.

Das folgende Beispiel illustriert das: 

```R
lese_csv_datei = read_csv   # Beachten Sie, dass hier keine Klammern nach read_csv stehen!
``` 

Anschliessend können wir diesen neuen Namen für Funktionsaufrufe verwenden. 

```R
csvDaten = lese_csv_datei("beispieldaten.csv")
```

Weil R-Operatoren auch Funktionen sind, können wir auch diese umbenennen und als Funktionen verwenden. Weil aber die Operatoren von R als besondere Symbole erkannt werden, müssen wir die Operatoren "schützen", damit wir den Namen des Operatoren und nicht den Operator selbst aufrufen können. Mit dem Akzent-Zeichen (Backtick, `` ` ``) können wir ein Symbol davor schützen, dass R es "wie gewohnt" ausführt. Wir können also den `+`-Operator wie folgt  in eine Funktion mit dem Namen `plus` umwandeln:

```R
plus = `+`
```

Weil der `+`-Operator ein binärer Operator ist, erwartet diese neue Funktion zwei Parameter. Einen für den linken und einen für den rechten Operanden. Jetzt können wir zwei Zahlen wie folgt addieren: 

```R
plus(1, 2)     # ergibt 3
```

<p class="alert alert-warning" markdown="1">
Achten Sie darauf, dass Sie Funktionen aufrufen, indem Sie dem Funktionsnamen eine öffnende und eine schliessende runde Klammer für die Parameterliste anfügen. 
Die Klammern sind auch bei parameterlosen Funktionen verpflichtend. Lassen Sie die Klammern weg, wird der Funktionskörper zurückgegeben aber *nicht* ausgeführt.</p>

Es ist bei R-Funktionen üblich, dass bestimmte Parameter sog. *Vorgabewerte* haben. Diese Werte werden angenommen, wenn ein Parameter nicht explizit übergeben wird. In der Dokumentation erkennen wir diese Vorgaben durch ein Gleichheitszeichen nach dem Parameternamen. 

<p class="alert alert-info" markdown="1">
In R sind Parameter benannt. Beim Aufruf einer Funktion können wir so festlegen, welche Werte welchem Parameter zugewiesen werden, ohne die Position des Parameters zu berücksichtigen. 
</p>

Beispiel: Die Funktion `read_csv()` akzeptiert den Parameter `file`. Dieser Parameter wird als erster Parameter der Funktion angenommen. Durch die Benennung des Parameters können wir die Reihenfolge der Parameter nach unseren Bedürfnissen bzw. zur besseren Lesbarkeit umsortieren. Dadurch sind die folgenden beiden Operationen identisch.

```R
# Operation 1
read_csv("beispiel.csv", FALSE)

# Operation 2
read_csv(col_names = FALSE, file = "beispiel.csv")
``` 

<p class="alert alert-success" markdown="1">
*Konvention:* In der R-Dokumentation sehen Sie, welche Parameter zwingend übergeben werden müssen. Diese Parameter haben in der Dokumentation kein Gleichheitszeichen. Für diese Parameter behalten Sie in aller Regel die Position bei der Parameterübergabe bei.
</p>

Im Gegensatz zu EXCEL können in R auch neue Funktionen erstellt werden. Dadurch kann die Sprache von R erweitert und modernisiert werden. Wir nutzen diese Möglichkeit *meistens*, indem wir Funktionen aus *Funktionsbibliotheken* (oder Paketen) mit der `library()`-Funktion in unsere Arbeitsumgebung laden. 
