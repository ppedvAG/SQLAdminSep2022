--Auftrag... wird eigtl immer vom   Agentkonto ausgeführt

--Ausführen als...--> braucht man nur für externe systeme wie PS oder CMD

--1. Lege eine Anmeldeinformation hinterlegen (name und Kennwort)

USE [master]
GO
CREATE CREDENTIAL [DerKairoAdmin] WITH IDENTITY = N'KAIRO\Administrator', SECRET = N'ppedv2019!'
GO


--Proxy  = Stellvertreter
--anmeldeinformation verwenden und Subsystem zuweisen

USE [msdb]
GO
EXEC msdb.dbo.sp_add_proxy @proxy_name=N'PS_CMD_KairoAdmin',@credential_name=N'DerKairoAdmin', 
		@enabled=1
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'PS_CMD_KairoAdmin', @subsystem_id=3
GO
EXEC msdb.dbo.sp_grant_proxy_to_subsystem @proxy_name=N'PS_CMD_KairoAdmin', @subsystem_id=12
GO
