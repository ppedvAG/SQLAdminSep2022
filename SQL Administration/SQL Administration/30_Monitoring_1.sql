---User meldet PerformanceProbleme


/* 
Windows Server : 
Taskmanager + Ressourcemonitor
Prozeß: teakids.exe   mslaugh.exe als Admin
Arbeitspeicher 3421 MB   Max 4354 

kein Hinweis auf Engpass unter Windows --> also im SQL Server

SQL Server (Taskmanager des SQL Server)

LIVE!!!!!

DMV  Data Management Views


*/

select * from sys.dm_os_wait_stats



wait_time = Gemsate Wartezeit kumuilierend seit Serverstart

max wait Time

Signal_time = Anteil der CPU 

-- wait_time - signal_time = Wartezeit auf Ressource
--siganl_time > 25% --> CPU Engpass

--wie finde ich mein Bottleneck...seit wann läuft der Server bzw wie lange läuft er schon
--Neustart. tempdb 07.09.2022 10:48:10
--alle waittime addieren = Laufzeit des Server
--wie hoch ist der Anteil einer Ressource zur gesamtzeit



--Idee : alle 10min die Werte sammlen und wegspeichern


--2 Tools....  Datensammler (Messadtaen sammeln auf Serverniveau)   QueryStore  (sammelt autom pro DB Pläne und Ressourcenverbräuche)









