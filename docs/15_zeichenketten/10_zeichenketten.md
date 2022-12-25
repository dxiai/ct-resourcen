
Bisher haben wir Zeichenketten als atomare Werte behandelt. In diesem Abschnitt geht es darum, wie wir Zeichenketten säubern, bearbeiten und aufteilen. 

Neben Zahlen gehören Zeichenketten zu den wichtigsten Datentypen, mit denen wir arbeiten. Wir denken bei Zeichenketten oft als erstes an Worte oder Sätze. Das ist aber eine unzureichende Definition für Zeichenketten. 

<p class="alert alert-primary"><b>Definition:</b> Eine Zeichenkette bezeichnet eine Kette von Symbolen. Symbole können Buchstaben, Ziffern, Satzzeichen, sowie "nicht-druckbare Zeichen".</p>

Eine Zeichenkette hat eine Länge, die der Anzahl der Symbole in der Zeichenkette entspricht und jedes Symbol in einer Zeichenkette kann über dessen Position identifiziert werden.

<p class="alert alert-primary" markdown="1">
Wenn Daten als Zeichenketten vorliegen, dann handelt es sich immer um **diskrete Daten**.
</p>

Das folgende Video erläutert die Anwendung der  Konzepte in EXCEL.

<video width="560" height="315" controls="true"><source src="https://youtu.be/OegVMxatfEs">https://youtu.be/OegVMxatfEs</video>

### Die wichtigsten Zeichenkettenfunktionen in Excel und R.

| Name | Excel | R |
|---|---|---|
| Länge | `LÄNGE()` | `str_length()` |
| Teilketten verbinden | `TEXTKETTE()`/`TEXTVERKETTEN()` | `str_c()` |
| Position einer Teilzeichenkette finden | `FINDEN()`/`SUCHEN()` | `str_locate()`/`str_which()` |
| Teilkette finden (mit Wahrheitswert als Ergebnis) | - | `str_detect()` |
| In Grossbuchstaben umwandeln | `GROSS()` | `str_to_upper()` |
| In Kleinbuchstaben umwandeln  | `KLEIN()` | `str_to_lower()` |
| Nur ersten Buchstaben als Grossbuchstabe  | `GROSS2()` | `str_to_title()` |
| Leerzeichen bereinigen  | `GLÄTTEN()` | `str_squish()`/`str_trim()` |
| Nicht-druckbare Zeichen entfernen | `SÄUBERN()` | `str_replace_all(text, "[\u01-\u07\u0E-\u1f\u80-\u9F]+", "")` | 
| Teilkette extrahieren (Linksseitig) | `LINKS()` | `str_sub(text, 1, x)` |
| Teilkette extrahieren (Rechtsseitig) | `RECHTS()` | `str_sub(text, x, -1)` |
| Teilkette extrahieren (Mittig) | `TEXTTEILEN()` | `str_split()`/`str_sub()` |
| Zeichenkette ersetzen | ``ERSETZEN()`` | ``str_replace()``/``str_replace_all()`` |

In EXCEL entfernt die Funktion ``SÄUBERN()`` nicht-druckbare Zeichen (s.u.) aus einer Zeichenkette. In R verwenden wir dazu die Funktion `str_replace_all()`. Diese Funktion ersetzt einen Teil einer Zeichenkette durch eine andere Zeichenkette. Wir müssen daher R mitteilen, dass wir alle Teilzeichenketten löschen möchten, die nicht-druckbare Zeichen enthalten. Das erreichen wir durch den [***regulären Ausdruck***](https://moodle.zhaw.ch/mod/page/view.php?id=544711) ``"[\u01-\u07\u0E-\u1f\u80-\u9F]+"``. Dieses Suchmuster teilt R mit, welche nicht-druckbaren Zeichen entfernt werden müssen. Das Löschen erreichen wir dadurch, dass wir eine Teilzeichenkette mit der leeren Zeichenkette (s.u.) ersetzen. 

### Einzelne Symbole aus einer Zeichenkette extrahieren

In EXCEL können wir die einzelnen Symbole einer Zeichenkette mit der folgenden Formel extrahieren: 

```
=TEIL("Beispielzeichenkette"; SEQUENZ(LÄNGE("Beispielzeichenkette"));1)
```

<p class="alert alert-info">Ersetzen Sie in der obigen Formel die Zeichenkette durch die Adresse, in der Ihre Zeichenkette steht.</p>

Diese Formel hat drei Funktionsaufrufe. 

1. Mit der Funktion ``LÄNGE()`` bestimmen wir die Anzahl der Symbole in der Zeichenkette.
2. Mit der Funktion ``SEQUENZ()`` nummerieren wir alle Positionen durch, an denen in der Zeichenkette Symbole stehen können.
3. Mit ``TEIL(Zeichenkette; Sequenz; 1)`` extrahieren wir einen Teil der Zeichenkette, wobei wir  für jede Position in der Sequenz aus Schritt 2 eine Teilzeichenkette mit der Länge 1 extrahieren.

<div class="alert alert-info" markdown="1">
In **R** können wir die einzelnen Symbole mit der Operation ``zeichenkette %>% str_extract("")`` extrahieren. 
</div>

<div class="alert alert-warning" markdown="1">
Wenn Sie die Zeichenketten in einem Zeichenkettenvektor in die einzelnen Symbole zerlegen möchten, dann erhalten Sie für jede Zeichenkette einen eigenen Vektor, der die Symbole der Zeichenkette enthält. R kann diese Vektoren nicht einfach zu einem grossen Vektor zusammensetzen. Daher werden die Ergebnisse als Listen geschützt und zu einem Ergebnisvektor zusammengefasst. 

In einem zweiten Schritt können die extrahierten Symbole mit `unnest()` in der Stichprobe erweitert werden.  
</div>

***Beispiel:*** Zeichenkettenvektor in die einzelnen Symbole zerlegen

```R
tibble(zeichenkette = c("Daten", "und", "Information")) %>% 
    mutate(
        symbol = zeichenkette %>% str_extract_all("") 
    ) %>% 
    unnest(symbol)
```

| zeichenkette<br> &lt;chr&gt; | symbol<br> &lt;chr&gt; |
|---|---| 
| Daten | D |
| Daten | a |
| Daten | t |
| Daten | e |
| Daten | n |
| und | u |
| und | n |
| und | d |
| Information | I |
| Information | n |
| Information | f |
| Information | o |
| Information | r |
| Information | m |
| Information | a |
| Information | t |
| Information | i | 
| Information | o |
| Information | n |

Bei solchen Operationen sollten Sie die Quelldaten nicht überschreiben. Erstellen Sie immer einen neuen Vektor für extrahierte Symbole und Zeichenketten. So bleibt der Bezug zu den ursprünglichen Werten erhalten. 

## Nicht-druckbare Zeichen

<p class="alert alert-primary"><b>Definition:</b> Als nicht-druckbare Zeichen werden Symbole bezeichnet, die bei der Darstellung einer Zeichenkette nicht angezeigt werden können. Die nicht-druckbaren Zeichen zählen zur Länge einer Zeichenkette und verändern den Inhalt einer Zeichenkette.</p>

Beispiel: Die Zeichenkette `Hallo` unterscheidet sich von der Zeichenkette `Hal<0x08>lo`. 

EXCEL und R behandeln nicht-druckbare Zeichen unterschiedlich. In EXCEL werden die nicht druckbaren Zeichen für die  Darstellung und für Vergleiche entfernt, jedoch werden die nicht-druckbaren Zeichen bei der Länge und beim Extrahieren berücksichtigt. In R werden nicht-druckbare Zeichen bei der Darstellung und bei Vergleichen berücksichtigt. In Excel können wir mit der `IDENTISCH` zwei Zeichenketten nach den gleichen Regeln wie in R vergleichen.

<p class="alert alert-info" markdown="1">
EXCEL unter Windows stellt nicht-druckbare Zeichen als Kästchen dar, EXCEL für MacOS zeigt diese Zeichen nicht an.
</p>

Zu den nicht-druckbaren Zeichen gehören auch Leerzeichen, Tabulatoren und Zeilenumbrüche. Wir können diese speziellen nicht-druckbaren Zeichen nur erkennen, wenn sie von druckbaren Zeichen umgeben sind.

Deutlich wird das an den folgenden Zeichenketten: 

* `Hallo`
* `Hal<0x07>lo`, wobei das Symbol `0x07` für einen Piepton steht
* `Hal<0x08>lo`, wobei das Symbol `0x08` für ein Rückwärtslöschen steht.

Diese drei Zeichenketten haben in EXCEL und R die Längen 5, 6 und 6. EXCEL stellt alle drei Zeichenketten als "Hallo" dar. Ausserdem werden die Zeichenketten als gleich ausgewertet. R wertet die Zeichenketten aus und stellt nicht-druckbare Zeichen prinzipiell als ein Leerzeichen dar. Das Symbol `0x08` wird von R ausgewertet und es wird entsprechend das vorangehende Symbol gelöscht und in unserem Fall `Halo` angezeigt. Ebenfalls werden alle drei Zeichenketten in R als ungleich ausgewertet.

## Die leere Zeichenkette

Ein besonderer Fall ist die *leere Zeichenkette*. Die leere Zeichenkette wird oft als Platzhalter genutzt. Die leere Zeichenkette ist das *neutrale Element* für die Verknüpfung von Zeichenketten.

<p class="alert alert-primary"><b>Definition:</b> Die <i>leere Zeichenkette</i> hat die Länge 0 und enthält keine Symbole.</p>

<p class="alert alert-warning">In EXCEL lässt sich die leere Zeichenkette von der leeren Zelle nur unterscheiden, indem die Formel betrachtet wird oder die Zelle mit `ISTLEER()` (FALSCH) und `ISTTEXT()` (WAHR) überprüft wird.</p>

Die leere Zeichenkette wird in R immer und in EXCEL nur als Funktionsparameter durch doppelte Anführungszeichen eingerahmt. Soll eine leere Zeichenkette als  Wert in einer Zelle eingegeben werden, dann ist ein einfaches Apostroph (') einzugeben. 

<p class="alert alert-success" markdown="1">
In R dürfen Sie *optional* auch einfache Anführungszeichen verwenden. Weil das einfache Anführungszeichen (') und der Backtick (`) sehr ähnlich aussehen aber eine andere Bedeutung haben, sollte das einfache Anführungszeichen in R nicht verwendet werden. 
</p> 
*Beispiel leere Zeichenkette in einer EXCEL-Formel:*

```
=WENN(1 = 1; ""; "Fehler")
```

*Beispiel leere Zeichenkette in R:*

```
leereZeichenkette = ""
```

<p class="alert alert-success">Wenn in EXCEL eine leere Zeichenkette als Wert in eine Zelle eingetragen werden soll, dann geben wir ein einfaches Anführungszeichen als Wert ein.</p>

*Beispiel für eine leere Zeichenkette als Wert in einer EXCEL-Zelle im Eingabemodus:*

![Leere Zeichenkette als Zellenwert in EXCEL](https://github.com/dxiai/ct-resourcen/raw/main/bilder/leere_zeichenkettewert__excel.png)

<div class="alert alert-info" markdown="1">
**Übungen:** *Leere Zeichenketten mit EXCEL erstellen*

1. Erstellen Sie auf einem neuen Arbeitsblatt eine leere Zeichenkette als Wert an der Adresse A1 ein. 
2. Prüfen Sie, ob die Zeichenkette leer ist, indem Sie die Länge der Zeichenkette mit der Formel `=LÄNGE(A1)` überprüfen. Das Ergebnis muss `0` sein. 
3. Erstellen Sie an der Adresse A2 eine Formel, für die konstante Funktion der leeren Zeichenkette. Überprüfen Sie ebenfalls die Länge dieser Zeichenkette.
4. Überprüfen Sie beide Zellen aus Schritt 1 und 3 mit der Funktion `ISTLEER()`. In beiden Fällen sollten Sie `FALSCH` als Ergebnis erhalten.
</div>
