<p class="alert alert-primary" markdown="1">
**Definition:** Als **reguläre Ausdrücke** werden Zeichenketten bezeichnet, mit denen *komplexe Suchmuster* für Zeichenketten beschrieben werden können. Ein regulärer Ausdruck beschreibt die Struktur der zu suchenden Zeichenkette. 
</p>

Reguläre Ausdrücke sind eine Standardtechnik zum Suchen-und-Ersetzen. Sie können z.B. in Jupyter Notebooks eingesetzt werden, um Variablen umzubenennen.

Anders als Excel verfügt R über eine leistungsfähige Mustererkennung für Zeichenketten. Diese Mustererkennung steuern wir über [*reguläre Ausdrücke*](https://stringr.tidyverse.org/articles/regular-expressions.html) oder *Regulärausdruck* (Sauer, 2019). Reguläre Ausdrücke erlauben uns, Muster in Zeichenketten zu finden und diese Muster durch etwas anderes auszutauschen. In R schreiben wir reguläre Ausdrücke als Zeichenketten mit einer besonderen Musterbeschreibungssprache. Wir können an viele Zeichenkettenfunktionen solche regulären Ausdrücke als Parameter übergeben. 

Die wichtigsten Elemente zur Musterbeschreibung mit regulären Ausdrücken sind die folgenden Symbole und Symbolkombinationen: 

* `.` - beschreibt das Vorkommen eines beliebigen Symbols
* `\s` - beschreibt alle Symbole die als Leerzeichen gelten
* `\d` - beschreibt alle Ziffern
* `\w` - beschreibt alle Buchstaben unabhängig von der Gross- und Kleinschreibung
* `*` - beschreibt das Auftreten von Sequenzen von 0 oder mehreren der voranstehenden Symbole
* `+` - beschreibt das Auftreten von Sequenzen von 1 oder mehreren der voranstehenden Symbole
* `?` - beschreibt das Auftreten von Sequenzen  von 0 oder 1 des voranstehenden Symbols
* `{}` - beschreibt das Auftreten von Sequenzen der angegebenen Länge des voranstehenden Symbols
* `^` - steht für den Anfang der Zeichenkette
* `$` - steht für das Ende der Zeichenkette
* `[]` - "Symbolbereich": Die Symbole zwischen den beiden Klammern beschreiben die möglichen Symbole an der Position in der Zeichenkette
* `()` - Gruppiert eine Teilzeichenkette

#### Normale Zeichen in Mustern

Normale Buchstaben oder Ziffern haben keine besondere Bedeutung und bedeuten, dass an der entsprechenden Stelle das jeweilige Symbol vorkommen muss.

```R
zeichenkettenVektor = c( "Daten und Information", "Datenverarbeitung", "Informatik", "Daten Information", "Computation Daten Informatik" )

# der reguläre Ausdruck wäre eigentlich "\w\s\w" die zusätzlichen Backslashs 
# zeigen R an, dass wir den Backslash in unserem Muster haben möchten.

regulaererAusdruck = "Daten In"

zeichenkettenVektor %>% str_detect(regulaererAusdruck) 
# erzeugt c(FALSE FALSE FALSE TRUE TRUE)
```

#### Mustersymbole in R verwenden

Wenn wir ein Symbol in unserem Muster aufnehmen wollen, das normalerweise ein besonderes Symbol für reguläre Ausdrücke ist, dann müssen wir diesem Symbol einen *Backslash* voranstellen. Dieses Voranstellen wird als **"Escaping"** bezeichnet. Weil R reguläre Ausdrücke als Zeichenketten behandelt, müssen wir aufpassen, denn der Backslash ist auch ein reserviertes Symbol in Zeichenketten. Deshalb ist der zweite Backslash notwendig, um den ersten Backslash vor der Zeichenketteninterpretation zu schützen. 

```R
zeichenkette = "Daten und Information"

# der reguläre Ausdruck wäre eigentlich "\w\s\w" die zusätzlichen Backslashs 
# zeigen R an, dass wir den Backslash in unserem Muster haben möchten.

regulaererAusdruck = "\\w\\s\\w"

zeichenkette %>% str_replace(regulaererAusdruck, "p x") # erzeugt "Datep xnd Information"

# Hinweis, um alle Vorkommnisse des Musters auszutauschen, müssen wir 
# str_replace_all() verwenden!
```

### Multiplikatoren

Die Symbole `*`, `+`, `?` und `{}` werden als *Multiplikatoren* bezeichnet. So können Wiederholungen in Mustern abgebildet werden. 

Mit diesen Elementen können wir Zeichenketten beschreiben, ohne die genaue Abfolge der Symbole zu kennen.

Beispiele: 

```
"ab"       # erkennt ab
"a?b"      # erkennt b und ab
"a*b"      # erkennt b, ab, aab, aaab, aaaab usw. 
"a+b"      # erkennt ab, aab, aaab, aaaab usw. 
"a{2}b"    # erkennt aab
"a{2,4}b"  # erkennt aab, aaab und aaaab
"a.b"      # erkennt aab, acb, adb, a3b, a-b usw. 
"a.*b"     # erkennt ab, acb, acdb, a-!%b usw. 

"a\\sb"    # erkennt "a b" oder "a     b" (Achtung doppelter Backslash!)
"\\w\\d"   # erkennt einen Buchstaben, der von einer Ziffer gefolgt wird  (Achtung doppelter Backslash!)
"a[cd]?b"  # erkennt ab, acb und adb

"ab$"      # erkennt ab nur am Ende der Zeichenkette
"^ab"      # erkennt ab nur am Anfang der Zeichenkette
```

<p class="alert alert-info">Gelegentlich wollen wir ein Muster bis zu einem bestimmten Symbol in unserer Zeichenkette finden. In diesem Fall können wir einen negierten Symbolbereich angeben.</p>

Beispiel: 

Gegeben ist die folgende Zeichenkette: 

```
aquaponics = "The term aquaponics [7] is coined by combining two words: aquaculture, which refers to 
 fish farming, and hydroponics—the technique of growing plants without soil.[16]"
```

Wir möchten nun die Zeichenkette ab dem Wort `term` und der öffnenden eckigen Klammer der Referenz markieren. D.h. wir wollen nicht ein beliebiges Zeichen und wollen nicht alle Symbole bis auf die öffnende Klammer explizit ausschliessen. Stattdessen können wir einen *negierten* Symbolbereich angeben. In unserem Fall erlauben wir jedes Zeichen, ausser die öffnende eckige Klammer. Weil die eckige Klammer eine besondere Bedeutung für reguläre Ausdrücke hat, müssen wir sie entsprechend mit Backslash "escapen". Unser regulärer Ausdruck muss entsprechend `"termn [^\\[]+\\["`. Der Teil `[^\\[]+` bedeutet dabei, "alle Symbole ausser der öffnenden eckigen Klammer `[`. Die beiden Backslashs sind dabei die notwendige Escape-Sequenz, um die Klammer vom Symbolbereich zu unterscheiden. 

Der folgende Code demonstriert diesen regulären Ausdruck.

```
aquaponics %>%
    str_match("term [^\\[]+\\[")
```

Das Ergebnis eines regulären Ausdrucks ist normalerweise immer nur der erste Treffer. 

```
"term aquaponics ["
```

Um alle Treffer eines Musters zu erhalten, muss für die entsprechende `_all`-Variante der Funktion verwendet werden. Die folgenden Funktionen haben eine solche Funktionsvariante:

| Bedeutung | Erster Treffer | Alle Treffer |   
| :--- | :--- | : --- | 
| Finde und extrahiere ein Suchmuster | `str_extract()` | `str_extract_all()` | 
| Finde ein Suchmuster und gebe die Zeichenkette zurück | `str_match()` | `str_match_all()` | 
| Finde ein Suchmuster und gebe die Position des Treffers zurück | `str_locate()` | `str_locate_all()` | 
| Finde und lösche ein Suchmuster  | `str_remove()` | `str_remove_all()` | 
| Finde ein Suchmuster und ersetze den Treffer durch eine andere Zeichenkette  | `str_replace()` | `str_replace_all()` | 
| Zeige Suchtreffer für ein Suchmuster an | `str_view()` | `str_view_all()` | 

Sie finden eine umfangreiche Einführung und Anwendungsbeispiele zu regulären Ausdrücken hier:

<a href="http://r4ds.had.co.nz/strings.html" target="_blank"><p class="btn btn-warning">
<i class="fa fa-lg fa-external-link"></i> Reguläre Ausdrücke vertiefen</p></a>

<a href="https://stringr.tidyverse.org/articles/regular-expressions.html" target="_blank"><p class="btn btn-warning">
<i class="fa fa-lg fa-external-link"></i> Reguläre Ausdrücke weiter vertiefen</p></a>
