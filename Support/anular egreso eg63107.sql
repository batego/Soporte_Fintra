ANULAR EGRESO Y REESTABLECER NEGOCIO EN EL MODULO DE TRANSFERENCIA 
SOLICITO ANULAR EGRESO Y TODOS LOS DOCUMENTOS GENERADOS DEL SIGUIENTE NEGOCIO , REESTABLECER SALDO DE LA CXP Y COLOCAR EL NEGOCIO NUEVAMENTE EN EL MODULO DE TRANSFERENCIA DE NEGOCIOS:

ANULAR Y ELIMINAR EGRESO EG63107 $3.714.403
NEGOCIO MC16404 RAMOS MOLINA LUZ MARIA 32763133
REESTABLECER SALDO DE LA CXP MP13798 

CONFIRMAR AL CORREO CUANDO LOS CAMBIOS SEAN REALIZADOS 




-- 1- Eliminar Cartera - no
-- 2- Diferidos
-- 3- Egresos
-- 4- Eliminar cxp efecty
-- 5- restablecer saldo cxp cliente
-- 6- cambiar estado para transferir nuevamente 


-- 1- Eliminar Cartera

--CONTABLE

--CREATE TABLE tem.MC16271_comp AS 
--select * from con.comprobante 
----delete from con.comprobante 
--where numdoc in (select documento from con.factura where negasoc = 'MC16271')
--
--CREATE TABLE tem.MC16271_compdt AS 
--select * from con.comprodet 
----delete from con.comprodet
--where numdoc in  (select documento from con.factura where negasoc = 'MC16271')


-- Operativo
--CREATE TABLE tem.MC16271_facdet AS 
--SELECT * FROM con.factura_detalle
----delete from con.factura_detalle
--where documento in (select documento from con.factura where negasoc = 'MC16271')
--
--CREATE TABLE tem.MC16271_fact AS 
--SELECT * FROM con.factura
----delete from con.factura
--where negasoc in ('MC16271')



-- 2- Diferidos
CREATE TABLE tem.MC16271_comp_dif AS 
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select cod from ing_fenalco where codneg = 'MC16271' )

CREATE TABLE tem.MC16271_compdet AS 
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select cod from  ing_fenalco where codneg = 'MC16271')

CREATE TABLE tem.MC16404_ingfen AS 
select * from ing_fenalco where codneg = 'MC16404' 
-- delete from ing_fenalco where codneg = 'MC16404' 


-- 3- Egreso
CREATE TABLE tem.EG63107_egr_comp AS 				--SELECT * FROM tem.MC16271_egr_comp
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG63107')

CREATE TABLE tem.EG63107_egr_comprob AS 			--SELECT * FROM  tem.MC16271_egr_comprob
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG63107') 

CREATE TABLE tem.EG63107_egrdt AS 			--SELECT * FROM  tem.MC16271_egrdt
select * from egresodet
--delete from egresodet
where document_no in ('EG63107')		--2.101.839.56

CREATE TABLE tem.EG63107_egr_egre AS  		--SELECT * FROM tem.MC16271_egr_egre
select * from egreso
--delete from egreso
where document_no in ('EG63107')       --2.081.842.56

 SELECT 2204000.00-102150;
-- 4-
-- 5-

select * from fin.cxp_doc 
--update fin.cxp_doc set vlr_total_abonos = 0, vlr_saldo = 3460000, vlr_total_abonos_me = 0, vlr_saldo_me = 3460000
where documento_Relacionado in ('MC16404');

SELECT 2204000.00 - 2101839.56;
select* from con.comprodet where numdoc = 'MP12612'
select* from con.comprobante where numdoc = 'MP12612'

-- 6-

Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC16404')
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC16404')
