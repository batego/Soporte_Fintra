SOLICITUD MARCAR COMO ANULADO DIFERIDO Y EIMINAR CAUSACION
buenas tardes,

Boris solicito el favor para los diferidos relacionados a 
continuacion marcarlos como anulados y eliminar la causacion ya que estan reversados a cartera en Enero 2019:

codneg	cod
MC13230	CM500560410
MC13230	MI500382510

select * FROM ing_fenalco WHERE cod	IN ('CM500560410','MI500382510');

create table tem.anu_dif_caus_comp AS;			--SELECT * FROM  tem.anu_dif_caus_comp
select * from con.comprobante where numdoc IN ('CM500560410','MI500382510');

create table tem.anu_dif_caus_compdet AS;		--SELECT * FROM tem.anu_dif_caus_compdet
select * from con.comprodet where numdoc IN ('CM500560410','MI500382510');


