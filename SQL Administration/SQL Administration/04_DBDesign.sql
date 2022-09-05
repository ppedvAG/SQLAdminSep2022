/*


Normalisierung Normalform

1. NF  2. 3. DC 4. 5 .--> Vermeidung von Redundanz

Primary Key   Foreign Key
PK ---ref Integrität-->   FK

ref Integrität: Man kann keine Stammdaten löschen , solange FK Werte vorhanden sind


Datentypen:

Vorname:  Otto 
varchar(50)   'Otto' .------4
text().. nicht mehr nehmen..ist 2005 auf Abschussliste.. kann bis zu 2 GB Daten haben
char(50)  'Otto                                                             '   50 
nvarchar(50)  unicode   'otto'   4*2  =  8 
nchar(50)      'otto                                                ' 50*2 = 100



Tipp: best möglichen Datentyp  bei fixen längen Char..


Datum
date  = Datum
datetime (Datum und Zeit auf ms)
datetime2   (ns)
smalldatetime  (sek)
datetimeoffset  (Zeitzone)



Zahlen
decimal (18,0)
decimal(5,3)     decimal(gesamte Länge bz Stellen, davon nachkommastellen)
float 27 Nachkommastellen 
int ganze Zaheln +- 2,1 Mrd
tinyint (255), smallint (32000)


--Alles was auf der HDD liegt kommt 1:1 in RAM
--text und Image   :-(


Diagramme sind immer Live --> exklusiver Zugriff auf den Entwurf der Tabellen (


















*/


select * from customers

select * from orders
select * from testxyz

--Error 206 Ebene 16
---Ebene 15 

--Ebene 9 ... 
--Ebenen  = Kategorie : 1 bis 10 -- Infos
---          11 bis 16 --> DAU Error
---          14 Security
--ab Ebene 17 = Arbeit
-- Ebene 23: Toilette
--Ebene 24: auf Toilette lastminute
--Ebene 25.. ich geh direkt zum Flughafen undbche 


select * from sysmessages where msglangid = 1031