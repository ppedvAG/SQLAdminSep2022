/*
Fälle

1) Userfehler: Daten versehentlich verändert oder gelöscht --> war falsch


2)  Patch/Update/SPs... mach vorher eine Sicherung


3) HDD defekt... entweder beide (LOG/DATEN)  oder nur eine HDD 


4) DB ist defekt


5) Server tot, aber HDDs leben..alle DB Dateien sind noch voll funktionsfähig




Firmenregel:
Aufalldauer einer DB (Raktionszeit)--> Hochverfügbarkeit
Max Datenverlust in Zeit... am besten mit geringst möglichen Datenverlust



Sicherungsarten

Vollsicherung   V
differentiell   D
Transaktionsprotokollsicherung T


V   6:00       !
	T
	T
	Tdefekt
x 
	T
	T
	T
x        !
	 T            !  Tlog alle 30min
	 T            !
	 T  15:00 !




	 Vollsicherung: 
	 sichert Pfade , Dateiname, Größe, und Inhalte
	 zu einem Zeitpunkt


	 Diff
	 sichert alle Seiten und Blöcke seit des letzten V
	 zu einem Zeitpunkt

	 TLog
	 sichert alle Anweisungen weg
	 restore spielt die Anweisungen wieder zurück

	 schnellster Restore:  das V, wenn es also schnell sein soll, dann sollte man das V so häufig wie möglich 

	 wie lange dauert der Restore des 2 letzten Ts
	 solange wie die TX im Orig auch dauerten.. in unserem Fall bis zu 30min 
	 daher: Logfiles sollten keinen großen zeitlichen Umfang haben und alle paar TSicherung ein D einstreuen
	 und das D macht auch den Restire sicherer


	 ---Ausschlaggebened: RecoveryModel

	 Einfach
	 INS UP DEL , Bulk (rudimentär)--> ist einen TX fertig, dann wird sie autom aus dem Tlog gelöscht
	 ==> keine Sicherung des Logfiles
	 --Einsatzgebiet: schneller, weil weniger schreiben, aber kein Restore üer Tlog , wartungsfrei--> TestDb, Datenverlust kann theor. sehr hoch sein (4h)

	 Massenprotokoliert
	 INS UP DE BULK (rudimentär), aber es wird nichts gelöscht.Nur die Sicherung des Tlog entfernt Eintrage aus dem Tlog
	 Logfile muss regelm. gesichert werden, damit es auch wieder gleert wird
	 Restore per Logfile möglich und evtl auch auf Sekunde genau, aber nur dann , wenn nur wenn kein Bulk

	 
	 Voll
	 INS UP DEL Bulk vollständig (auch IX) ... auf Sekunde restore machbar
	 Logfile wächst schneller und ist auch evtl langsamer beim Schreiben


	 --Was passiert mit dem Logfile, wenn man das Model von Full auf Einfach wechselt?
	 es wird geleert.. und per Logfile kein Restore mehr

	*/
	--Vollsicherung
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH NOFORMAT, NOINIT,  
	 NAME = N'Nwind Full', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--Diff
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'Nwind Diff', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--Tlog
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH NOFORMAT, NOINIT,  
NAME = N'Nwind Log', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

--- V TTT D TTT D TTT       D   TTT    2022-09-06T11:04:31.3721112+02:00



--Fall1 : falsche Daten Userfehler
\\hv-sql2\c$    --> _backup
---T 11 Uhr-- 11:30 nächste Sicherung
-- 11:17 --> 11:10!!

--wir wissen, was er ausfgefressen hat

--Idee: workaround: Tabelle restoren

--1. Restore der DB unter anderern Namen, dann per TSQL die Daten in der OrigDb wieder update mit den DAten aus der 11 Uhr DB
---aufpassen: Pfade und dateinamen evtl korrigieren.. Fragmentsicherung ausschalten

---2. auf anderen Server restoren
---Bak auf den Server HV-SQL2 kopieren --> ins SQL Backup Verzeichnis



--Fall3 : Restore der DB
--mit geringst möglichen Datenverlust

---V D ttT 11:04               nächste Tlog 11:30
--aktuell 11:17:13 --Problem!!!

--- um 11:18 V D  TTT bis 11:04:00   13min
--- warten auf 11:30 T -- V  D TTTT restore von 11:17:12  ...........  alles bis 11:30 weg


--wenn wir weniger faul wären:
--T Sicherung um 11:18 (jedes Backup ist Online.. T Sicherung dauert ca 5 min)
--restore von 11:17:12  ---  >ca gut 5 Min Verlust


--alle user runterkicken...

--theroetisch
--alle Leute runterwerfen und sollen wegbleiben
--Sicherung des Tlog
--Restore auf gewünschte Zeit


USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-09-06_11-52-34.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind_LogBackup_2022-09-06_11-52-34', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 13,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 14,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 15,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 16,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-09-06_11-52-34.bak' WITH  NOUNLOAD,  STATS = 5,  STOPAT = N'2022-09-06T11:17:12'
ALTER DATABASE [Northwind] SET MULTI_USER

GO



----Fall 4: Einspielen SP UP ... mach vorher ne Sicherung
--Momentaufnahme




















 













*/