select * from con.COMPROBANTE where NUMDOC = 'CID00000071';
					      	
select * from con.COMPRODET where NUMDOC = 'CID00000071';
select * from con.ingreso where num_ingreso = 'CID00000071';

select * from ing_fenalco where cod = 'CID000000070' limit 100
select * from con.factura where documento = 'CID000000070' limit 100

--update con.COMPROBANTE set CREATION_DATE = '2018-04-07 09:07:54.176128', periodo = '201804' where NUMDOC = 'CID00000071';
-- update comprobante set periodo = '201612' where numdoc in ('IC073129','IC081301','IC080825','IC080588') and periodo = '201841'-- 

-- update con.comprodet set periodo = '201804', creation_date = '2018-04-07 09:07:54.176128' where numdoc = 'CID00000071' and periodo = '201841' 

-- update con.ingreso set periodo = '201704', fecha_contabilizacion = '22/04/17' where num_ingreso = 'NC038042' 



--Contable
-- update con.comprobante set periodo = '201612' where numdoc in ('IC081381') and periodo = '201841'

select * from con.comprodet where numdoc like '%CID000000070%' and periodo = '201803';
-- update con.comprodet set periodo = '201612' where numdoc in ('IC081381') and periodo = '201841'
-- 

--Operativo
|
select * from  con.ingreso where num_ingreso = 'CID00000070' 
select * from con.INGRESO_DETALLE where num_ingreso in ('CID00000070')
-- update con.factura set periodo = '201804' where documento in ('PP02188845')

select * from con.factura_detalle where documento in ('CID000000070')

 -- 
-- 
select * from opav.sl_ocs_detalle  
-- --update opav.sl_ocs_detalle  set cantidad_solicitada = 236, costo_unitario_compra =  10263, costo_total_compra = 2422068 
where id_ocs = (select id from opav.sl_orden_compra_servicio where cod_ocs ='IC081381') /*and referencia_externa = '9340030'--*/and codigo_insumo = 'MA06018'
-- 
-- 

select * from opav.sl_orden_compra_servicio where cod_ocs ='OC01614'
