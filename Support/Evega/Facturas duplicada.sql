--SELECTRIK 12389-17
--busca documentos asociados al foms tanto selectrik como fintra
select * from opav.ofertas where num_os = 'FOMS14073-19';
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany as		--select * from tem.FACTURAS_DUPLICADAS_tefany
select * from con.factura where ref1 in ('FOMS14073-19');--,'FOMS14193-19','FOMS14194-19');
--update opav.acciones set reg_status = 'A' where id_solicitud =  '925040'
--CREATE TABLE tem.FACTURAS_DUPLICADAS_tefany_det as
select * from con.factura_detalle where documento IN (SELECT documento FROM  tem.FACTURAS_DUPLICADAS_tefany) order by documento;

--anular documentos asociados al foms en selectrik: factura NM, y S0
select * from con.factura 
--update con.factura set reg_status = 'A'
--delete from con.factura
where documento in ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712');



select * from con.factura_detalle
--update con.factura set reg_status = 'A'
--delete from con.factura_detalle
where documento in ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712')


select * from con.factura_consorcio  
--delete from con.factura_consorcio
--update con.factura_consorcio set documento_consorcio = 'NM13852_1'
where documento in (select documento from con.factura where documento in ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712');

--CREATE TABLE tem.facuras_dupli_ing as    select * from tem.facuras_dupli_ing
select * from con.ingreso 
--delete from con.ingreso 
--update con.ingreso set reg_status = 'A'
where num_ingreso IN ('IA491601',
'IA491585',
'IA491587',
'IA491589',
'IA491591',
'IA491593',
'IA491595',
'IA491597',
'IA491599',
'IA491603',
'IA491605',
'IA491607')

--CREATE TABLE tem.facuras_dupli_ingdet as				
select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
--update con.ingreso_detalle set reg_status = 'A'
where factura in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712')

create table tem.FOMS14073 as
select * from con.comprobante where numdoc IN ('IA491585',
'IA491587',
'IA491589',
'IA491591',
'IA491593',
'IA491595',
'IA491597',
'IA491599',
'IA491601',
'IA491603',
'IA491605',
'IA491607');

create table tem.FOMS14073_dt as
select * from con.comprodet where numdoc IN ('IA491585',
'IA491587',
'IA491589',
'IA491591',
'IA491593',
'IA491595',
'IA491597',
'IA491599',
'IA491601',
'IA491603',
'IA491605',
'IA491607');





--CREATE TABLE tem.facuras_dupli_cmp as
select * from con.comprobante 
--delete from con.comprobante
--update con.comprobante set reg_status = 'A'
where numdoc in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712');

--CREATE TABLE tem.facuras_dupli_cmpdt as			select * from tem.facuras_dupli_cmpdt
select * from con.comprodet 
--delete from con.comprodet 
--update con.comprodet set reg_status = 'A'
where numdoc in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712')


select factura_cliente, * from opav.subclientes_ofertas 
--update opav.subclientes_ofertas  set factura_cliente = 'NM13852'
where id_solicitud = '927498';



--FINTRA-------------------------------------------------------------------------------------------------------------------------
--anular documentos asociados al foms en fintra: factura NM, y 	
select * from con.factura where ref1 = 'FOMS14073-19' order by documento;

--create table tem.duplicado_evega as
select * from con.factura 
--delete from con.factura
--update con.factura set reg_status = 'A'
where documento in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711',
'S00012712');

--create table tem.duplicado_evegadt as
select * from con.factura_detalle
--delete from con.factura_detalle
--update con.factura_detalle set reg_status = 'A'
where documento in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711');


select * from con.ingreso 
--delete from con.ingreso 
where num_ingreso in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711');

select * from con.ingreso_detalle  
--delete from con.ingreso_detalle   
where num_ingreso in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711');

--create table tem.duplicado_evegacmp as
select * from con.comprobante 
--delete from con.comprobante
where numdoc in  ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711');

--create table tem.duplicado_evegacmpdt as
select * from con.comprodet 
--delete from con.comprodet 
where numdoc in ('NM14530_1',
'NM14530_10',
'NM14530_11',
'NM14530_12',
'NM14530_2',
'NM14530_3',
'NM14530_4',
'NM14530_5',
'NM14530_6',
'NM14530_7',
'NM14530_8',
'NM14530_9',
'S00012701',
'S00012702',
'S00012703',
'S00012704',
'S00012705',
'S00012706',
'S00012707',
'S00012708',
'S00012709',
'S00012710',
'S00012711');


------------------------------------------------------------------

