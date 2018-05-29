SOLICITUD ELIMINACION NOTA GEOTECH
Buenos días.
Boris solicito el favor de eliminar la nota numero NC036841 ya que se va a remplazar por otra.


create table bterraza.carolina_ing_NC036841 as
SELECT * FROM con.ingreso where num_ingreso like 'NC036841';
-- delete FROM con.ingreso where num_ingreso like 'NC036841';

create table bterraza.carolina_ing_det_NC036841 as
SELECT * FROM con.ingreso_detalle  where num_ingreso = 'NC036841';
-- delete FROM con.ingreso_detalle  where num_ingreso = 'NC036841';

select * from con.comprobante where numdoc = 'NC036841'; 
-- delete from con.comprobante where numdoc = 'NC036841'; 

select * from con.comprodet where numdoc = 'NC036841';
-- delete from con.comprodet where numdoc = 'NC036841';

-- Tablas de Backup
select * from bterraza.Carolina_comprobante_NC036841;
select * from bterraza.Carolina_NC036841;
select * from bterraza.carolina_ing_NC036841;
select * from bterraza.carolina_ing_det_NC036841;