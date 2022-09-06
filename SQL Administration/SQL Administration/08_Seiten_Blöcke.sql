/*

..speichert DS nicht in einfache Textfiles , sondern in sog Seiten

------------------------
					*/				-
create table t1 (id int, spx char(4100), spy varchar(4100))--Error 8060 Bytes.

MAX MEMORY  16000  Datenpuffer
MAXDOP max Amzahl der Kerne , die eine Abfrage haben kann


1 Seite hat immer 8192bytes
8 Seiten am Stück = Block

1 Ds mit fixen Längen muss in Seite passne und kann nicht mehr als 8060 Zeichen belegen
1 Seiten kann max 700 DS umfassen und max 8072 bytes

Seiten kommen 1:1 in RAM

Jeder Verschleiss an Seiten wirkt sich also unweigerlich auch im RAM aus