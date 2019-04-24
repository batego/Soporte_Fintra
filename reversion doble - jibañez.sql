select * from con.ingreso where num_ingreso='IC343660';
select * from con.ingreso_detalle where num_ingreso='IC343660';

create table tem.IC343660_cab as
SELECT * FROM con.comprobante WHERE  grupo_transaccion = '12153340';

create table tem.IC343660_deta as
SELECT * FROM con.comprodet WHERE  grupo_transaccion = '12153340';