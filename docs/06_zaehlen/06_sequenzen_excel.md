# Sequenzen mit Excel erstellen

Sequenzen sind in Excel hilfreich, um Daten zu erzeugen oder um Daten zu zählen. 

## Rezept 1: Eine Zahlen-Sequenz erstellen

Mit der `SEQUENZ`-Funktion können wir eine Sequenz von Zahlen *generieren*. Wir können diese Funktion über vier Parameter steuern.

1. `Zeilen`: Die Anzahl der Zeilen, über die sich die Sequenz erstrecken soll;
2. `Spalten`: Die Anzahl der Spalten, über die sich die Sequenz erstrecken soll;
3. `Anfangswert`: Der Startwert der Sequenz;
4. `Schrittweite`: Der Abstand zwischen den Werten einer Sequenz.

Alle Parameter müssen Zahlen sein. 

Mit dieser Funktion können wir zwei Arten von Sequenzen erzeugen: 

1. Horizontale Sequenzen
2. Vertikale Sequenzen

## Rezept 2: Umgekehrte Sequenzen erzeugen ("rückwärts zählen")

Wir können umgekehrte Sequenzen erzeugen, indem wir mit einer negativen Schrittweite arbeiten.

Das folgende Beispiel zählt von `10` bis `1` zurück.

```Excel
=SEQUENZ(10; 1; 10; -1)
```

## Rezept 3: Der Einheitsvektor

Der Einheitsvektor ist ein Vektor in denen alle Werte gleich `1` sind. Wir können einen vertikalen Einheitsvektor mit beliebiger Länge mit dem folgenden Aufruf erstellen:

```Excel
=SEQUENZ(10; 1; 1; 0)
```

Die Länge dieses Vektors wird über die Anzahl der Zeilen festgelegt, über die sich der Vektor erstrecken soll. 

Wir erhalten immer den Wert `1` (oder den Wert, den wir als Anfangswerts angegeben haben), weil wir eine Schrittweite von `0` verwenden. Dadurch wird der Anfangswert nicht verändert, weil die 0 das **neutrale Element** der Addition ist. 

Wir können auch horizontale Einheitsvektoren erstellen, indem wir die Länge des Vektors als die Anzahl von Spalten angeben. Das folgende Beispiel zeigt das für die Länge von 10.

```Excel
=SEQUENZ(1; 10; 1; 0)
```

<p class="alert alert-danger" markdown="1">
Achten Sie darauf, dass bei horizontalen Sequenzen rechts von Ihrer Startadresse genug Platz für Ihre Werte ist. Falls nicht, erhalten Sie den Fehlercode `#ÜBERLAUF`. Das Gleiche gilt für den Bereich unter Ihrer Startadresse bei vertikalen Vektoren.  
</p>

### Rezept 4: Wiederholende Sequenzen erstellen. 

Manchmal wollen wir wiederholende Sequenzen erstellen. Z.B. wollen wir 10 Zeilen jeweils von `1` bis `3` nummerieren. Dazu nutzen wir die Modulo-Operation mit der Länge der zu wiederholenden Sequenz als Teiler.

```Excel
=1 + REST(SEQUENZ(10) - 1; 3)
```