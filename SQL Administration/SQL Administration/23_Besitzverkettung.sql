--Northwind

USE [NORTHWIND]
create table ma.projekte (maproid int)

create table dbo.projekte (dboproid int)

select * from projekte
select * from ma.projekte






USE [master]
GO
CREATE LOGIN [MAX] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [MAX] FOR LOGIN [MAX]
GO

USE [Northwind]
GO

/****** Object:  Schema [MA]    Script Date: 16.12.2020 10:41:50 ******/
CREATE SCHEMA [MA]
GO


USE [Northwind]
GO
ALTER USER [MAX] WITH DEFAULT_SCHEMA=[MA]
GO


use [Northwind]
GO
GRANT SELECT ON SCHEMA::[MA] TO [MAX]
GO


--MAX muss Sichten anlegen dürfen nur im schema MA

use [Northwind]
GO
GRANT CREATE VIEW TO [MAX]
GO

use [Northwind]
GO
GRANT ALTER ON SCHEMA::[MA] TO [MAX]
GO


use [Northwind]
GO
DENY SELECT ON [dbo].[Employees] TO [MAX]
GO

--als MAX ausführen 

EXECUTE AS USER= 'MAX'
GO 

create view ma.v1
as
select * from dbo.employees
GO

--TEST als Max

select * from ma.v1


REVERT

--Überwachung per AUDIT oder per DDL Trigger

--> TRIGGER DML (I U D)
--DDL create drop alter
create table logging (id int identity, shithappens xml, Datum datetime)

create trigger trgMonitor on database --server
	for DDL_DATABASE_LEVEL_EVENTS --  DROP_..CREATE_
as
insert into logging  values (eventdata(), getdate())
GO

--TEST

create view vXYZ
as 
select * from orders
GO


select * from logging



begin tran


rollback 