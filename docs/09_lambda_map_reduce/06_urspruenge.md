Im Kontext der Datenverarbeitung ist die konsequente Operationalisierung von Map-Reduce Algorithmen ein Meilenstein in der Entwicklung skalierbare Anwendungen für sehr grosse Datenmengen. Insbesondere war die konsequente Anwendung dieses Konzepts Teil des technologischen Erfolgs von Google. Um 2004 haben Dean und Ghemawat (2004) gezeigt, dass die Kombination von Map und Reduce-Funktionen die Entwicklung von robusten Anwendungen für grosse Datenmengen ermöglicht, die konventionellen schleifenbasierten (oder "quasi-rekursiven") Algorithmen gegenüber überlegen sind. 

Diese Vorteile waren zu diesem Zeitpunkt nicht neu (Gorlatch, 1996), wurden aber nur theoretisch diskutiert. Dabei stand die parallele Ausführung von Teilfunktionen im Vordergrund. So lassen sich unabhängige Arbeitsschritte leicht auf verschiedene Recheneinheiten verteilen. Solche Recheneinheiten können CPU-Kerne, Computer oder auch Computer-Netzwerke sein.

Googles Innovation bestand in der Feststellung, dass Map-Reduce-Algorithmen auch dann noch ohne Geschwindigkeitsverlust funktionieren, wenn ein erheblicher Teil der Rechenkapazitäten *während* der Berechnung ausfallen. Dean und Ghemawat (2004) haben zur Überprüfung knapp 10% der Rechenkapazitäten deaktiviert.

Die besondere Erkenntnis von  Dean und Ghemawat (2004) ist deshalb, dass Map-Reduce-Algorithmen nicht bloss eine Alternative zu schleifenbasierten Algorithmen sind, mit der Arbeitsschritte auf verschiedene Rechner aufgeteilt werden können. Diese Algorithmen bieten **zusätzliche *Resilienz*** gegenüber äusseren Störungen, die schleifenbasierten Algorithmen nicht haben. 

#### Weiterführende Literatur

- Dean, J. & Ghemawat, S. (2004). "MapReduce: Simplified Data Processing on Large Clusters." In Proceedings of *OSDI’04, 6th Symposium on Operating Systems Design and Implementation*, 137–150.
- Gorlatch, S. (1996). Systematic efficient parallelization of scan and other list homomorphisms. In: Bougé, L., Fraigniaud, P., Mignotte, A., Robert, Y. (eds) *Euro-Par'96 Parallel Processing. Euro-Par 1996. Lecture Notes in Computer Science*, vol 1124. Springer, Berlin, Heidelberg. https://doi.org/10.1007/BFb0024729