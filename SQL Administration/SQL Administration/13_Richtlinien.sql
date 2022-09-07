--DB : 
--RecModel muss Full

--guest  deaktivert lassen 

--Backupdatei sollte in letzten 24 h  gemacht worden sein
--Backup von Daten weg
-- Daten und Logfiles sollten auf getrennten Laufwerken sein

/*
Facets = Eigenschaften von Objekten
Bedingung: RecoveryModel muss Full

Richtline heisst: Bedingung anwenden
*/

--Daten und Logfiles getrennt: Facet  Datenbankleistung

--> Logicalvolumes-- ist nicht korrekt.. sollten eigtl physik. HDDs sein