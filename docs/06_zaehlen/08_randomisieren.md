Wenn wir mit Teilstichproben arbeiten und diese mit anderen teilen, müssen wir vermeiden, dass zwei Stichproben leicht zusammengesetzt werden können und so Rückschlüsse über die Probanden möglich werden. 

<p class="alert alert-danger" markdown="1">
Sobald  personenbezogene Daten statistisch ausgewertet und zur Publikation vorbereitet werden, **müssen** die Daten randomisiert werden!
</p>

Dieses kleine Rezept beschreibt eine Technik zur Anonymisierung von Daten durch Mischen. Entscheidend bei dieser Technik ist, dass wir die Werte für unsere Analyse zusammenhalten möchten, so dass unsere Ergebnisse nachvollziehbar bleiben. Gleichzeitig soll es unmöglich werden, diese Daten mit anderen Teilen unserer Studien in Verbindung zu bringen.

Die Technik der Anonymisierung durch Mischen besteht aus vier Schritten: 

1. Auswahl der Vektoren, die wir in einer Publikation teilen möchten,
2. Erzeugung eines eindeutigen Vektors,
3. zufälliges Mischen,
4. Entfernen der eindeutigen Vektoren und exportieren der Daten.

#### Schritt 1: Auswahl der Vektoren

Wie üblich wählen wir die Vektoren mit der `select()`-Funktion aus. 

#### Schritt 2: Erzeugung eines eindeutigen Vektors

Alle unsere Werte müssen zusammengehalten werden, weil unsere Analyse sonst nicht mehr nachvollziehbar ist. Wir nummerieren dazu unsere Datensätze durch. 

#### Schritt 3: Mischen

Dieser Schritt greift auf die Funktion `sample()` zurück. Wir erzeugen aus den ursprünglichen Nummerierungen eine neue Nummerierung durch ``daten %>% mutate( id_neu = sample(id) )``. Nach dieser neuen Nummerierung sind unsere Datensätze aber immer noch in der gleichen Reihenfolge und noch nicht gemischt. Wir müssen also die Reihenfolge so anpassen, dass die neue Nummerierung gilt. Das erreichen wir mit dem Funktionsaufruf ``daten %>% arrange( id_neu )``. 

#### Schritt 4: Entfernen des eindeutigen Vektors und exportieren der Daten

Abschliessend müssen wir **unbedingt** die beiden Hilfsvektoren, die wir zum Mischen verwendet haben, aus unserer Stichprobe wieder entfernen. Das erreichen wir mit einer Vektorauswahl: ``daten %>% select(-c(id, id_neu))``. 

#### Vollständige Lösung

Wir greifen hier auf eine Stichprobe zurück, die Geschlechtsinformationen, Alter und digitale Nutzungsgewohnheiten umfasst. Wir erstellen zwei getrennte Teilstichproben, von denen eine nur die Nutzungsgewohnheiten und das Geschlecht und eine nur die Nutzungsgewohnheiten und das Alter beinhaltet. 

[[fa-download] beispielstichprobe.csv](https://moodle.zhaw.ch/mod/resource/view.php?id=635316){.btn.btn-primary}

<p class="alert alert-info" markdown=1>
Sie müssen die Datei vor dem Einlesen noch in `beispielstichprobe.csv` umbenennen.
</p>

```R
daten = read_delim("beispielstichprobe.csv")

# mischen Funktion aus einer Funktionskette erstellen, damit 
#    wir nicht so viel tippen müssen.
mischen = . %>% 
    mutate( 
        id = row_number(), 
        id_neu = sample(id)
    ) %>% 
    arrange(id_neu) %>% 
    select(-c(id, id_neu))

daten %>% 
    select(geschlecht, starts_with("technik")) %>% 
    mischen() %>% 
    write_csv("teilstichprobe_geschlecht_technik.csv")

daten %>% 
    select(alter, starts_with("sozial")) %>% 
    mischen() %>% 
    write_csv("teilstichprobe_alter_sozial.csv")
```

Die zwei Teilstichproben lassen sich nicht mehr zusammenführen. Damit erkennen wir auch die Grenzen dieser Technik: Wenn zwei gemischte Stichproben ausreichend viele gemeinsame oder sehr detaillierte Vektoren haben, die in beiden Teilstichproben vorkommen, dann können diese Stichproben trotz mischen wieder zusammengeführt werden. 

### Ausblick

Mit den gemischten Daten ist es nun nicht mehr möglich, die Werte mit einem anderen Teil der Stichprobe zu kombinieren und so tiefere Rückschlüsse über die Teilnehmenden (womöglich unwissend) zuzulassen. Nur noch durch den Zugriff auf die ursprünglichen Daten können diese Zusammenhänge hergestellt werden. Daher sind die ursprünglichen Daten oft besonders schützenswert und sollten ohne Randomisierung nicht weitergegeben werden. 