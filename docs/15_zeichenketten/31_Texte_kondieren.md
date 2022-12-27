### Problem

Es sollen bedeutsame Stellen in Texten durch Anmerkungen markiert werden, sodass diese Stellen und die Markierung in R ausgewertet werden können.

<p class="alert alert-primary" markdown="1">
Das Markieren von Textstellen durch Anmerkungen wird als **Textkodierung** bezeichnet.
</p>

### Lösung 

Die Kommentarfunktion von Word ist einfachste Möglichkeit, um Texte zu kodieren. Diese Funktion finden Sie im Menüband `Überprüfen`. 

Je nach Datenquelle müssen Sie den Text zuvor in ein Word Dokument umwandeln oder via Copy-und-Paste in ein Dokument einfügen. 

### Erklärung

<p class="alert alert-success" markdown="1">
Erstellen Sie für jeden Text ein separates Dokument! Ihre Auswertung wird dadurch einfacher. 
</p>

Nachdem der Text im Word-Format vorliegt, sichern Sie unbedingt das Dokument als unkodierte Fassung in einem separaten Ordner. Sie sollten nun zwei Dokumente haben. Eines der beiden Dokumente bleibt **immer** in der ursprünglichen Rohfassung und wird nicht mehr bearbeitet.

Schliessen Sie das Dokument wieder und öffnen Sie die zu kodierende Fassung. 

Jetzt gehen Sie Schritt für Schritt durch das Dokument und kodieren Ihre Textstellen wie folgt: 

1. Markieren Sie die entsprechende Textstelle. 
2. Klicken Sie auf "Neuer Kommentar". 
3. Geben Sie im Kommentarfeld den Code für die Textstelle ein. 
4. Klicken Sie auf Kommentar abschicken, sonst geht Ihr Code verloren.

<p class="alert alert-success" markdown="1">
Falls Sie mehrere Codes für die gleiche Textstelle verwenden möchten, können 
Sie mehrere Codes in einen Kommentar schreiben. Verwenden Sie das Komma oder ein Semikolon (Strichpunkt) als Trennzeichen. 
</p>

<p class="alert alert-warning" markdown="1">
Wenn Sie mehrere Codes in einen Kommentar schreiben, verwenden Sie **immer** das gleiche Trennzeichen!
</p>

Ihre Codes sollten aus einem einzelnen Wort bestehen. Falls Sie Ihre Codes vorab Variablen zuweisen (können), verwenden Sie einen Doppelpunkt *ohne* Leerschlag, um diese Information bereits bei der Kodierung zu erfassen. Oft ist es einfacher, die Codes nachträglich in R den Variablen zuzuordnen.

<p class="alert alert-success" markdown="1">
Sie können Ihre Codes nachträglich anpassen. Achten Sie dabei darauf, dass Sie den Kommentar nach Ihrer Änderung speichern. 
</p> 
