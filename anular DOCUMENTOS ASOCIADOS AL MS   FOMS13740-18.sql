--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS13740-18';
select * from con.factura where ref1 in ('FOMS13740-18') order by documento;
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925040';
--select * from con.factura_detalle where ref1 = 'FOMS13740-18' order by documento;

--anular documentos asociados al foms en selectrik: factura NM, y S0
create table tem.FOMS13740_fact AS;
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14420_1','NM14441_1');


create table tem.FOMS13740_factdt AS;
select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14420_1','NM14441_1');

create table tem.FOMS13740_factconso AS;
select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in (select documento from con.factura where ref1 in ('FOMS13740-18'));


select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where referencia_1  in ((select documento from con.factura where ref1 in ('FOMS13740-18')));


select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  ('NM14420_1','NM14441_1');

create table tem.FOMS13740_comp AS;
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14420_1','NM14441_1');

create table tem.FOMS13740_compdt AS;
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14420_1','NM14441_1');


select estado, prefacturar, factura_cliente,* from opav.acciones WHERE id_accion IN ('9045509','9045510');
