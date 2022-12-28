### Problem 

Kodierte Texte sind keine Tabellen, sondern liegen in mehrere Dateien auf unserem Rechner. Diese Dateien sollen wir in einem Schritt eingelesen werden und in ein Stichprobenobjekt umgewandelt werden. 

### Lösung

```r
library(tidyverse)
library(docxtractr)

datenordner = "kodiert"

tibble(
    datei = list.files(
                    path = datenordner, 
                    pattern = "^[^~]+.docx$"  
               )
) %>% 
    group_by(datei) %>% 
    mutate(
        pfad = str_c(datenordner, "/", datei),
        codes = read_docx(pfad) %>% 
                    docx_extract_all_cmnts(include_text = TRUE) %>% list()
    ) %>% 
    ungroup() %>% 
    unnest(codes) -> alleCodes
```

### Erklärung

Die Code-Beispiele basieren auf Dateien aus dem [Beispieldaten](https://moodle.zhaw.ch/mod/resource/view.php?id=703515)

Wenn wir unsere Texte mit Word kodiert haben, können wir sie mit Hilfe der `docxtractr` Bibliothek einlesen. 

```
library(tidyverse)
library(docxtractr)
```

Dazu erstellen wir uns ein Stichprobenobjekt zur Unterstützung, in das wir die Namen der Dateien einlesen.

```
datenordner = "kodiert"

tibble(
    datei = list.files(
                    path = datenordner, 
                    pattern = "^[^~]+.docx$"  # nur reguläre Word Dokumente auswählen
               )
)  -> dateinamen
```

Die Funktion `list.files()` gibt einen Vektor mit allen Datennamen im angegebenen Verzeichnis `path` zurück. Mit dem Parameter `pattern` können Dateien nach ihrem Namen noch gezielter ausgewählt werden. Der hier gezeigte *reguläre Ausdruck* wird als Teil eines *logischen Ausdrucks* verwendet, um reguläre Word-Dokumente zu erhalten. Hier müssen wir aufpassen, denn die Dateiendung reicht nicht aus. Word erzeugt beim Bearbeiten einer Datei Hilfsdokumente, die ebenfalls auf `docx` enden, aber im vorderen Teil des Dateinamens eine Tilde (`~`) haben. Diese Dateien können wir nicht verwenden und sie dürfen deshalb nicht in unserer Dateiliste vorkommen.

Anschliessend können wir die kodierten Dokumente einzeln einlesen. Dabei müssen wir beachten, dass die Funktion `read_docx()` nur eine Datei gleichzeitig einlesen kann. Wir müssen deshalb über die Dateinamen mit `group_by()` gruppieren. Dadurch erhalten wir Teilstichproben mit genau einen Dateinamen. 

```
dateinamen %>% 
    group_by(datei) %>% 
    mutate(
        pfad = str_c(datenordner, "/", datei),
        codes = read_docx(pfad) %>% 
                    docx_extract_all_cmnts(include_text = TRUE) %>% list()
    ) %>% 
    ungroup() %>% 
    unnest(codes) -> alleCodes
```

<p class="alert alert-warning" markdown="1">
Beachten Sie, dass Sie mit dem Parameter ``include_text = TRUE`` nicht nur die Kodierung einlesen, sondern auch den Text, der beim Kodieren markiert wurde. 
</p>

Mit dieser Operation lesen wir jede einzelne Datei ein. In der Variablen `alleCodes` liegen nun alle vorgenommenen Kodierungen mit den relevanten Zusatzinformationen. Weil die Dateinamen Teil der Stichprobe ist, kann jeder Code und jeder markierte Text der Ursprungsdatei zugeordnet werden. 

### Lösung für normale Textdateien

Das gleiche Prinzip funktioniert auch für beliebige Textdateien.

```r
datenordnet = "texte"
dateiendung = "txt"

tibble(
    datei = list.files(
                    path = datenordner, 
                    pattern = str_c("\\.", dateiendung, "$")
               )
) %>% 
    group_by(datei) %>% 
    mutate(
        pfad = str_c(datenordner, "/", datei),
        codes = read_file(pfad)
    ) %>% 
    ungroup() -> eingeleseneTexte
```
