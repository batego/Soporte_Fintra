---->los cambios se realizan tanto en cabecera como en detalle

--UPDATE etes.manifiesto_reanticipos 
SET 
   fecha_contabilizacion = now(),
   periodo_contabilizacion = '201509',
   transaccion = '7440184'
WHERE planilla = ('20150920_1')

--UPDATE etes.manifiesto_carga 
SET 
fecha_contabilizacion = now(),
periodo_contabilizacion ='201509',
transaccion = '7440182'
WHERE planilla = ('20150920')

select * from egreso where document_no = 'BC1160'

---------------------- CONTABLE-------------------------------------
select creation_date,periodo, * from con.comprobante 
--update con.comprobante set user_update = 'DVALENCIA',creation_date = '2018-04-02 10:16:50.202458' --, fecha_factura = fecha_factura - 1
--update con.comprobante set creation_date = '2018-04-02',  periodo = '201804'--, fechadoc = '2018-04-31',
--update con.comprobante set fechadoc = '2018-03-31'
where numdoc in ('R0035690')  
and reg_status = 'A'
and periodo = '201708'
and periodo = '201704'
 and tipodoc = 'NC'
and periodo != '201110'
    and grupo_transaccion = '9872128'
and periodo = '201611'
--and tipodoc = 'NC'
and periodo ='201608'

AND tercero = ?
AND periodo != ?


select creation_date,periodo,* from con.comprodet
--update con.comprodet set user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'--, fecha_factura = fecha_factura - 1
--update con.comprodet set creation_date = '2018-04-02', periodo = '201804'
--update con.comprodet set reg_status = ''
where numdoc in  ('R0035690') 
 and periodo = '201708'
and periodo = '201704'

and tipodoc = 'NC'
and grupo_transaccion = '9872128'
and periodo = '201611'

and tipodoc = 'NC'
and referencia_1!='' and tipodoc = 'NC' and periodo ='201602'
 AND tercero = ?
AND creation_date < ?

and periodo ='201602'

detalle = 'COMISIONES' AND tipodoc = 'FAP' LIMIT 10
AND creation_date < ?

select * from negocios 
--update negocios set periodo = '201701'
where cod_neg in ('FA31966','FA31967')
------------------------------------------------------------------
-----------------------TABLA FACTURA------------------------------,
---->los cambios se realizan tanto en cabecera como en detalle

select documento,nit,cmc,creation_date,fecha_factura,periodo,fecha_contabilizacion, * from con.factura
--update con.factura set user_update = 'DVALENCIA' ,fecha_factura ='2018-03-14', creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'  
--update con.factura set user_update = 'BTERRAZA' , periodo ='201804', fecha_contabilizacion = '2018-04-30'
--update con.factura set  user_update = 'DVALENCIA', valor_abono = 0.00, valor_saldo = 326235.00, valor_abonome = 0.00, valor_saldome = 326235.00
--update con.factura set fecha_contabilizacion =  '2018-01-31 18:37:43.07068'
 where  documento in  ('R0035690')
and  and 
extract(year from creation_date) = ?
and reg_status != 'A'
and substring(documento,1,2) in ('FC','FG')
order by fecha_vencimiento,fecha_factura

select * from negocios where cod_neg='FB02519'

select creation_date, * from con.factura_detalle
--update con.factura_detalle set user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'
where   documento in  ('R0000028')
 
AND nit =?

---------------------------------------------------------------------------
--------------------------TABLA INGRESO------------------------------------
---->cambiar fecha nota de ajuste son ingresos
select creation_date, fecha_ingreso, periodo ,fecha_contabilizacion, * from con.ingreso
--update con.ingreso set  user_update = 'DVALENCIA', periodo = '201706'---- creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'
--update con.ingreso set  user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -2 day 0 hour 0 min 0 s'
--update con.ingreso set  user_update = 'DVALENCIA', creation_date = '2018-03-31 00:00:00'
--update con.ingreso set user_update = 'DVALENCIA', reg_status = 'A'
--update con.ingreso set fecha_contabilizacion = '2017-10-31 00:00:00'
where num_ingreso in ('R0035690')

select creation_date, fecha_factura, periodo,cuenta,fecha_contabilizacion, * from con.ingreso_detalle 
--update con.ingreso_detalle set user_update = 'DVALENCIA', periodo= '201706'----creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'---periodo ='201502'
--update con.ingreso_detalle set  user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -2 day 0 hour 0 min 0 s'
--update con.ingreso_detalle set  user_update = 'DVALENCIA', creation_date = '2018-03-31 00:00:00'
--update con.ingreso_detalle set user_update = 'DVALENCIA', reg_status = 'A'
--update con.ingreso_detalle set fecha_contabilizacion = '2017-10-31 00:00:00'
where num_ingreso in ('R0035690')



---------------------------------------------------------------------------
--------------------------TABLA CXP----------------------------------------
--***se ingresa el numero de documentos para obtener el numero de proveedor 
----> Para quitar el anulado en reg_status se coloca solo camillas simples la A es de anulado 
select fecha_documento, creation_date, periodo, * from fin.cxp_doc 
--update fin.cxp_doc set  user_update='DVALENCIA',fecha_documento ='2018-01-31',creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s' --handle_code = 'OT', banco = 'BANCOLOMBIA'--reg_status ='', vlr_total_abonos = 0, vlr_saldo = 3134669.00 ,vlr_total_abonos_me = 0,vlr_saldo_me = 3134669.00, cheque ='', corrida= '' --creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'--, fecha_documento = '2015-09-27'
--update fin.cxp_doc set  user_update='BTERRAZA', periodo = '201710', creation_date = '2017-10-31 17:27:59' , fecha_contabilizacion =  '2017-10-31 17:27:59'
--update fin.cxp_doc set fecha_contabilizacion ='2018-01-31 18:37:43.07068'
where   documento in  ('CC707-001099','CC707-001101')  and tipo_documento = 'NC'
and periodo = '201706'

 and tipo_documento = 'NC'
and periodo = '201612'

'2016-11-02'
'2016-11-01'
'2016-11-01'
'2016-11-01'
'2016-11-01'

and tipo_documento= 'NC' and periodo = '201603'

and  proveedor= '9005254950' and --creation_date::date ='2016-03-02' and tipo_documento in ('FAP','NC','ND')

select creation_date,* from fin.cxp_items_doc 
--update fin.cxp_items_doc set user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -3 day 0 hour 0 min 0 s'
--update fin.cxp_items_doc set  user_update='BTERRAZA', creation_date = '2017-10-31 17:27:59'
where  documento in  ('CC707-001099','CC707-001101') and tipo_documento= 'NC'

and substring(creation_date,1,4) = '2017'

 and tipo_documento = 'NC'
 and creation_Date::date = '2016-12-01'

 and tipo_documento in ('FAP')--proveedor= ?  AND --creation_date::date ='2015-03-02' and tipo_documento in ('FAP','NC','ND')

select * from fin.cxp_imp_item where documento in (?)
--update fin.cxp_imp_item set reg_status = 'A' where documento in ('BT-98044') and vlr_total_impuesto = 3170048.00

select * from fin.cxp_imp_doc  where documento in ('R0031385','R0031390','R0031404','R0031414','R0031426','R0031445','R0031456','R0031475','R0031494','R0031502','R0031523','R0031524','R0031561','R0031595','R0031628','VSO20532') 

select * from fin.corridas where documento = ?  AND  tipo_documento in ('FAP')
---------------------------------------------------------------------------
---------------------------TABLA EGRESO------------------------------------

select creation_date, periodo,contabilizable , * from egreso 
--update egreso set user_update = 'DVALENCIA', periodo= '201709'-----contabilizable =?--creation_date = creation_date + interval '0 year 0 mons 0 week -2 day 0 hour 0 min 0 s'---payment_name=(select nombre from nit p where p.cedula = egreso.nit) 
--update egreso set  payment_name ='DISTRIBUIDORA  CONSTRUCASA S.A.'
--update egreso set  creation_date = '2017-10-31', fecha_contabilizacion =  '2017-10-31'
where document_no in  ('EG57983','EG57984','EG57985','EG57986','EG57987','EG57988','EG57989','EG57990','EG57991','EG57992','EG57993','EG57994','EG57995','EG57996','EG57997','EG57998',
'EG57999','EG58000','EG58001','EG58002','EG58003','EG58004','EG58005','EG58006','EG58007','EG58008','EG58009','EG58010','EG58011','EG58012','EG58013','EG58014','EG58015','EG58016','EG58017',
'EG58018','EG58019','EG58020','EG58021','EG58022','EG58023','EG58024','EG58025','EG58026','EG58027','EG58028','EG58029','EG58030','EG58031','EG58032','EG58033','EG58034','EG58035',
'EG58036','EG58037','EG58038','EG58039','EG58040','EG58041','EG58042','EG58043','EG58044','EG58045','EG58046','EG58047','EG58048','EG58049','EG58050','EG58051','EG58052','EG58053','EG58054')   and periodo = '' 
and nit = '9005254950' --branch_code =?and

select creation_date,* from egresodet 
--update egresodet set user_update = 'DVALENCIA', creation_date = creation_date + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s', last_update = now()
--update egresodet set  creation_date = '2017-10-31'
where document_no in  ('EG57983','EG57984','EG57985','EG57986','EG57987','EG57988','EG57989','EG57990','EG57991','EG57992','EG57993','EG57994','EG57995','EG57996','EG57997','EG57998',
'EG57999','EG58000','EG58001','EG58002','EG58003','EG58004','EG58005','EG58006','EG58007','EG58008','EG58009','EG58010','EG58011','EG58012','EG58013','EG58014','EG58015','EG58016','EG58017',
'EG58018','EG58019','EG58020','EG58021','EG58022','EG58023','EG58024','EG58025','EG58026','EG58027','EG58028','EG58029','EG58030','EG58031','EG58032','EG58033','EG58034','EG58035',
'EG58036','EG58037','EG58038','EG58039','EG58040','EG58041','EG58042','EG58043','EG58044','EG58045','EG58046','EG58047','EG58048','EG58049','EG58050','EG58051','EG58052','EG58053','EG58054') 
 AND branch_code = 'CAJA TESORERIA'

and creation_date::date = '2016-10-18'
and branch_code = 'BANCOLOMBIA' AND bank_account_no = 'CC'

select * from con.factura
--update con.factura set reg_status = 'A'
where ref1 in ('FOMS11352-16') or ref2 in ('FOMS11352-16') 




----------------------------------------------------------------------------
select * from fin.orden_servicio
--update fin.orden_servicio set user_update='DVALENCIA', periodo_os = '201610',  creation_date = creation_date + interval '0 year 0 mons 0 week -2 day 0 hour 0 min 0 s'
  where numero_operacion in ('382484','382490','382481','382480','7546991')


select creation_date from fin.orden_servicio_detalle  
--update fin.orden_servicio_detalle set creation_date = creation_date + interval '0 year 0 mons 0 week -2 day 0 hour 0 min 0 s'
  where numero_operacion in ('382484','382490','382481','382480','7546991')
-----------------------------------------------------------------------------




---------------------------------------------------------------------------
---------------------IF ingresos fenalco-----------------------------------
--- cod es el campo de la if si no lo dan se coloca codneg para consultar 
select (select cod_cli from negocios where cod_neg = codneg),* from ing_fenalco 
--update ing_fenalco set user_update = 'DVALENCIA',reg_status = 'A'----nit = (select cod_cli from negocios where cod_neg = codneg)
--where codneg = 'LB00826' and creation_date = '2017-06-23 12:14:58.548603'
--update ing_fenalco set user_update = 'DVALENCIA',reg_status = 'A'----nit = (select cod_cli from negocios where cod_neg = codneg)
where cod in ('IF172316203','IF172316204','CM500456503','CM500456504') --concodneg in --('FA17776') 






select * from negocios
--update negocios set user_update = 'MMEDINA',fecha_negocio=fecha_negocio + interval '0 year 0 mons 0 week -1 day 0 hour 0 min 0 s'
where cod_neg in (?)



select factura_mims, * from fin.anticipos_pagos_terceros where --factura_mims ='TR188551_85'

------------------------------------------------------------------------------------------
-----------------------------------SI NO CONTABILIZA--------------------------------------
--**se coloca el numero de proveerdor para verificar, si solo dan el numero de cxp se consulta en la tabla cxp para obtener el nit

select nit.cedula, nit.nombre, tsp.nombre as nombre_tsp 
from nit inner join nit_tsp tsp on tsp.cedula = nit.cedula
-- update nit set nombre ='SUGUROS BOLIVAR'
where nit.cedula in ('7645132')

select p.nit, p.payment_name, tsp.payment_name as nombre_tsp 
from proveedor p right join proveedor_tsp tsp on tsp.nit = p.nit
--update proveedor p set  payment_name ='SUGUROS BOLIVAR'
where p.nit in ('7645132')

select * from nit where cedula in ('102270589') 
select * from proveedor where nit in ('87571932')
select * from proveedor_tsp  where nit in ('87571932')



-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

select creation_date, document_no, periodo, nit, payment_name, transaccion, trim(to_char(vlr,'999G999G999G999D99')) as valor_egreso,
	trim(to_char((select sum(vlr) from egresodet det where det.document_no = egreso.document_no and det.transaccion = egreso.transaccion and reg_status !='A'),'999G999G999G999D99')) as suma_detalles,
	(select count(*) from egresodet det where det.document_no = egreso.document_no and det.transaccion = egreso.transaccion and reg_status !='A') as cantidad_detalles,
	vlr = vlr_for as vlrsequals, transaccion
from egreso
where document_no in ('BC481') 
and periodo in ('','0000') 
and reg_status != 'A'
and transaccion=?

select creation_date, num_ingreso, periodo, nitcli, transaccion, trim(to_char(vlr_ingreso,'999G999G999G999D99')) as valor_ingreso,
	trim(to_char((select sum(valor_ingreso) from con.ingreso_detalle det where det.num_ingreso = ingreso.num_ingreso and det.transaccion = ingreso.transaccion and reg_status !='A'),'999G999G999G999D99')) as suma_detalles,
	(select count(*) from con.ingreso_detalle det where det.num_ingreso = ingreso.num_ingreso and det.transaccion = ingreso.transaccion and reg_status !='A') as cantidad_detalles,
	vlr_ingreso = vlr_ingreso_me as vlrsequals
from con.ingreso
where num_ingreso in (?) 
and periodo in ('','0000') 
and reg_status != 'A'
and tipo_documento=?
and transaccion=?

-----------LINEA DE CREDITO----------------
select *
from fin.credito_bancario 
where documento = ? --CXP

select capital_inicial, *
from fin.credito_bancario_detalle
where documento = ? --CXP
and doc_pago in (?) --egresos

select * from convenios 
