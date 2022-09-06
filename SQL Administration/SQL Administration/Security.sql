USE [master]
GO
CREATE LOGIN [Max] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO


USE [Northwind]
GO
CREATE USER [Max] FOR LOGIN [Max]
GO


select * from syslogins

--Max SID 0x3E16BA6F0AFAFB45BC25D1C4E5A14BE0

select * from Northwind..sysusers  --

USE [master]
GO
CREATE LOGIN [Susi] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Susi] FOR LOGIN [Susi]
GO


USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]

CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO

--use 

create table ma.projekte(mapro int)
create table ma.mitarbeiter (mama int)

use [Northwind]
GO
GRANT SELECT ON SCHEMA::[MA] TO [Susi]
GO

--default schema = dbo
select * from orders
select * from mitarbeiter  --dbo.Mitarbeiter

select * from ma.mitarbeiter

USE [Northwind]
GO
ALTER USER [Max] WITH DEFAULT_SCHEMA=[IT]
GO

ALTER USER [Susi] WITH DEFAULT_SCHEMA=[MA]
GO

