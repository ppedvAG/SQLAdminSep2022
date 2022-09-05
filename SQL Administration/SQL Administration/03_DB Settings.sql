--Tipp 1 : immer DB angeben mit use...
--Tipp2 Quellcode markieren, der ausgeführt werden soll

use master;

create database testdb;

--Wie groß ist die DB ?
--so groß wie die modelDB ...8 MB für Daten und 8 MB für Logfile

--Um wieviel wächst die DB?
--64MB


--Unter SQL 2014
--mdf  5 MB     Wachchstum 1 MB
-- ldf 2 MB                             10%

--was wäre besser Einstellung:
--Startgröße...was wird in 3 Jahren sein
--Vergrößerungsraten: nicht 64MB sindern eher 1024 MB

--am besten kein  autom. vergrößerungen
-- das Logfile sollte nie wachsen! (Backup Log)


dbcc loginfo()


USE [testdb]
GO
DBCC SHRINKFILE (N'testdb' , 1)
GO
USE [testdb]
GO
DBCC SHRINKFILE (N'testdb_log' , 1)
GO
USE [master]
GO
ALTER DATABASE [testdb] MODIFY FILE ( NAME = N'testdb', FILEGROWTH = 1024KB )
GO
ALTER DATABASE [testdb] MODIFY FILE ( NAME = N'testdb_log', FILEGROWTH = 10%)
GO


--Lebenszeit des Server in 3 Jahren

--Prio: vermeide HDD Aufwand


use testdb;

--t1 int ,, spx char(4100)

--Datentyen
/*

int  +- 2,1 Mrd
tinyint  + 255
smallint +32000

date (Datum   time nur Zeit
datetime   (ms)   13.7.2022 12:45:24.564  intern als int
datetime2 (ns)
datetimeoffset Zeitzoe
smalldatetime (sek)


Otto
char(50)  ..'Otto                                      ' 50
varchar(50) 'Otto'   4
nchar(50)     'Otto                           ' 50*2    100
nvarchar(50)    'otto'  4*2  8 



*/
use northwind

select * from orders where year(orderdate) =1997 --korrekt aber langsam



select * from orders where orderdate between '1.1.1997' and '31.12.1997 23:59:59.999' 
--schnell aber falsch

use testdb

--t1 hat 20000 Zeilen ..wie groß müsste in etwa die t1
--20000 * 4kb
--80MB

insert into t1
select 'XY'
GO 20000

select * into t2 from t1


---Warum eigt 160MB  wenn es doch 80 nur hätten sein dürfen








--




