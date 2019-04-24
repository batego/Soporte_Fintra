--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS14193-19';
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany_2 as		--select * from tem.FACTURAS_DUPLICADAS_tefany
select * from con.factura where ref1 in ('FOMS14193-19');
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925040'
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany_det_2 as
select * from con.factura_detalle where documento IN (SELECT documento FROM  tem.FACTURAS_DUPLICADAS_tefany_2) order by documento;

--anular documentos asociados al foms en selectrik: factura NM, y S0
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');



select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730')


select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

--CREATE TABLE tem.facuras_dupli_ing_2 as    --elect * from tem.facuras_dupli_ing
select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where num_ingreso IN ('IA491634',
'IA491635',
'IA491636',
'IA491637',
'IA491639',
'IA491640');

--CREATE TABLE tem.facuras_dupli_ingdet_2 as			--select * from tem.facuras_dupli_ingdet_2
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730')

create table tem.FOMS14193 as
select * from con.comprobante where numdoc
IN ('IA491634',
'IA491635',
'IA491636',
'IA491637',
'IA491639',
'IA491640');

create table tem.FOMS14193_dt AS
select * from con.comprodet where numdoc
IN ('IA491634',
'IA491635',
'IA491636',
'IA491637',
'IA491639',
'IA491640');



--CREATE TABLE tem.facuras_dupli_cmp_2 as
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

--CREATE TABLE tem.facuras_dupli_cmpdt_2 as			--select * from tem.facuras_dupli_cmpdt
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730')


select factura_cliente, * from opav.subclientes_ofertas 
--update opav.subclientes_ofertas  set factura_cliente = 'NM13852'
where id_solicitud = '928101';



--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y 	
select * from con.factura where ref1 = 'FOMS14193-19' order by documento;

--create table tem.duplicado_evega_2 as
select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

--create table tem.duplicado_evegadet_2 as
select * from con.factura_detalle
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');


select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

--create table tem.duplicado_evega_cmp2 as
select * from con.comprobante 
--delete from con.comprobante
where numdoc in  ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');

--create table tem.duplicado_evega_cmpdt2 as
select * from con.comprodet 
--delete from con.comprodet 
where numdoc in ('NM14534_1',
'NM14534_2',
'NM14534_3',
'NM14534_4',
'NM14534_5',
'NM14534_6',
'S00012724',
'S00012725',
'S00012726',
'S00012727',
'S00012729',
'S00012730');


------------------------------------------------------------------

