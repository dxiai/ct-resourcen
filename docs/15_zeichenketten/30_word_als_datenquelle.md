Kodierte Texte sind keine Tabellen, sondern liegen als Word-Dokumente auf unserem Rechner. In diesen Word-Dokumenten sind unsere Daten als Paare von markierten Textstellen und Kommentaren vor. Diese Paare wollen wir extrahieren.

Dieses [Beispiel](https://moodle.zhaw.ch/mod/resource/view.php?id=703515) hat vier Beiträge vom offiziellen Blog des Studienschwerpunkts Marketing der ZHAW kopiert und kodiert. Dabei wurden Bilder entfernt. Mit diesem Beispiel untersuchen wir, ob diese Beiträge eine genderneutrale Sprache verwenden. Dazu wurden Substantive jeweils Kategorisiert und mit dem jeweiligen Geschlechtlichkeit (`feminin`, `maskulin`, `neutral`) kodiert. 

### Schritt 1: Datei einlesen und bereinigen

Wenn wir unsere Texte mit Word kodiert haben, können wir sie mit Hilfe der `docxtratr` Bibliothek einlesen. 

```
library(tidyverse)
library(docxtractr)
```

Nun können wir ein kodierten Dokumente in unsere R-Umgebung. Dazu verwenden wir die besondere Funktion `read_docx()`. Diese Funktion liesst das ganze Word-Dokument ein. Mit Hilfe der Funktion `docx_extract_all_cmnts()` Sammeln wir unsere markierten Textstellen ein. 

```
read_docx("kodiert/marketing_1.docx") %>% 
    docx_extract_all_cmnts(include_text = TRUE) -> documentCodes
```

Drei Vektoren sind für uns von besonderer Bedeutung: 

- Der Vektor `comment_text` enthält nun unsere Kodierungen. 
- Der Vektor `id` zeigt uns die Reihenfolge der Kommentare im Dokument.
- Der Vektor `word_src` enthält den beim Kodieren markierten Text. 

Oft müssen wir unsere Codes und Texte noch bereinigen. In diesem Fall, sind die Codes nicht durchgehend einheitlich geschrieben und in jedem Kommentar stehen zwei Codes. Wir wollen deshalb die Codes trennen und vereinheitlichen. In unserem Fall sind enthalten die Kommentartexte *immer* zwei Kodierungen. Weil immer die gleiche Kode-Anzahl in den Kommentaren vorliegt, können wir die Funktion `separate()` verwenden. 

<p class="alert alert-success" markdown="1">
Die Funktion `separate()` trennt einen Zeichenketten Vektor in mehrere Zeichenkettenvektoren auf.
</p>

<p class="alert alert-danger" markdown="1">
Die `separate()`-Funktion dürfen nur verwenden, wenn alle unsere Kommentare die gleiche Anzahl von Codes enthalten. 
</p>

```
documentCodes %>%
    select(id, comment_text, word_src) %>% 
    separate(comment_text, into =c("kategorie", "gender"), sep =",") %>%
    mutate(
        gender = gender %>% str_trim() %>% str_to_lower(),
        kategorie = kategorie %>% str_trim() %>% str_to_lower()
    ) -> kodierteDaten
```

Nach diesem Schritt sind unsere Codes vereinheitlicht und für jede Textstelle können nun die Codes bearbeitet werden. 

Falls wir unterschiedlich viele Kodierungen in den Kommentaren vorliegen, müssen wir die Funktion `str_split()`  und anschliessend `unnest()` verwenden. 

```
data %>% 
    select(id, comment_text, word_src) %>% 
    mutate(
        code = comment_text %>% str_split(",")
    ) %>% 
    unnest(code) -> allgemeinereExtraktion
```

### Schritt 2: Word Hyperlinks entfernen

In diesem Beispiel enthalten die markierten Texte Hyperlinks zu externen Seiten. Diese Links stören uns bei  der Analyse und deshalb entfernen wir sie aus den Textstellen.

```
kodierteDaten %>%
    mutate(
        word_src = word_src %>% str_remove("HY\\s?\\S+ \"[^\"]+\"[^\"]+\"[^\"]+\" "),
    ) -> kodierteDaten2
```

### Schritt 3: Kategorien organisieren

```
kodierteDaten2 %>% 
    count(kategorie)
```

| kategorie | count | 
| --- | --- |
| aktivität | 7 |
| aufgabe |	1 |
| cas |	10 |
| eigenschaft |	4 |
| fähigkeit |	1 |
| funktion |	5 |
| gruppe |	12 |
| information |	1 |
| kontext |	1 |
| konzept |	1 |
| organisation |	1 |
| person |	6 |
| produkt |	3 |
| technik |	1 |
| zeit |	7 | 


Beachten Sie, dass der vorherige Teilschritt in der Regel **nicht** berichtet wird, weil das Ergebnis nur dazu dient, die Codes den richtigen Variablen zuzuordnen. 
Die Codes im Vektor `Kategorie` gehören zu verschiedenen Variablen. Diese Zuordnung muss explizit erfasst  werden.

```
Akteure = c("person", "organisation", "gruppe")

Studiengang = c("cas", "bsc", "mas", "msc")

Funktion = c("aktivität", "eigenschaft", "fähigkeit",
            "möglichkeit", "funktion", "produkt", "anwendung")

Kontext = c("kontext", "konzept", "technik", "zeit", "information")
```

Wir können so die Kodierungen als Merkmalsausprägungen nominalskalierter Variablen verwenden, beschreiben und auswerten. 


#### Weiterführende Textanalyse

Wir können nun weiter analysieren und besonders häufige Worte für unsere Codes auswerten.

Wir extrahieren die einzelnen Worte aus der jeweiligen Markierung und entfernen Artikel und andere oft benutzte Worte aus unseren Daten. 

Anschliessend zählen wir die verbleibenden Worte nach Kategorien und Gender.

Damit das Ergebnis einfacher zu lesen ist, wird das Ergebnis mit `arrange()` sortiert. Weil in unserem Fall sehr viele Worte nur einmal vorkommen, tragen diese nicht viel zum Gesamtinhalt bei. Daher werden diese Worte mit dem abschliessenden Filter für die Darstellung entfernt. 

```
library(tidytext)

stopwords_DE = tibble(
    word = stopwords::stopwords("de", source = "stopwords-iso")
)

kodierteDaten2 %>% 
    unnest_tokens(word, word_src) %>%
    anti_join(stopwords_DE) %>% 
    count(word, kategorie, gender) %>% 
    arrange(desc(n)) %>% 
    filter(n > 1)
```

| word | kategorie | gender | n |
| --- |  --- |  --- |  --- | 
| cas | cas | maskulin | 9 |
| marketing | funktion | neutral | 3 |
| mitstudierenden | gruppe | neutral | 3 |
| austausch | aktivität | maskulin | 2 |
| digital | cas | maskulin | 2 |
| marketing | cas | maskulin | 2 |
| netzwerk | gruppe | neutral | 2 |
| npo | cas | maskulin | 2 |
| referenten | gruppe | maskulin | 2 |

Solche Auswertungen geben zusätzliche Einblicke in die Inhalte und helfen bei der Interpretation der Daten. 