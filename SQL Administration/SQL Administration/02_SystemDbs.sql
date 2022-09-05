/*

SystemDbs

master
Logins (nicht verlauf)
Datenbanken
Konfiguration
Backup:  Ja!!


model
Vorlage für neue DB  
create database testdb --> Kopie der modelDB
jede Änderung an der model hat eine Auswirkung auf alle neuen DBs, nie auf best.
Backup: ja....meist machts kein Sinn, weil Änderungen schneller manuell wiederghergestellt worden sind
--besser evtl Scripte


msdb
DB für den Agent (Jobs, Zeitpläne, Wartungspläne, Verlauf der Jobs, Emailsystem, SSIS Pakete)
Backup: Ja!!
Sehr viel Arbeit, alles wiederherstellen


tempdb
#temporär Tabellen
Zeilenversionierung
Wartung von Indizes
Auslagerungen von Speicher

Backup:  Nö!!!



--am besten : Sicherung tägl. der SystemDBs per Wartungsplan
--TDE.. Dateien und somit auch Backups verschlüsselt

