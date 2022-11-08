
Beim Filtern geben wir einen logischen Ausdruck an, um Datensätze aus unseren Daten herauszufiltern. Diese allgemeine Funktion erlaubt uns viele Aufgaben einfach und nachvollziehbar zu lösen.

Für die folgenden Überlegungen benötigen wir einen neuen Begriff. 

<p class="alert alert-primary" markdown=1>
**Definition:** Ein Vektor wird als **Index** bezeichnet, wenn dieser eindeutige Werte zum Extrahieren von Datensätzen enthält. (**Achtung:** Verwechseln Sie den Begriff nicht mit der EXCEL-Funktion `INDEX()`!). 
</p>

### Spezialfall: Einen Datensatz mit einer eindeutigen Referenz filtern

Recht häufig müssen wir Daten aus einer Stichprobe extrahieren, wobei in der Stichprobe ein Vektor nur eindeutige Werte hat. Wenn wir den eindeutigen Wert für einen Datensatz kennen, können wir diesen Datensatz durch einen direkten Vergleich aus unserer Stichprobe herausfiltern. 

Gehen wir davon aus, dass der Vektor mit den eindeutigen Werten im Bereich `C2:C10` liegt und der gesuchte Wert liegt an der Adresse `A2`. Die Werte, die uns interessieren liegen im Bereich `D2:D10`. Wir können diesen Wert mit dem folgenden Filter auslesen: 

***Beispiel 1: Filter mit einer Referenz***

```EXCEL
= FILTER(D2:D10; C2:C10 = A2)
```

<p class="alert alert-primary" markdown=1>
**Definition:** Ein Vektor wird als **Referenz** bezeichnet, wenn dieser Suchwerte für einen Index enthält.
</p>

Weil für diesen Spezialfall sichergestellt ist, dass alle Werte in `C2:C10` genau einmal vorkommen, hat der Filter genau einen Wert als Ergebnis. Existiert der Wert nicht, erhalten wir ein leeres Ergebnis bzw. den Fehler `#KALK!`. Anstatt des Fehlers können wir diesem Fall einen Wert anzeigen lassen. Dieser Wert wird im Parameter `wenn leer` angegeben.

Wenn wir mehrere Referenzen haben, dann können wir diesen Filter nicht gut verallgemeinern, weil EXCEL zwei Bereiche immer paarweise vergleicht. Der folgende Filter ergibt nicht unser erwünschtes Ergebnis: 

***Beispiel 2: nicht funktionierender Filter mit mehreren Referenzen***

```EXCEL
= FILTER(D2:D10; C2:C10 = A2:A5)
```

Dieser Filter gibt uns nur die Datensätze zurück, in denen die Werte im Index und im Referenzvektor zufällig gleich sind. Um alle Datensätze für die gegebenen Referenzen zu erhalten, müssen wir den logischen Ausdruck explizit formulieren: 

***Beispiel 3: funktionierender Filter mit mehreren Referenzen***


```EXCEL
= FILTER(D2:D10; (C2:C10 = A2) + (C2:C10 = A3) + (C2:C10 = A4)  + (C2:C10 = A5))
```

Für vier Referenzen ist das gerade noch erträglich. Mit mehreren Referenzen werden die Ausdrücke immer länger und lassen sich kaum noch überprüfen. Das Problem mit solchen logischen Ausdrücken ist ausserdem, dass wir zwar ein Ergebnis erhalten. Leider können wir aus diesem Ergebnis nicht mehr reproduzieren, zu welcher Referenz ein Datensatz gehört. 

Hier kommt die Funktion `XVERWEIS()` ins Spiel: `XVERWEIS()` entspricht im einfachsten Fall dem Filter aus Beispiel 1. Allerdings sind die Parameter etwas anders organisiert. Unser Filter müsste daher so geschrieben werden. 

***Beispiel 4: Filtern mit `XVERWEIS()`***

```EXCEL
= XVERWEIS(A2; C2:C10; D2:D10, "Wert falls A2 nicht gefunden wurde")
```

Hierbei müssen wir beachten, dass `XVERWEIS()` **immer** genau einen Datensatz für jede Referenz als Ergebnis hat, selbst wenn die `FILTER()`-Funktion mehrere Datensätze als Ergebnis zurückgeben würde. Das liegt daran, dass `XVERWEIS()` erwartet, dass der zweite Parameter als Index dient und daher nur den ersten Treffer als Ergebnis liefert. Die Funktion stellt dabei sicher, dass für jede Referenz genau ein Ergebnis erzeugt wird. 

Die Funktion `XVERWEIS()` hat den entscheidenden Vorteil, dass wir einen Referenzvektor als ersten Parameter übergeben dürfen, was ja mit der `FILTER()` Funktion nicht funktioniert. Wir können also die folgende Formel schreiben. 

***Beispiel 5: mehrfaches Filtern mit `XVERWEIS()`***

```EXCEL
= XVERWEIS(A2:A5; C2:C10; D2:D10; "Wert falls A2:A5 nicht gefunden wurde")
```
In diesem Fall werden vier `FILTER`-Aufrufe durchgeführt und abschliessend zu einem Gesamtergebnis zusammengefasst. 

<p class="alert alert-info" markdown=1>
Die Funktion `XVERWEIS()` baut auf den Funktionen `XVERGLEICH()` und `INDEX()` auf. Dabei können eventuell fehlende Werte automatisch abgefangen werden. Dadurch wird unsere Logik einfacher und flexibler. 
</p>

### Rezept: Prüfen, ob ein Wert in einer Liste (nicht) existiert

Die Funktion `XVERWEIS()` prüft automatisch, ob ein Suchwert in einem Vektor vorhanden ist. Falls der Suchwert nicht im Index vorkommt, erhalten wir einen Fehler bzw. einen vordefinierten Wert. `XVERWEIS()` gibt uns als Ergebnis den korrespondierenden Wert des Ergebnisvektors aus.  Gelegentlich wollen wir Wahrheitswerte als Ergebnis erhalten, wobei `WAHR` für *gefunden* und `FALSCH` für *nicht gefunden* steht (oder umgekehrt).

In solchen Fällen müssen wir einen geeigneten Ergebnisvektor erzeugen. Dabei gehen wir wie folgt vor: 

1. Vergleich der einzelnen Werte im Index mit sich selbst, wobei Vergleich auf Gleichheit (mit `=`)  immer das Ergebnis `WAHR` und der Vergleich auf Ungleichheit (mit `<>`) immer das Ergebnis `FALSCH` liefert. Für diesen konstanten Vektor gibt es zwei Formeln, wenn `A1:A10` für den Indexbereich angenommen wird. Konkrete Lösungen müssen den Bereich jeweils anpassen. 
  1. `= A1:A10 = A1:A10` für den konstanten Wahrheitsvektor `WAHR` und 
  2. `= A1:A10 <> A1:A10` für den konstanten Wahrheitsvektor `FALSCH`.

2. Filter der Suchwerte im Index und dem Ergebnisvektor auf den in 1. erzeugten konstanten Wahrheitsvektor. Falls ein Suchwert nicht gefunden wurde, dann muss der negierte Wahrheitswert des Ergebnisvektors zurückgegeben werden. Das erreichen wir durch die Formel `= XVERWEIS(C1:C2; A1:A10; B1#, NICHT(B1))`, wobei `C1:C2` der Suchvektor ist, `A1:A10` der Index und `B1#` der konstante Wahrheitsvektor aus Schritt 1 ist. Die Funktion `NICHT(B1)` erzeugt den gegenteiligen Wahrheitswert, der im konstanten Wahrheitsvektor steht. 

### Rezept: Werte kodieren

Beim Kodieren weisen wir einem Ausgangswert einen (bestimmten) Zielwert zu. Die Funktion `XVERWEIS()` unterstützt uns dabei. Dabei befolgen wir die folgenden Schritte: 

1. Wir erstellen eine Übersetzungs- bzw. Zuordnungstabelle, in der alle Ausgangswerte ihren Zielwerten zugeordnet sind. 
2. Wir übersetzen (*kodieren*) jeden Wert in unserer Stichprobe mit den entsprechenden Ersetzungen aus der Zuordnungstabelle, indem wir die Stichprobenwerte als Suchwerte verwenden. Das erreichen wir mit der folgenden Formel: `= XVERWEIS(Daten!A1:A100; A1:A5; B1:B5)`, wobei `A1:A5` für den Vektor mit den Ausgangswerten und `B1:B5` für den Vektor mit den Zielwerten steht: 

<p class="alert alert-success" markdown=1>
Am besten werden Übersetzungs- bzw. Zuordnungstabellen auf **separaten Arbeitsblättern** geführt.  
</p>

### Rezept: Das letzte Vorkommen eines Wertes überprüfen

Normalerweise sucht `XVERWEIS()` von oben nach unten. Das ist in Ordnung, wenn wir Indices mit eindeutigen Werten haben. Wenn unsere Daten chronologisch sortiert sind und der letzte Eintrag für jeden Indexwert als letzter Eintrag in unserer Stichprobe vorliegt, dann können wir  diese Einträge *referenzieren*, indem die Suchrichtung von `XVERWEIS()` *invertiert* wird. 

```EXCEL
=XVERWEIS(A1:A3; C1:C20; D1:D20;-1;0;-1)
```

Die `-1` als letzter Parameter zeigt an, dass wir von den letzten Werten aus und nicht von den ersten Werten aus filtern möchten. 
