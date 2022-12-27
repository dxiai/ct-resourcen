# Sequenzen in R

Sequenzen sind oft hilfreich, wenn wir Daten strukturieren oder organisieren möchten. Wir können Sequenzen auch dafür nutzen, um Werte zu nummerieren. 

Die folgenden **fünf Rezepte** zeigen, wie wir typische Sequenzen mit R erstellen. 

## Rezept 1: Eine Zahlen-Sequenz erstellen

Die `seq`-Funktion erlaubt es uns, eine Sequenz von Zahlen zu *generieren*. Wir können das Verhalten dieser Funktion über vier Parameter steuern.

1. `from`: Der erste Wert der Sequenz,
2. `by`: Die Schrittweite,
3. `to`: Die Obergrenze der Sequenz und 
4. `length`: Die Länge der Sequenz

Alle Parameter müssen Zahlen sein. 

Wir können die Parameter auf verschiedene Arten kombinieren, um verschiedene Listen zu erzeugen. Dabei haben die beiden Parameter `by` und `from` den Wert 1 als Voreinstellung (*default*-Wert). Diese Vorgaben sind immer dann aktiv, wenn wir diesen Parameter nicht explizit an die Funktion übergeben. 

Mit dieser Funktion können wir zwei Arten von Sequenzen erzeugen: 

1. Sequenzen mit einer festen "Obergrenze" (*Limit*)
2. Sequenzen mit einer festen Länge

Wir können die Obergrenze mit dem `to`-Parameter und die Länge mit dem `length`-Parameter festlegen. Wir müssen uns für eine der beiden Arten festlegen, denn die `seq`-Funktion erlaubt es nicht, dass wir `to` und `length` im gleichen Funktionsaufruf verwenden.

Wir erzeugen eine Liste von `1` bis `10` mit dem folgenden Aufruf. 

```
seq(10)
```

Das ist das gleiche wie: 

```
seq(from = 1, to = 10, by = 1)

# Erzeugt: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
```
 
<p class="alert alert-info" markdown="1">
Wenn wir eine Schrittweite > 1 gemeinsame mit einer Obergrenze über den `to`-Parameter angeben, dann erzeugt die Funktion eine entsprechende Sequenz. Das letzte Element dieser Sequenz ist immer kleiner oder gleich der Obergrenze. 
</p>

Die Obergrenze ist nicht immer erwünscht. Häufig benötigen wir Sequenzen mit einer festen Länge. In solchen Fällen verwenden wir den `length`-Parameter. Wir erzeugen dann eine Sequenz mit der gewünschten Länge.

```
seq(from = 1, length = 10, by = 2)  

# Erzeugt: 1, 3, 5, 7, 9, 11, 13, 15, 17, 19
```

## Rezept 2: Umgekehrte Sequenzen erzeugen ("rückwärts zählen")

Wir können umgekehrte Sequenzen erzeugen, indem der Startwert grösser als die Obergrenze ist. In solchen Fällen wechselt die Voreinstellung des `by`-Parameters das Vorzeichen. Wenn wir eine andere Schrittweite als 1 verwenden möchten, müssen wir bei rückwärtszählenden Sequenzen das Vorzeichen der Schrittweite umkehren. 

Wir können eine umgekehrte Sequenz erzeugen, indem wir den grösseren Wert als Startwert dem `from`-Parameter und den kleineren Wert als Endwert dem `to`-Parameter zuweisen. Bei solchen Sequenzen muss die Schrittweite kleiner als 0 sein. 

```R
seq(from = 10, to = 1, by = -1)

#  Erzeugt: 10, 9, 8, 7,  6, 5,  4, 3, 2,  1
```

Selbstverständlich können  wir auch eine Länge angeben. Dabei ist es wichtig, dass wir die richtige negative Schrittweite einfordern. Diese Schrittweite müssen wir explizit dem `by`-Parameter übergeben.

```R
seq(from = 10, length = 5, by = -2)

# Erzeugt: 10, 8, 6, 4, 2
```

## Rezept 3: Doppelpunkt-Operator

Der Doppelpunktoperator ist eine Kurzform für den Aufruf `seq(from, to, by = 1)`. Beim Doppelpunktoperator ist der `by` Parameter immer 1 (bzw. -1 beim Rückwärtszählen).

Die folgenden Operationspaare generieren die gleichen Sequenzen.

```
# Sequenz von 1 bis 10
1:10
seq(from = 1, to = 10, by = 1)

# Sequenz von 5 bis  12
5:12
seq(from = 5, to = 12, by = 1)

# Sequenz von 13 bis 5 (Rückwärts)
13:5
seq(from = 13, to = 5, by = -1)
```

## Rezept 4: Der Einheitsvektor

Der Einheitsvektor ist ein Vektor, für welchen gilt, dass alle Werte gleich 1 sind. Wir können solche Vektoren mit beliebiger Länge mit dem folgenden Aufruf erstellen:

```R
Startwert = 1
Anzahl = 10
seq(Startwert, length = Anzahl, by = 0)

# Erzeugt: 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
```

Wir können diese Operation mit der `rep()` noch etwas weiter vereinfachen: Die `rep()`-Funktion wiederholt einen Wert. Die Funktion erwartet zwei Parameter: Der erste Parameter ist der Wert, der wiederholt werden soll. Dieser Wert entspricht dem Startwert unserer Sequenz. Der zweite Parameter erwartet den Wert, wie oft der erste Wert wiederholt werden soll. 

```R
rep(Startwert, Anzahl)

# Erzeugt: 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
```


<p class="alert alert-info">Wir können jeden beliebigen Wert mit <code>rep()</code> oder <code>seq()</code> wiederholen lassen! Die <code>rep()</code>-Funktion wiederholt auch Zeichenketten und Wahrheitswerte.</p>

## Rezept 5: Wiederholende Sequenzen

Wenn wir eine Sequenz mit einer Länge `l` erzeugen wollen, die sich wiederholt, dann können wir diese mit Hilfe der Modulo-Operation aus einer normalen Sequenz mit der Länge k erzeugen. 

```R
l = 3     # Länge der sich wiederholenden Sequenz
k = 10    # Länge der Gesamtsequenz

sequenz =  seq(1, k) %% l + 1
```

Wenn wir möchten, dass sich eine Sequenz genau w-mal wiederholt, dann müssen wir die Gesamtlänge aus der Länge der Teilsequenz und der Anzahl der Wiederholungen berechnen.

```R
l = 3       # Länge der sich wiederholenden Sequenz
w = 5       # Anzahl der Wiederholungen
k = w * l   # Länge der Gesamtsequenz

sequenz =  seq(1, k) %% l + 1
```
