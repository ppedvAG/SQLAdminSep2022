/*
Fälle

1) Userfehler: Daten versehentlich verändert oder gelöscht --> war falsch


2)  Patch/Update/SPs... mach vorher eine Sicherung


3) HDD defekt... entweder beide (LOG/DATEN)  oder nur eine HDD 


4) DB ist defekt


5) Server tot, aber HDDs leben..alle DB Dateien sind noch voll funktionsfähig




Firmenregel:
Aufalldauer einer DB (Raktionszeit)--> Hochverfügbarkeit
Max Datenverlust in Zeit... am besten mit geringst möglichen Datenverlust



Sicherungsarten

Vollsicherung   V
differentiell   D
Transaktionsprotokollsicherung T


V   6:00       !
	T
	T
	Tdefekt
x 
	T
	T
	T
x        !
	 T            !  Tlog alle 30min
	 T            !
	 T  15:00 !




	 Vollsicherung: 
	 sichert Pfade , Dateiname, Größe, und Inhalte
	 zu einem Zeitpunkt


	 Diff
	 sichert alle Seiten und Blöcke seit des letzten V
	 zu einem Zeitpunkt

	 TLog
	 sichert alle Anweisungen weg
	 restore spielt die Anweisungen wieder zurück

	 schnellster Restore:  das V, wenn es also schnell sein soll, dann sollte man das V so häufig wie möglich 

	 wie lange dauert der Restore des 2 letzten Ts
	 solange wie die TX im Orig auch dauerten.. in unserem Fall bis zu 30min 
	 daher: Logfiles sollten keinen großen zeitlichen Umfang haben und alle paar TSicherung ein D einstreuen
	 und das D macht auch den Restire sicherer


	 ---Ausschlaggebened: RecoveryModel

	 Einfach
	 INS UP DEL , Bulk (rudimentär)--> ist einen TX fertig, dann wird sie autom aus dem Tlog gelöscht
	 ==> keine Sicherung des Logfiles
	 --Einsatzgebiet: schneller, weil weniger schreiben, aber kein Restore üer Tlog , wartungsfrei--> TestDb, Datenverlust kann theor. sehr hoch sein (4h)

	 Massenprotokoliert
	 INS UP DE BULK (rudimentär), aber es wird nichts gelöscht.Nur die Sicherung des Tlog entfernt Eintrage aus dem Tlog
	 Logfile muss regelm. gesichert werden, damit es auch wieder gleert wird
	 Restore per Logfile möglich und evtl auch auf Sekunde genau, aber nur dann , wenn nur wenn kein Bulk

	 
	 Voll
	 INS UP DEL Bulk vollständig (auch IX) ... auf Sekunde restore machbar
	 Logfile wächst schneller und ist auch evtl langsamer beim Schreiben


	 --Was passiert mit dem Logfile, wenn man das Model von Full auf Einfach wechselt?
	 es wird geleert.. und per Logfile kein Restore mehr





 













*/