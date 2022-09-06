-- =============================================
-- Create Database Snapshot Template
-- =============================================
USE master
GO

-- Create the database snapshot
CREATE DATABASE Nwind1213 ON
( NAME = northwind, --Origdb Alias (logscher Name)
FILENAME = 'D:\_SQLDBDATA\nwind1213.mdf' )
AS SNAPSHOT OF Northwind
GO


kill 72

----Restore von Snapshot

--alle User müssen runter von beiden DB
use master;
select * from sysprocesses where spid > 50 ---= User
select db_id('northwind'),db_id('nwind1213')  --7  10

restore database northwind from database_snapshot= 'nwind1213'


---Kann ich den Snapshot sichern?  Nö

--Kann man den Snapshot restoren ? -- Hä??? Neee!

--Kann  man die OrigDB backupen? -- Hoffentlich !! Ja!!

--Kann man die OrigDBs restoren? --Nö.. nur vom Snapshot
--wenn, dann vorher alle Snapshots löschen

--Kann man mehrere Snapshots haben?
--Jo geht..



--Plan 

/*
Größe:1GB
ProduktivDB
wie lange darf die Ausfallzeit sein?						30min
Wie groß darf der max Datenverlust sein?			1h  nur noch V und D

Arbeitszeiten: Mo bis Fr   6 Uhr bis 19 Uhr

V			jeden Tag      von Mo bis Fr um  5:30 .... Dauer: < 10Sek
T:			alle 10min    von Mo bis Fr  6:10 bis 19:10
D:		    alle 30min     6:35      bis    19:35

-------------------------------11:31.10-----------------------------------------200GB .ldf = tlog 
  TX TX TX TX TX TX TX TX TX TX | TX  TX TX TX TX TX TX TX TX TX TX TX 

Größe:100 GB
ProduktivDB
wie lange darf die Ausfallzeit sein?						30min
Wie groß darf der max Datenverlust sein?			15min
Mo bis Fr 6 Uhr bis 19 Uhr



V  1mal pro Tag Mo bis Fr  
D  alle 3 bis 4 T eine D Sicherung
T  alle 15 min
Ziel: nicht eine .bak datei

V TTT D TTT D TTT 



----------------------------------------------------------------------------
.bak TX TX TX TX TX TX TX TX TX





---------------- 20 GB
10000 Seiten
---------------


---------------------------
TX!!! TX! TXx ><TX! TXx TXx TXx 
---------------------------

*/
use northwind

begin tran

update customers set city = 'Berlin'
INS
UP

select * from customers
------------------------------------
rollback commit


DB  1 TAB   1 SP   1 Zeile    10







*/