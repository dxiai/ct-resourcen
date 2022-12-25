R kennt das Konzept der Variablen, in welchen wir Zwischenergebnisse für die spätere Verwendung abspeichern. Normalerweise entsprechen EXCEL-Adressen diesem Konzept. Gerade bei Matrizen und bestimmten Transformationen ist das Zwischenspeichern von Werten auf einem Arbeitsblatt unhandlich, behindert die Übersichtlichkeit oder führt zu unerwarteten Ergebnissen. Mit der Funktion `LET()` können wir Hilfsvariablen anlegen und so EXCEL-Formeln stark vereinfachen. 

**Problem:** Eine Funktion wird in einer Operation mit den gleichen Parametern mehrfach aufgerufen. 

Dieses Problem tritt häufig im Zusammenhang mit Entscheidungen auf. 

### Lösung: Die `LET()`-Funktion

EXCELs `LET()`-Funktion erlaubt uns komplizierte Formeln, in denen sich Teile wiederholen, durch Variablen zu vereinfachen.

**Beispiel**

```EXCEL
=LET(VariablenName; INDEX('Unbearbeitete Daten'!A:F;A2#;B1#); WENN(ISTLEER(VariablenName);#NV;VariablenName))
```

Mit EXCELs LET() Funktion können mehr als eine Variable erstellt werden. Dadurch können  Formeln in überschaubare Teilschritte  gegliedert werden.

### LET() und leere Zellen 

<a href="Beispiel_LET.xlsx" class="btn btn-lg btn-primary"><i class="fa fa-lg fa-download"></i> Vollständiges Beispiel</a>

Die Besonderheiten der leeren Zelle wurde schon mehrfach angesprochen. In diesem Abschnitt gehen wir auf eine weitere Besonderheit ein. 

<div class="alert alert-success" markdown="1">
Eine EXCEL-Operation **muss** einen Wert als Ergebnis haben. Wird ein nicht vorhandener Wert (d.h. leere Zelle) in einem Ergebnis gefunden, dann wird das Ergebnis der Operation automatisch in den Wert `0` umgewandelt. Diese Umwandlung passiert jedoch erst nachdem die Operation abgeschlossen ist und EXCEL das Ergebnis auf dem Arbeitsblatt ablegt. 

Dieses Verhalten hat zur Folge, dass solange eine Operation nicht abgeschlossen ist, die nicht vorhandenen Werte in ihrer ursprünglichen Form erhalten bleiben. Es ist also möglich diese Werte mit `ISTLEER()` zu prüfen. 
</div>

Die ursprünglichen Daten können unvollständig sein und enthalten dann leere Zellen an den entsprechenden Zellen. Diese fehlenden Werte wollen wir mit dem *Fehler* `#NV` (lies: *Nicht Vorhanden*) austauschen. Dieser Fehlerwert wird nicht automatisch in den Wert `0` umgewandelt und wir können anschliessend die fehlenden Werte korrekt bearbeiten. 

Die Umfänge der Stichprobe wurden im Beispiel bereits bestimmt. Wir wollen nun die Werte in Vektoren umwandeln und die leeren Zellen berücksichtigen. Das lösen wir mit einer *Entscheidung* mit der folgenden `WENN()` Funktion: 

**Beispiel**

```EXCEL
=WENN(ISTLEER(INDEX('Unbearbeitete Daten'!A:F;A2#;B1#));#NV;INDEX('Unbearbeitete Daten'!A:F;A2#;B1#))
```

Der *logische Ausdruck* prüft, ob ein Feld mit dem Index `F2#` und `G2#` im Stichprobenobjekt leer ist. Falls das Feld in den unbearbeiteten Daten leer ist, dann wird der Wert `#NV` als Ergebnis zurückgegeben. Sonst soll der Wert im Feld übergeben. 

In dieser Operation wird die Funktion `INDEX()` zwei Mal mit den gleichen Parametern aufgerufen. Das ist unpraktisch, weil wir unsere Operation an zwei Stellen anpassen müssen, wenn unsere Daten mehr oder weniger Spalten haben.  Besser wäre es, wenn das Zwischenergebnis der `INDEX()`-Funktion aus der Operation herausgelöst wird und über eine Funktionsverkettung eingebunden wird. Das ist aber nicht möglich, weil EXCEL bei diesem Zwischenschritt die fehlenden Werte in `0` ändert, so dass anschliessend der logische Ausdruck immer `FALSCH` liefern würde.

Mittels der `LET()` Funktion können wir das Ergebnis dieses Zwischenschritts in einer temporären Variablen speichern. Der Vorteil gegenüber der normalen Funktionsverkettung ist, dass für EXCEL die Operation nicht abgeschlossen ist und deshalb die fehlenden Werte *noch nicht* in den Wert `0` umgewandelt werden. Der logische Ausdruck in der `WENN()`-Funktion kann also `WAHR` ergeben, wenn in den Daten ein Wert fehlt. Ausserdem können wir für den Fall, dass ein gültiger Wert in dem Feld steht, diesen Wert verwenden. 

Wir können die Operation also dahingehend vereinfachen, dass wir den Aufruf der `INDEX()`-Funktion "ausklammern" und in der Hilfsvariable `Feld` speichern. 

**Vereinfachte Lösung**

```EXCEL
=LET(Feld; INDEX('Unbearbeitete Daten'!A:F;A2#;B1#); WENN(ISTLEER(Feld);#NV;Feld))
```

Damit wird der Aufruf der `WENN()`-Funktion vereinfacht, weil wir nun nur noch unsere Hilfsvariable `Feld` übergeben müssen. Wir behalten dabei im Hinterkopf, dass wir auch hier eine Funktionsverkettung machen. Die Verkettung läuft in diesem Fall aber nicht über eine Adresse auf einem Arbeitsblatt, sondern über die Hilfsvariable. 