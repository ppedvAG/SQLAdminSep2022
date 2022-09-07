--EVI -- Chefsekretärin

--Software für Personal
--Anlemdlung per NT Login (EVI) --update klappt
--Evi SSMS - > Query update + 10% --update scheitert

USE [Northwind]
GO
CREATE APPLICATION ROLE [Gehaltsrolle] WITH DEFAULT_SCHEMA = [dbo], PASSWORD = N'ppedv2019!'
GO
--Rolle mit Kennwort
--Windows Gruppe mit Kennwort ???????

--in der Software .. Anmeldung per Windows Login

--EVI

--in der  Software
sp_setapprole 'Gehaltsrolle', 'ppedv2019!'

use master -jetzt zwar admin aber mit Rechten der rolle.. keine ;-)
