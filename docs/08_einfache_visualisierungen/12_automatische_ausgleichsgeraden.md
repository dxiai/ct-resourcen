Die dritte wichtige visuelle Analysetechnik sind Punktwolken. Bei Punktwolken stellen wir die Werte von zwei Vektoren ähnlich einer Kreuztabelle gegenüber und überprüfen das gemeinsame Auftreten von Werten in den Vektoren unserer Messungen.

Für Punktwolken stehen zwei Funktionen zur Verfügung: 

1. `geom_point()` für kontinuierliche Werte.
2. `geom_jitter()` für diskrete Werte.

[[fa-download] beispieldaten.csv](https://moodle.zhaw.ch/mod/resource/view.php?id=635316){.btn.btn-primary}

```R
daten = read_delim("digitales_umfeld_geraete_fm_att.csv");

daten %>%
    filter(sozial_like_freunde >= -1 & sozial_like_unbekannt >= -1 ) %>%
    ggplot(aes(x = sozial_like_unbekannt, y= sozial_like_freunde)) + 
        geom_point()
```


    
<img src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_27_0.png">
    


In diesem Beispiel sehen wir, dass alle Werte genau an den gleichen Punkten im Koordinatensystem liegen. Ein solcher Plot ist ein gutes Beispiel für *diskrete Werte*. Bei diskreten Werten fallen alle Messungen genau auf bestimmte Punkte im Wertebereich. Kontinuierliche Werte weichen oft ein wenig voneinander ab, sodass wir eine Wolke sehen würden. 

Um Punktwolken für diskrete Werte zu erzeugen verwenden wir die `geom_jitter()`-Funktion. Diese Funktion erzeugt einen kleinen Bereich um den diskreten (echten) Messwert und verteilt die einzelnen Datensätze mit einem zufälligen Abstand vom echten Messwert. Dadurch wird das gemeinsame Auftreten von Werten deutlich sichtbar, sofern es Gemeinsamkeiten gibt.


```R
daten %>%
    filter(sozial_like_freunde >= -1 & sozial_like_unbekannt >= -1 ) %>%
    ggplot(aes(x = sozial_like_unbekannt, y= sozial_like_freunde)) + 
        geom_jitter()
```


    
<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_29_0.png">
    


Durch den leichten Versatz sind nun gehäufte Wertepaare leichter zu erkennen. Bei Jitter-Plots dürfen wir aber nie vergessen, dass die Punkte zwar Messungen repräsentieren, die Punkte leicht vom echten Messpunkt versetzt dargestellt wurden.

In diesem Beispiel können wir eine Häufung entlang der nach rechts aufsteigenden Diagonalen erkennen. Solche Häufungen in Punktwolken deuten auf *Korrelationen* hin. 

<p class="alert alert-primary">Eine <b>Korrelation</b> bezeichnet das wiederholte Auftreten von Werte<i>paaren</i> in Stichproben. Korrelationen deuten auf Zusammenhänge zwischen zwei Vektoren hin.</p>

Ähnlich wie beim Vergleichen mit Histogrammen ist es bei Punktwolken hilfreich, für die Wolke eine Referenz zur Orientierung zu haben. Das erreichen wir mit der `geom_smooth()`-Funktion. Die Methode `lm` steht für "lineares Modell". In diesem Modell versteckt sich das Wort Linie und deshalb *erzeugt ein lineares Modell immer eine Ausgleichsgerade*. Der graue Bereich zeigt uns die Spanne des Fehlerbereichs für diese Gerade. Bei einer linearen Korrelation sollte diese Gerade sollte den Häufungen in unserem Plot ungefähr folgen.


```R
daten %>%
    filter(sozial_like_freunde >= -1 & sozial_like_unbekannt >= -1 ) %>%
    ggplot(aes(x = sozial_like_unbekannt, y= sozial_like_freunde)) + 
        geom_jitter() +
        geom_smooth(method="lm")
```
    
<img    src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_31_1.png">
    


Das folgende Beispiel zeigt eine Punktwolke, bei der die Wertepaare zufällig über den gesamten Wertebereich gestreut sind. In diesem Fall ist eine Korrelation kaum wahrscheinlich. 


```R
daten %>%
    filter(sozial_like_freunde  >= -1 & sozial_freundschaftsanfragen_aus_netzwerk >= -1 ) %>%
    ggplot(aes(x = sozial_like_freunde, y= sozial_freundschaftsanfragen_aus_netzwerk)) + 
        geom_jitter() +
        geom_smooth(method="lm")
```

<img  src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_33_1.png">
    
Wenn eine Ausgleichsgerade wie im Beispiel fast waagerecht ist, dann liegt in der Regel auch keine *Korrelation* vor.

Es gibt auch nicht-lineare Korrelationen. In diesem Fall sehen wir Häufungen in bestimmten Teilen unserer Punktwolken oder unsere Punkte folgen einer Kurve. Solche Korrelationen müssten einer entsprechenden "Ausgleichskurve" folgen. Eine solche Ausgleichskurve erzeugen wir mit `loess` als Ausgleichsmethode. 

Wenn eine Ausgleichskurve fast gerade ist, dann sollten wir eine lineare Korrelation annehmen. Ein Beispiel für eine fast gerade Ausgleichskurve zeigt uns der nächste Plot. 


```R
daten %>%
    filter(sozial_like_freunde >= -1 & sozial_like_unbekannt >= -1 ) %>%
    ggplot(aes(x = sozial_like_unbekannt, y= sozial_like_freunde)) + 
        geom_jitter() +
        geom_smooth(method = "loess")
```
    
<img   src="https://raw.githubusercontent.com/dxiai/ct-resourcen/main/bilder/interpretieren/output_35_1.png">
    