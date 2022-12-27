Eine  wichtige Operation für Zeichenketten ist das Suchen-und-Ersetzen. Wir können uns das Suchen-und-Ersetzen als eine spezielle Technik zur Mustererkennung vorstellen.

Anstatt umständlich über eine Benutzeroberfläche die Daten zu korrigieren, wollen wir das Bereinigen der Zeichenketten automatisieren. Die Technik ist unter R und EXCEL identisch. Unter R verwenden wir die `str_replace()`- bzw. die `str_replace_all()`-Funktion. Unter EXCEL verwenden wir die `WECHSELN()`-Funktion. 

Bevor wir das Suchen-und-Ersetzen starten, müssen wir die betreffenden Zeichenketten bereinigen, denn sonst verfehlen wir unser Ziel. Die einfachste Bereinigung ist das Entfernen von überschüssigen Leerzeichen. In EXCEL verwenden wir dafür die `GLÄTTEN()`-Funktion oder in R die `str_squish()`-Funktion.

Eine zweite häufig verwendete Bereinigung ist die Transformation auf Kleinbuchstaben oder Grossbuchstaben. Wir entscheiden uns für eine der beiden Varianten und halten diese für diesen Arbeitsschritt durch. Damit stellen wir sicher, dass unsere Ersetzungen unabhängig von der Schreibweise erfolgen.

Für das eigentliche Ersetzen erstellen wir einen Suchvektor und einen Ersetzenvektor. Die beiden Vektoren enthalten die Paare aus Suchmuster und Ersetzung. Diese Paare ordnen wir der Reihe nach, sodass wir diese Schritte nacheinander ausführen können. 

<p class="alert alert-info">
Ersetzen Sie Satzzeichen durch Leerzeichen und nicht durch eine leere Zeichenkette. Dadurch stellen Sie sicher, dass nicht versehentlich Elemente zusammengefügt werden. Wenn Sie alle Sonderzeichen entfernt haben, sollten Sie die Zeichenkette noch einmal von überschüssigen Leerzeichen bereinigen.
</p>

Beispiel Suchen-Ersetzen Vektoren in Excel 

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/gkPKbKn2zIU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=544716"><p class="btn btn-primary"><i class="fa fa-lg fa-download"></i> Datei aus dem Video</p></a>

## Suchen-Ersetzen Vektoren in R

In R müssen wir die Wertepaare direkt zuweisen, wobei die Suchmuster Namen und die Ersetzungen die Werte sind. Das folgende Beispiel demonstriert eine solche Zuordnung. 

```
suchen = c("suchetext", "beispiel")
ersetzungen =  c("suche", "bsp")

names(ersetzungen) <- suchen

Text %>% 
    str_squish() %>%          # Leerzeichen Bereinigen
    str_to_lower() %>%        # Grossschreibung ignorieren
    str_replace_all(ersetzungen)  # Suchen-Ersetzen
```

Alternativ mit mutate und direkter Zuordnung der Wertepaare.

```
# Direkte Zuordnung
ersetzungen = c("suchetext" = "suche", 
                "beispiel" = "bsp")

# Suchen und Ersetzen als Funktionskette innerhalb von mutate
textDaten %>% 
    mutate(Texte = Texte %>% 
                        str_squish() %>% 
                        str_to_lower() %>% 
                        str_replace_all(ersetzungen))
```


Das folgende Video veranschaulicht diese Technik:

<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/Ev20b0-woqk" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

<a href="https://moodle.zhaw.ch/mod/resource/view.php?id=544720"><p class="btn btn-primary"><i class="fa fa-lg fa-download"></i> Notebook und Daten aus dem Video (Zip-Archiv)</p></a>


<p class="alert alert-warning">Beim Suchen und Ersetzen müssen wir aufpassen, dass wir nicht versehentlich Daten ersetzen, die wir später brauchen. Das können z.B. doppelt vorkommende Zeichenketten sein.</p>

<p class="alert alert-info">Oft sind mehrere Durchläufe notwendig, um alle notwendigen Ersetzungen zu identifizieren. Dabei werden die Suchen- und Ersetzenvektoren schrittweise angepasst und erweitert, bis das Ergebnis zufriedenstellend ist.</p>

