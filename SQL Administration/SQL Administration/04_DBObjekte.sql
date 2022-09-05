--DBObjete

/*

a) adhoc Abfragen 
select * from tabelle...

b) Prozeduren 
exec procName 10, 'XY'      wie Windows Batchdatei

oft BI Logik
create proc procname @par1 int, @par2 vrchar(50)
as
select * from 
insert
update
delete 

schneller: weil der Plan, der einmal erstellt wird auch in Zukunft weiter verwendet wird..auch nach Neustart



c) Views / Sichten 
Grund für Sicht: komplexe Abfragen, oder Security
create view vName
as
select * from tabelle 

select * from vName

select * from (select * from tabelle) t


d) Funktionen
eigtl immer mies.. seitens Performance


select fnetto(freight)  from ftab(100) 


---------------------------------->schneller
  a    d      b		c


  --faktisch:
  d          a|c               b

  --kann aber auch so sein
    b     d    a|c
