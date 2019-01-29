eliminar NM, S0, IA en selectrik y NM en fintra 

--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS13064-17';
select * from con.factura where ref1 in ('FOMS13064-17') order by documento; --('NM14130_1','S00011283')
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925849';
--select * from opav.acciones where id_solicitud = '925849'
select * from con.factura_detalle where ref1 = 'FOMS13064-17' order by documento

--anular documentos asociados al foms en selectrik: factura NM, y S0
CREATE TABLE tem.FOMS13064_fact AS; 			--select * from tem.FOMS13064_fact
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14130_1','S00011283');--NM14130

CREATE TABLE tem.FOMS13064_factdet AS;  --SELECT * FROM tem.FOMS13064_factdet
select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14130_1','S00011283');

CREATE TABLE tem.FOMS13064_fact_cons AS ;   --select * from tem.FOMS13064_fact_cons
select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in ('S00011283','NM14130_1');--select documento from con.factura where ref1 in ('FOMS13064-17'));

CREATE TABLE tem.FOMS13064_ing AS ;    --SELECT * FROM tem.FOMS13064_ing;
select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where num_ingreso in ('IA490138');
 
CREATE TABLE tem.FOMS13064_ingdet AS ;
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in ('NM14130_1','S00011283');

CREATE TABLE tem.FOMS13064_conp AS ;
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14130_1','S00011283','IA490138');


CREATE TABLE tem.FOMS13064_conpdet AS;
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14130_1','S00011283','IA490138');

select factura_cliente,* from opav.subclientes_ofertas 
--update opav.subclientes_ofertas  set factura_cliente = ''
where id_solicitud = '925849'
--NM14130


--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y PM
select * from con.factura where ref1 = 'FOMS13064-17' order by documento

CREATE TABLE tem.FOMS13064_fact AS ;
select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM14130_1','PM14130_1'); 

CREATE TABLE tem.FOMS13064_factdet AS ;
select * from con.factura_detalle 
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  ('NM14130_1','PM14130_1');

CREATE TABLE tem.FOMS13064_ing AS ;
select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  ('NM14130_1');

CREATE TABLE tem.FOMS13064_ingdet AS ;
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  ('NM14130_1');

CREATE TABLE tem.FOMS13064_comp AS ;
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14130_1','PM14130_1');

CREATE TABLE tem.FOMS13064_compdet AS ;
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in ('NM14130_1','PM14130_1');



------------------------------------------------------------------

