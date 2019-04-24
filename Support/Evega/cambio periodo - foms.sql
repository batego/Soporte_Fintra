CORRER PERIODO A MARZO  FOMS14016-18 TERNIUM
Buen dia 

Favor correr de periodo a Marzo todos los documentos asociados al MS FOMS14016-18 NM14537_1 66,220,181 , 
por favor hacer esto antes de migrar a Apoteosys para que quede en el periodo correcto, gracias.

--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select tipo_proyecto,* from opav.ofertas where num_os = 'FOMS14016-18';
select * from con.factura where ref1 in ('FOMS14016-18') order by documento;
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925040'
select * from con.factura_detalle where ref1 = 'FOMS14016-18' order by documento;

--anular documentos asociados al foms en selectrik: factura NM, y S0
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14537_1');



select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14537_1');


select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in (select documento from con.factura where ref1 in ('FOMS14016-18'));


select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where referencia_1  in ((select documento from con.factura where ref1 in ('FOMS14016-18')))


select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  ('NM14537_1');


select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14537_1');

select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14537_1');



--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y PM
select * from con.factura where ref1 = 'FOMS14016-18' order by documento

select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM14537_1');

select * from con.factura_detalle
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  ('NM14537_1');


select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  ('NM14537_1');

select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  ('NM14537_1');

select * from con.comprobante 
--delete from con.comprobante
where numdoc in  ('NM14537_1');

select * from con.comprodet 
--delete from con.comprodet 
where numdoc in ('NM14537_1');


------------------------------------------------------------------