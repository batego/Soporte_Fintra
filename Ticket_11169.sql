create table tem.Ticket_11169 as
SELECT * FROM con.comprobante WHERE numdoc IN ('CM501230401','IF172671401');
create table tem.Ticket_11169det as
SELECT * FROM con.comprodet WHERE numdoc IN ('CM501230401','IF172671401');

