--SQL AGENT -----

--Jobs, Zeitpläne, Email
--Job hat Schritte (PS, CMD, TSQL, SSIS , SSAS, REPL)


--EMAIL: Nachricht zum Joberfolg--SQL Agent
/*
alles was per Zeitplan ausgeführt wird, erledigt der Agent dienst (= Dienstkonto)
wird etwas ohne Zeitplan , ist es der SQL Dienst

Job
	--Schritten
	--Ablaufsteuerungen
	--Zeitpläne
	--Proxykonten  (Ausführen als)

-- Operatoren (Alias für Email oder Pager)

-- Warnungen (Ebene , Fehlernummern)


--Agent kann auch Powersehll oder CMD Befehle ausführen
--was wenn der Agent das Recht nicht besitzt
	---dann  Agwent als DOM Admin ... viel spaß bei neuen Job
	--ausführen als --> Proxykonto


	--Proxykonto.
	--1 Anmeldeinfo (name und Kennwort) im Bereich Sichcherheit-- Anmeldiéinformation
	--2 Als Proxy für best Schrittkategorien hintergelegen




	--Warnungen 

	was tun bei

	--Ebene 15:  Syntaxfehler
	--Ebene 16: DAU  ungültiges Objekt
	-- Ebene 9:   alles Ebenen von 1 bis 10 sind reine Infos
	-- Ebene 17: 
	-- Ebene 23:  ooh ohh
	--Ebene 24: muss dringend auf Toilette
	--Ebene 25: auf der Toilette lastminute buchen..
	*/

	Select * from sysmessages where msglangid = 1031 and severity > 16




	--Emailsystem


	*/
	select * from testxy
