--SELECTRIK 12389-17description
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS14194-19';
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany_3 as		select * from tem.FACTURAS_DUPLICADAS_tefany_3
select * from con.factura where ref1 in ('FOMS14194-19');
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925040'
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany_det_3 as
select * from con.factura_detalle where documento IN (SELECT documento FROM  tem.FACTURAS_DUPLICADAS_tefany_3) order by documento;

--anular documentos asociados al foms en selectrik: factura NM, y S0
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');



select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');


select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in (select documento from con.factura where documento in ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723'));

--CREATE TABLE tem.facuras_dupli_ing_3 as    
select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where num_ingreso IN ('IA491621',
'IA491623',
'IA491625',
'IA491627',
'IA491631',
'IA491632')

--CREATE TABLE tem.facuras_dupli_ingdet_3 as
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723')

--CREATE TABLE tem.facuras_dupli_cmp_3 as
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723',
'IA491621',
'IA491623',
'IA491625',
'IA491627',
'IA491631',
'IA491632');

--CREATE TABLE tem.facuras_dupli_cmpdt_3 as			
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723',
'IA491621',
'IA491623',
'IA491625',
'IA491627',
'IA491631',
'IA491632')


select factura_cliente, * from opav.subclientes_ofertas 
--update opav.subclientes_ofertas  set factura_cliente = 'NM13852'
where id_solicitud = '928175';



--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y 	
select * from con.factura where ref1 = 'FOMS14194-19' order by documento;

--create table tem.duplicado_evega_3 as
select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');

--create table tem.duplicado_evegadt_3 as
select * from con.factura_detalle
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');


select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');

select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');

--create table tem.duplicado_evegacmp_3 as
select * from con.comprobante 
--delete from con.comprobante
where numdoc in  ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');

--create table tem.duplicado_evegacmpdt_3 as
select * from con.comprodet 
--delete from con.comprodet 
where numdoc in ('NM14532_1',
'NM14532_2',
'NM14532_3',
'NM14532_4',
'S00012719',
'S00012720',
'S00012721',
'S00012723');


------------------------------------------------------------------

