/*** arhivo libro 1 ***
 actual : 'I010140014205'
 nueva  : '28150530'
 *****/
select cuenta, * from con.ingreso WHERE 
-- update con.ingreso set cuenta = '28150530', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010140014205' and periodo ='201901' and reg_status != 'A'
 
SELECT cuenta,periodo,* FROM con.ingreso_detalle where 
-- update con.ingreso_detalle set cuenta = '28150530', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010140014205' and periodo = '201901' and reg_status != 'A'

SELECT cuenta,periodo,* from con.comprodet WHERE 
--update con.comprodet set cuenta = '28150530', last_update=now(), user_update='BTERRAZA'  WHERE 
cuenta = 'I010140014205' and periodo='201901' 


select codigo_cuenta_contable,* from con.factura_detalle  where 
-- update con.factura_detalle set cuenta = '28150530', last_update=now(), user_update='BTERRAZA' WHERE
documento in ( select documento from con.factura where tipo_documento = 'FAC' and periodo = '201901')
--AND tipo_documento = 'FAC'
AND codigo_cuenta_contable ='I010140014205'

select codigo_cuenta,* from fin.cxp_items_doc where 
--update fin.cxp_items_doc set codigo_cuenta = '28150530', last_update=now(), user_update='MMEDINA' where 
documento in ( select documento from fin.cxp_doc where  periodo = '201901')
--AND tipo_documento = 'FAP'
AND codigo_cuenta = 'I010140014205'

SELECT cuenta,* FROM egresodet  where 
--update egresodet set cuenta = '28150530', last_update=now(), user_update='BTERRAZA' where 
document_no in (SELECT document_no FROM egreso where periodo ='201901')
and cuenta ='I010140014205'


/*** archivo 2 ***
 actual : I010130014205
 nueva  : 28150531
*****/

select cuenta, * from con.ingreso WHERE 
-- update con.ingreso set cuenta = '28150531', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010130014205' and periodo ='201901' and reg_status != 'A'

select * from con.ingreso where num_ingreso = 'IC304754'
select * from con.ingreso_detalle where num_ingreso = 'IC304754'
 
SELECT cuenta,periodo,* FROM con.ingreso_detalle where 
-- update con.ingreso_detalle set cuenta = '28150531', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010130014205' and periodo = '201901' and reg_status != 'A'
         'I010300014205'


SELECT cuenta,periodo,* from con.comprodet WHERE 
--update con.comprodet set cuenta = '28150531', last_update=now(), user_update='BTERRAZA'  WHERE 
cuenta = 'I010130014205' and periodo='201901' 


select codigo_cuenta_contable,* from con.factura_detalle  where 
-- update con.factura_detalle set cuenta = '28150531', last_update=now(), user_update='BTERRAZA' WHERE
documento in ( select documento from con.factura where  periodo = '201901')
--tipo_documento = 'FAC' and
AND codigo_cuenta_contable ='I010130014205'

select codigo_cuenta,* from fin.cxp_items_doc where 
--update fin.cxp_items_doc set codigo_cuenta = '28150531', last_update=now(), user_update='BTERRAZA' where 
documento in ( select documento from fin.cxp_doc where periodo = '201901')
--tipo_documento = 'FAP' and 
AND codigo_cuenta = 'I010130014205'

SELECT cuenta,* FROM egresodet  where 
--update egresodet set cuenta = '28150531', last_update=now(), user_update='BTERRAZA' where 
document_no in (SELECT document_no FROM egreso where periodo ='201901')
and cuenta ='I010130014205'



/*** archivo 3 ***
 actual : I010300014205
 nueva  : 28150533
*****/

select cuenta, * from con.ingreso WHERE 
-- update con.ingreso set cuenta = '28150533', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010300014205' and periodo ='201901' and reg_status != 'A'
 
SELECT cuenta,periodo,* FROM con.ingreso_detalle where 
-- update con.ingreso_detalle set cuenta = '28150533', last_update=now(), user_update='BTERRAZA' WHERE
cuenta = 'I010300014205' and periodo = '201901' and reg_status != 'A'

select * from con.comprobante limit 1

SELECT cuenta,periodo,* from con.comprodet WHERE 
--update con.comprodet set cuenta = '28150533', last_update=now(), user_update='BTERRAZA'  WHERE 
cuenta = 'I010300014205' and periodo='201901' 


select codigo_cuenta_contable,* from con.factura_detalle  where 
-- update con.factura_detalle set cuenta = '28150533', last_update=now(), user_update='BTERRAZA' WHERE
documento in ( select documento from con.factura where  periodo = '201901')
--tipo_documento = 'FAC' and
AND codigo_cuenta_contable ='I010300014205'

select codigo_cuenta,* from fin.cxp_items_doc where 
--update fin.cxp_items_doc set codigo_cuenta = '28150533', last_update=now(), user_update='BTERRAZA' where 
documento in ( select documento from fin.cxp_doc where periodo = '201901')
--tipo_documento = 'FAP' and 
AND codigo_cuenta = 'I010300014205'

SELECT cuenta,* FROM egresodet  where 
--update egresodet set cuenta = '28150533', last_update=now(), user_update='BTERRAZA' where 
document_no in (SELECT document_no FROM egreso where periodo ='201901')
and cuenta ='I010300014205'