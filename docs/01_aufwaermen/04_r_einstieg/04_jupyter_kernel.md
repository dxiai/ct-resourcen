### Problem 

1. Jupyter möchte nicht mehr arbeiten und zeigt komische Fehlermeldungen. 
2. Sie möchten R zurücksetzen und mit einer sauberen Umgebung arbeiten.

### Ursachen

Es gibt zwei Ursachen für dieses Problem: 

1. Es gab ein Verbindungsproblem und Ihre Arbeitsumgebung wurde neu gestartet.
2. Sie haben zu viele *aktive* Notebooks offen

#### Lösung: Verbindung zum Server verloren

1. Laden Sie Jupyter **nicht** neu! Das ist besonders dann entscheidend, wenn Sie noch nicht alle Teile Ihres Notebooks gespeichert haben.
2. Öffnen Sie einen neuen Tab und laden die URL [`https://jh-staging.esi.li/`](https://jh-staging.esi.li/). 
3. Warten Sie bis eine neue Noteumgebung im neuen Browser-Tab geladen ist.
4. Gehen Sie in den Browser-Tab mit der ursprünglichen Jupyter Umgebung. 
5. Speichern Sie Ihr Notebook. Jetzt ist Ihr Code und Ihre Dokumentation gesichert. 
6. Schliessen Sie den Tab mit der neuen Jupyter Umgebung. 
6. Gehen Sie weiter zur **Lösung R-Kernel neu starten**.

#### Lösung: Zu viele aktive Notebooks

Sie müssen die R-Umgebungen für Notebooks schliessen, an denen Sie gerade nicht arbeiten. 

1. Öffnen Sie im Linken Aktionsmenu den Bereich `Running Terminals and Kernels`. Das Symbol ist [fa-stop-circle]. 
2. Sie sehen im Abschnitt `Kernels` die Namen der R-Kernel für Ihre Notebooks. Der Name des Kernels entspricht dem Namen des Notebooks. 
3. Bewegen Sie die Maus über einen Kernel. Es erscheint rechts neben dem Namen das Symbol [fa-times]. 
4. Klicken Sie auf dieses Symbol, um den Kernel zu beenden. In dem entsprechenden Notebook können Sie ab dann keinen Code mehr ausführen.

![Kernel entfernen](https://github.com/dxiai/ct-resourcen/raw/main/bilder/jupyter/jlab_kill_kernel.png)

Wenn Sie Code in einem Notebook ohne Kernel ausführen möchten müssen Sie den Kernel neu starten.

#### Lösung: R-Kernel neu starten

1. Klicken Sie auf das Menu `Kernel`. 
2. Wählen Sie die Option `Restart Kernel...`. 

Anschliessend steht Ihnen eine saubere Arbeitsumgebung für Ihr Notebook zur Verfügung. 

![Kernel neu starten](https://github.com/dxiai/ct-resourcen/raw/main/bilder/jupyter/jlab_restart_kernel.png)

Weil die Arbeitsumgebung "sauber" ist, müssen Sie den gesamten Code in Ihrem Notebook ausführen lassen. Das machen Sie nicht händisch!

1. Klicken Sie auf das Menu `Run` 
2. Klicken Sie auf dem Punkt `Run All Above Selected Cell`, um alle Codezellen bis zum aktuellen Punkt auszuführen.

Alternativ können Sie alle Code-Zellen ausführen.

1. Klicken Sie auf das Menu `Run` 
2. Klicken Sie auf dem Punkt `Run All`, um alle Codezellen im Notebook.

Warten Sie, bis der Kernel-Indikator oben rechts, nicht mehr ausgefüllt ist. 

Jetzt können Sie weiterarbeiten.

### Erklärung

Jupyter Notebooks bestehen aus drei unabhängigen Teilen. 

1. Der Editor-Umgebung. 
2. Dem Jupyter Notebook Server.
3. Der R-Umgebung für ein Notebook.

Die Editor-Umgebung läuft vollständig in Ihrem Browser ist befindet sich daher auf Ihrem Laptop. Solange Sie Jupyter nicht neu laden oder einen Editor-Tab nicht schliessen, geht Ihnen keine Arbeit verloren. 

Der Jupyter Notebook Server  ist das Gegenstück zum Editor in der Cloud und verwaltet Ihre Dateien und die R-Umgebungen für den Editor.

Jedes Notebook startet beim Öffnen eine eigene **R-Umgebung**. Eine R-Umgebung ist das Programm, dass Ihren R-Code ausführt und Ihre Zwischenergebnisse für spätere Teile Ihres Programmcodes vorhält. Diese Umgebung wird in Jupyter als ***Kernel*** bezeichnet. 

Ein Jupyter Notebook braucht einen Kernel nur, wenn es Code ausführen muss. Alle Ergebnisse und Visualisierungen sind Teil des Notebooks und werden nur dann neu berechnet, wenn Sie die entsprechende Code-Zelle ausführen. Wenn wir ein Notebook nur lesen möchten, wird der Kernel also nicht gebraucht.

Die Jupyter Notebook Server und die R-Kernel laufen online in Ihrer persönlichen Arbeitsumgebung. Diese Arbeitsumgebungen laufen auf mehreren gemeinsamen Servern (dem Jupyter Hub Cluster), auf die wir über den Web-Browser zugreifen. Jede persönliche Arbeitsumgebungen hat einen eigenen Bereich im Speicher eines dieser Server. Ihrer Arbeitsumgebung steht für Ihre Arbeit 1GB Speicher zur Verfügung. Dieser Speicher wird von Ihren Notebooks beansprucht und ist für Ihre Zwecke normalerweise ausreichend.

Jeder R-Kernel beansprucht ca. 150-250MB Speicher in Ihrer Arbeitsumgebung. In Ihrer Umgebung können Sie also zwischen 4  und 6 solcher R-Kernel aktiv haben, bevor Ihnen der Platz zum Arbeiten ausgeht. Wenn Sie keinen Platz zum Arbeiten mehr haben, bekommen Sie merkwürdige Fehlermeldungen, neue Notebooks lassen sich nicht starten oder R-Kernel verschwinden. 

Indem Sie alle nicht benötigten R-Kernel schliessen, schaffen Sie so freien Platz zum Arbeiten.
