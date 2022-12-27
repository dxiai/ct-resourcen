R kennt diskrete Daten in zwei Varianten. 

1. Diskrete Daten als Abfolge von Werten in einem Vektor.
2. Diskrete Daten als Faktor.

Base-R-Funktionen wie `read.csv()` oder `data.frame()` erstellen automatisch Faktoren, wenn diskrete Daten erkannt werden. Diese Daten werden immer dann erkannt, wenn es sich nicht um Zahlenwerte handelt. Dieser Automatismus ist nicht immer erwünscht, weil nicht alle Daten automatisch Faktoren sind, wenn die Werte keine Zahlen sind, und weil ordinalskalierte Daten oft mit Zahlen erhoben werden. Deshalb lesen die modernen Funktionen der `tidyverse`-Bibliothek Daten grundsätzlich als Vektoren atomarer Datentypen ein. So können wir entscheiden, ob ein Vektor als Faktor behandelt werden soll oder nicht. 

Wir erkennen Faktoren in Stichprobenobjekten von R am Symbol ``<fct>`` für den Datentyp und können mit der Funktion ``is.factor()`` prüfen, ob ein Vektor ein Faktor ist. In R ist ein Faktor ein *komplexer Datentyp*, der neben den Werten auch den geordneten Wertebereich speichert. Dieser Wertebereich wird in R als `levels` bezeichnet. Der Wertebereich eines Faktors bildet also die "*Ausprägungen*" bzw. "Ebenen" (engl. levels) der diskreten Daten ab. 

### Verwendung von Faktoren in R 

Neben der Bedeutung für die Empirie sind Faktoren in R auch für die Darstellung von Daten von Bedeutung. Dabei wird die Ordnung der Faktorstufen für die Anordnung von Ergebnissen verwendet, die mit Hilfe eines Faktors berechnet wurden. Diese Ordnung wird von ggplot aber auch für Ergebnisse von gruppierten Daten verwendet. Die Verwendung von Faktoren für solche Aufgaben hat den Vorteil, dass die Reihenfolge der Datensätze nicht verändert werden muss.  

Die folgenden Beispiele verwenden  die Stichprobe `digitales_umfeld.csv`

```R
digitales_umfeld = read_delim("digitales_umfeld.csv")
```

Wenn wir zum Beispiel die Anzahl der Mobilgerätetypen bestimmen möchten, dann können wir naiv vorgehen: 

```R
digitales_umfeld %>% 
    group_by(mobilgeraet) %>% 
    count()
```

| mobilgeraet <br>&lt;chr&gt; | n<br> &lt;int&gt; |
|---|---| 
| Android Smartphone | 64 | 
| iPhone | 69 | 
| Mobiltelefon | 2 |

Wenn wir die häufigste Nennung eines Mobilgeräts als erstes in dieser Tabelle stehen haben möchten, dann bietet sich die Verwendung eines Faktors mit organisierten Faktorstufen an. 

```R
digitales_umfeld %>% 
    mutate(
        mobilgeraet = mobilgeraet %>% as_factor() %>% fct_infreq()
    ) %>% 
    group_by(mobilgeraet) %>% 
    count()
```

| mobilgeraet <br>&lt;chr&gt; | n<br> &lt;int&gt; |
|---|---| 
| iPhone | 69 | 
| Android Smartphone | 64 | 
| Mobiltelefon | 2 |

### Erstellen von Faktoren

Faktoren sind ein zentraler Bestandteil von R. Ohne die `tidyverse` Bibliothek kann ein Faktor mittels der Funktion `factor()` erstellt werden. 

Gegeben sei zum Beispiel der Vektor mit den Namen der Studiengänge des ZHAW Departements LSFM:

```R
Studiengaenge = c(
    "Chemie", 
    "Umweltingenieurwesen", 
    "Facility Management", 
    "Biotechnologie", 
    "Lebensmitteltechnology",
    "Applied Digital Life Sciences", 
    "Biomedical Labordiagnostik"
)
```

Dieser Vektor enthält nur Zeichenketten und ist daher ein Zeichenkettenvektor. Der Funktionsaufruf ``is.factor(Studiengaenge)`` gibt entsprechend ``FALSE`` als Ergebnis zurück. 

Dieser Vektor kann einfach in einen Faktor umgewandelt werden.

```R
stgFaktor = Studiengaenge %>% factor()

stgFaktor
```

* Chemie
* Umweltingenieurwesen
* Facility Management
* Biotechnologie
* Lebensmitteltechnology
* Applied Digital Life Sciences
* Biomedical Labordiagnostik

Das Ergebnis unterscheidet sich nicht wesentlich vom ursprünglichen Vektor. Wir können mit dem Aufruf ``is.factor(stgFaktor)`` überprüfen, ob es sich nun um einen Faktor handelt. Wir erhalten nun ``TRUE`` als Ergebnis. 

Wir können nun mit der Funktion ``levels()`` die Faktorstufen abfragen. Diese Funktion gibt uns einen Vektor mit allen Faktorstufen zurück.

```R
stgFaktor %>% 
    levels()
```

* Applied Digital Life Sciences
* Biomedical Labordiagnostik
* Biotechnologie
* Chemie
* Facility Management
* Lebensmitteltechnology
* Umweltingenieurwesen

Dieses Ergebnis ist etwas überraschend, weil die Reihenfolge der Faktorstufen nicht mehr mit der Reihenfolge der Werte in unserem Vektor übereinstimmt. Wir sehen am Ergebnis, dass die Funktion ``factor()`` die Annahme macht, dass unsere Faktorstufen alphabetisch sortiert sind. Leider ist das oft nicht der Fall und gerade bei unsortierten Faktoren müssen die Werte Präsentationen oft neu arrangiert werden. Deshalb hat sich die Konvention eingebürgert, für die initiale Reihenfolge von Faktorstufen das erste Auftreten des jeweiligen Werts zu wählen. Dazu müssen wir der ``factor()``-Funktion auch die Faktorstufen mitgeben. 

```R
stgFaktor = Studiengaenge %>%
    factor(
         # erzeugt alle Faktorstufen in der Reihenfolge des ersten Auftretens, 
         # selbst wenn Werte doppelt auftreten. 
        Studiengaenge %>% unique() 
    )
```

Nun können wir mit der ``levels()``-Funktion die Reihenfolge der Faktorstufen überprüfen.

Weil diese Vorgehensweise eine Konvention moderner R-Programmierung ist, gibt es eine Funktion, die uns diesen Schritt kompakter schreiben lässt. Dazu verwenden wir die Funktion ``as_factor()``.

```R
stgFaktor = Studiengaenge %>%
    as_factor()
```

<p class="alert alert-success" markdown="1"> 
Wenn wir einzelne Vektoren in einem Stichprobenobjekt in Faktoren umwandeln wollen, dann führen wir eine Umwandlung mit ``mutate()`` durch. 
</p>

Wir wollen nur den Vektor ``mobilgeraet``,  ``geschlecht`` und ``digitalisiert`` in Faktoren umwandeln.

```R
digitales_umfeld %>% 
    mutate(
        mobilgeraet = mobilgeraet %>% as_factor(),
        geschlecht = geschlecht %>% as_factor(),
        digitalisiert = digitalisiert %>% as_factor()
    ) -> duFaktorisiert 

duFaktorisiert
```

| geschlecht<br> &lt;fct&gt; | alter<br> &lt;dbl&gt; | tage <br>&lt;dbl&gt; | monate <br>&lt;dbl&gt; | geburtsjahr<br> &lt;dbl&gt; | digitalisiert<br> &lt;fct&gt; | mobilgeraet<br> &lt;fct&gt; | 
|---|---|---|---|---|---|---|
| Männlich | 23 | 8474 | 278 | 1998 | 3 | iPhone | 
| Männlich | 27 | 9970 | 327 | 1994 | 6 | Android Smartphone | 
| Männlich | 27 | 10131 | 332 | 1994 | 6 | iPhone | 
| Weiblich | 25 | 9253 | 304 | 1996 | 5 | Android Smartphone | 
| Männlich | 25 | 9363 | 307 | 1996 | 6 | iPhone | 
| Andere | 23 | 8750 | 287 | 1997 | 2 | iPhone | 
| ... | ... | ... | ... | ... | ... | ... | 

Wir sehen nun, dass die faktorisierten Vektoren nun den Datentyp Factor (``fct``) haben.

### `forcats` - Faktoren leicht gemacht

Die Arbeit mit Faktoren ist in Base-R nicht immer ganz einfach. Wollschläger (2017, Kap. 2.6) zeigt detailliert wie Faktoren mit R erstellt und manipuliert werden. Das ist zum Teil recht komplex und aufwändig. Zum Glück versteckt die [`forcats`-Bibliothek](https://forcats.tidyverse.org/reference/){target=_blank} die Komplexität von R-Faktoren vor uns, sodass wir präzise ausdrücken können, wie wir die interne Struktur unserer diskreten Daten organisieren möchten.

<p class="alert alert-info" markdown="1">
**Hinweis:** Die Funktionen der ``forcats``-Bibliothek sind verfügbar, sobald Sie die ``tidyverse``-Bibliothek eingebunden haben.
</p>

Die `forcats`-Bibliothek bietet neun Funktionen zum Umorganisieren von Faktoren.

<table style="width: 100%;">
<caption></caption>
<thead>
<tr>
<th scope="col"><span style="font-weight: normal;"><a href="https://forcats.tidyverse.org/reference/fct_relevel.html" target="_blank">fct_relevel()</a></span></th>
<th scope="col">Legt die Reihenfolge der Faktorwerte (level) manuell über eine Liste fest. Erstellen Sie die Liste auf Basis der Werte, die Sie mit distinct() für den jeweiligen Vektor erhalten.&nbsp;</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_inorder.html" target="_blank">fct_inorder()</a></td>
<td>Legt die Reihenfolge der Faktorwerte in der Reihenfolge ihres Erscheinens in der Stichprobe fest (wie beim Einlesen von Tabellen).</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_inorder.html" target="_blank">fct_infreq()</a></td>
<td>Legt die Reihenfolge der Faktorwerte in der Reihenfolge der Häufigkeit der Nennwerte in der Stichprobe fest. Der häufigste Nennwert wird zuerst gereiht.</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_inorder.html" target="_blank">fct_inseq()</a></td>
<td>Legt die Reihenfolge der Faktorwerte in ihrer Sortierung (alphabetisch oder numerisch) fest. Der niedrigste Nennwert wird zuerst gereiht.&nbsp;</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_reorder.html" target="_blank">fct_reorder()</a></td>
<td>Legt die Reihenfolge der Faktorwerte in der Sortierung <b><i>eines</i></b> anderen Vektors fest.&nbsp;</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_reorder.html" target="_blank">fct_reorder2()</a></td>
<td>Legt die Reihenfolge der Faktorwerte in der Sortierung mit Hilfe eines anderen Vektors fest.</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_shuffle.html" target="_blank">fct_shuffle()</a></td>
<td>Mischt die Reihenfolge der Faktorwerte zufällig.</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_rev.html" target="_blank">fct_rev()</a></td>
<td>Kehrt die aktuelle Reihenfolge um.&nbsp;</td>
</tr>
<tr>
<td><a href="https://forcats.tidyverse.org/reference/fct_shift.html" target="_blank">fct_shift()</a></td>
<td>Reiht den ersten Faktorwert ans Ende der Sortierung.&nbsp;</td>
</tr>
</tbody>
</table>

[[fa-download] forcats Spickzettel](https://moodle.zhaw.ch/mod/url/view.php?id=635285){.btn .btn-primary}
