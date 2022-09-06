/*
Virtualisierung:

bei Konsolidierung nicht vergessen

genug RAM. aber auch die Platten genauso viel wie vorher ?



bei Migration aufpassen 

stimmt denn NUMA noch (Zuordnung Sockel zu RAM Slots)
Hardwaretopologie verwenden

SERVER		RAM				SOCKEL			KERNE
Host		16GB				1				8

wg HYperV - 4 GB --> 12GB

HV-DC		512-2048MB           1				2
HV-SQL1		fix 6000MB			 1              8	
HV-SQL2		fix 4000MB           1              8



HV-SQL2

DOM: schulung\administrator     ppedv2019!




SETUP


Binärkram: exe dll... Pfad.. egal   c:\Program Files

DB Daten-Datei
DB Log-Datei
TRenne die beiden physikalisch per default

Logfile .. sequentielles Schreiben  I U D
Daten random gelesen

Std Backup Pfad

C:\_SQLDB
C:\_BACKUP


Tempdb (Müllschlücker)
eig HDDs  ..trenne auch hier Log von Daten
Anzahl der Datendateien = CPU Kerne (max 8)
-T1117 Gleiche Größe für alle Datendateien
-T1118 Uniform Extent
Traceflags



Instanz-Features (mehrfach Installation)
jede Inst ist absolut autark
Grund faür meist : Rechte, Software

PC  -- Std Instanz

PC\InstName   benannte Inst


Freigegebene Funktionen
Clientkonnekt.


Sicherheit
NT Auth
gemischte Auth ( NT + SQL Logins) -SA 
Windows Admin sind per default keine SQL Admin


Sortierung 
Latin1 .. CI Case Insensitiv  vs CS 

Dienstkonten
SQL Agent           NT Service\mssqlserver
SQL DB Modul        NT Service\sqlagent$HR
Volltextsuche
Browser


Servicekonten..autom Kennwortänderung, reine lok Konten (im NetzComputerkonto)
Volumewartingstask : kein Ausnullen bei Vergrößerung


MAXDOP
Regel= Anzahl der kerne max 8
Abfrage verwendet entweder 1 Kern oder alle (bzw Maxdop)
früher = 0 = alle



MAX RAM 
Gesamt - Minus OS (mind 2 GB)

MAX MEMORY wird sofort limitiert
MIN MEMORY gilt erst wenn erreicht



Filestreaming

\\server\sqlinstanz\db\Tabelle  = C:\...

select * from tabelle
Backup und Security in SQL Server


































































*/