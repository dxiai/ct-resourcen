## SQLite, MySQL/MariaDB, posgreSQL, Access und andere

Es gibt verschiedene SQL-Datenbanken, die sich in ihrer Funktionalität z.T. deutlich unterscheiden.

Es werden grundsätzlich drei Systemgruppen unterschieden: 

- Desktop-Datenbanken
- Datenbank-Server
- Cloud Datenbanken

### Desktop-Datenbanken

Desktop-Datenbanken sind für Datenbanken, auf die eine einzelne Person oder ein einzelnes Programm zugreift. Diese Systeme erstellen eine Datenbank als eine einzelne Datei, so dass dieses leicht verschoben, gesichert oder verschickt werden kann. 

Beispiele für Desktop-Datenbanken sind: 

- [SQLite](https://www.sqlite.org/) (Open Source Software)
- [Microsoft Access](https://www.microsoft.com/en-us/microsoft-365/access) (Closed Source Software)

Während SQLite speziell für die Einbindung mit Programmen gedacht ist, zielt MS Access auf die interaktive Verwendung einer Datenbank durch eine  grafische Benutzeroberfläche. MS Access ist nur für Windows-Rechner verfügbar. 

### Datenbank-Server

Datenbank-Server stellen Datenbanken für viele Nutzende und Anwendungen zur gleichzeitigen Bearbeitung bereit. Datenbank-Server sind oft eine zentrale Komponente in der ICT-Infrastruktur von Unternehmen. Sie bieten neben dem Zugriff auf die strukturierten Daten auch eine integrierte Zugriffskontrolle und Integritätsmechanismen.

- Mit der Zugriffskontrolle wird für einzelne Nutzer oder Anwendungen festgelegt, ob und wie auf welche Daten in einer Datenbank zugegriffen werden kann. 

- Die Integritätsmechnismen regeln den gleichzeitigen Zugriff auf die Daten durch Lese- und Schreibaktionen. Dadurch wird sichergestellt, dass alle Zugriffe korrekte und konsistente Daten erhalten. 

Beispiele für Datenbank-Server sind: 

- [PostgreSQL](https://www.postgresql.org/) (Open Source Sorftware)
- [MariaDB](https://mariadb.org/) (Open Source Software, ehem. mySQL)
- [Oracle](https://www.oracle.com/database/) (Closed Source Software)
- [IBM DB2](https://www.ibm.com/products/db2/database) (Closed Source Software)

### Cloud-Datenbanken 

Cloud-Datenbanken sind spezielle Datenbank-Server, die für das automatische Skalieren von Datenbanken auf sehr grosse Datenmengen optimiert wurden. Diese Datenbanken sind in der Regel Teil des Angebots von Cloud-Anbietern und werden normalerweise von diesen Anbietern verwaltet und bereitgestellt.

Beispiele für Cloud Datenbanken mit SQL Unterstützung sind: 

- [Google Big Query](https://cloud.google.com/bigquery) (Closed Source)
- [Microsoft Azure SQL](https://azure.microsoft.com/en-us/products/azure-sql/) (Closed Source)
- [Amazon RDS](https://aws.amazon.com/de/rds/) (Closed Source)

