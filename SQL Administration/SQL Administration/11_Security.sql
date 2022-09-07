--USE [master]
GO
CREATE LOGIN [Hans] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Hans] FOR LOGIN [Hans]
GO


CREATE LOGIN [SUSI] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [SUSI] FOR LOGIN [SUSI]
GO


--Hans IT 
--Susi MA


USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO

USE [Northwind]
GO
CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO



create table it.projekte(itpro int)
create table ma.projekte(mapro int)

create table ma.kst(makstr int)
create table it.kst(itkst int)


use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [Hans]
GO
GRANT SELECT ON SCHEMA::[MA] TO [SUSI]
GO

use [Northwind]
GO
--direktes Leserechte auf tabelle
GRANT SELECT ON [IT].[projekte] TO [SUSI]
GO


select * from customers
select * from kst

--jeder Benutzer kann ein default schema haben  (default dbo)

USE [Northwind]
GO
ALTER USER [SUSI] WITH DEFAULT_SCHEMA=[MA]
GO
ALTER USER [HANS] WITH DEFAULT_SCHEMA=[IT]
GO


use [Northwind]
GO
GRANT CREATE TABLE TO [SUSI]
GO
use [Northwind]
GO
GRANT ALTER ON SCHEMA::[MA] TO [SUSI]
GO


---Besser mit Rollen = Gruzppe

--DB Rollen
--bestehende Rollen gelten über alle Schemas hinweg
USE [Northwind]
GO
CREATE ROLE [ITRolle] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Hans]
GO



use [Northwind]
GO
REVOKE SELECT ON SCHEMA::[IT] TO [Hans] AS [dbo]
GO


use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [ITRolle]
GO



----Neuen Mitarbeiter Berti
--IT 
--Login

USE [master]
GO
CREATE LOGIN [Berti] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Berti] FOR LOGIN [Berti]
GO
USE [Northwind]
GO
ALTER USER [Berti] WITH DEFAULT_SCHEMA=[IT]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Berti]
GO



--Serverrollen dienen zur Administration

--public = jeder nichts damit tun

--guest= deaktiviert lassen  jder der ein Login besitzt kann in eine DB wenn der guest aktiv ist


--wieso kommt der Admin in die DB , obwohl er als User gar nicht auftaucht
--jeder in der Serverrolle sysadmin  wird in der DB auf die Rolle dbo_owner gemappt = dbo



