--Verwaiste User

--1: Login anlegen und Benutzerzurdnung aktivieren

USE [master]
GO
CREATE LOGIN [JamesBond] WITH PASSWORD=N'123', DEFAULT_DATABASE=[whoamiDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [whoamiDB]
GO
CREATE USER [JamesBond] FOR LOGIN [JamesBond] --ERROR . ist schon da,,,


--2. Wenn man grundsätzlich mit Rollen arbeitet
--JamesBond in der DB löschen
--dann neues Login + Usermapping + Memebership Personalabteilung


--3.  sp_change_users_login  depricated
use whoamiDB

sp_change_users_login 'Report'  --verwaisteen Benutzer


sp_change_users_login 'Auto_fix' , 'JamesBond', NULL, 'ppedv2019!'  --Login wird passend angelegt

--wenn ein gleichnamiges Login schon vorhanden wäre
sp_change_users_login 'Update_one' ,'JamesBond', 'JamesBond'

--geht auch etwas einfacher.. 
sp_help_revlogin




