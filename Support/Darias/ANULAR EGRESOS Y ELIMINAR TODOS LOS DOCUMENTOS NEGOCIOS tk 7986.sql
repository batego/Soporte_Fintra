--ANULAR EGRESOS Y ELIMINAR TODOS LOS DOCUMENTOS NEGOCIOS - REESTABLECER NEGOCIOS AL MODULO 
--SOLICITO ANULAR Y ELIMINAR TODOS LOS DOCUMENTOS GENERADOS DE LOS SIGUIENTES NEGOCIOS - REESTABLECER SSALDO DE LAS CXP Y COLOCAR 
---LOS NEGOCIOS EN EL MODULO DE TRANSFERENCIA:
--
--EGRESOS 
--EG64539- EG64540 - EG64541 - EG64542 - EG64543 - EG64544 - EG64545 
--
--REESTABLECER SALDO CXP 
--MP14856
--MP14897
--MP14908
--MP14910
--MP14913
--MP14907
--MP14922
--
--
--COLOCAR NUEVAMENTE NEGOCIOS EN EL MODULO DE TRANSFERENCIA:
--MC17491
--MC17545
--MC17570
--MC17574
--MC17580
--MC17568
--MC17519

SELECT * FROM egreso WHERE document_no IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');
--delete FROM egreso WHERE document_no IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');

SELECT documento, document_no, vlr,* FROM egresodet WHERE document_no IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');
--delete FROM egresodet WHERE document_no IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');
--delete FROM con.comprobante WHERE numdoc IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');
--delete FROM con.comprodet WHERE numdoc IN ('EG64539','EG64540','EG64541','EG64542','EG64543','EG64544','EG64545');


SELECT documento,vlr_neto, vlr_total_abonos, vlr_saldo, vlr_neto_me, vlr_total_abonos_me, vlr_saldo_me,* FROM fin.cxp_doc WHERE documento IN ('MP14922');,
'MP14897',
'MP14908',
'MP14910',
'MP14913',
'MP14907',
'MP14922');	

SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MP14922'; 


MP14856	EG64539	1349669.00
MP14897	EG64540	2378310.00
MP14908	EG64541	990108.00
MP14910	EG64542	990108.00
MP14913	EG64543	2833100.00
MP14907	EG64544	995090.00
MP14922	EG64545	1458605.00



 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17491',
'MC17545',
'MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17491',
'MC17545',
'MC17570',
'MC17574',
'MC17580',
'MC17568',
'MC17519');






