--Ticket# 6651 description
--ANULAR EGRESOS - REESTABLECER SALDOS CXP - REESTABLECER NEGOCIOS EN MODULO DE TRANSFERENCIA 
--SOLICITO ANULAR LOS SIGUIENTES EGRESOS , ELIMINAR TODOS LOS DOCUMENTOS QUE SE GENERAN AL REALIZAR EL DESEMBOLSO DE MICROCREDITO EN CORE DE FINTRA
--
--EGRESO: 
--EG63277 $2.325.417 
--EG63278 $198.766
--
--REESTABLECER SALDO CXP 
--MP13883 CALDERA SOTO ZOILA ISABEL 25807288
--MP13877 MARTINEZ RODRIGUEZ RAMIRO 8742490
--
--REESTABLECER NEGOCIOS EN MODULO DE TRANSFERENCIA 
--MC16441 - EG63277
--MC16440 - EG63278









-- 1- Eliminar Cartera
-- 2- Diferidos
-- 3- Egresos
-- 4- Eliminar cxp efecty
-- 5- restablecer saldo cxp cliente
-- 6- cambiar estado para transferir nuevamente 


-- 1- Eliminar Cartera

--CONTABLE

CREATE TABLE tem.MC16441_comp AS 
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select documento from con.factura where negasoc = 'MC16441')

CREATE TABLE tem.MC16441_compdt AS 
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select documento from con.factura where negasoc = 'MC16441')


-- 2- Diferidos

CREATE TABLE tem.MC16441_ingfen AS 
select * from ing_fenalco where codneg = 'MC16441' 
-- delete from ing_fenalco where codneg = 'MC16441' 


-- 3- Egreso
CREATE TABLE tem.MC16441_egr_comp AS 				
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG63277')

CREATE TABLE tem.MC16441_egr_comprob AS 			
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG63277')

CREATE TABLE tem.MC16441_egrdt AS 			
select * from egresodet
--delete from egresodet
where document_no in ('EG63277')		

CREATE TABLE tem.MC16441_egr_egre AS  		
select * from egreso
--delete from egreso
where document_no in ('EG63277')


-- 4-
-- 5-
SELECT 2972690 - 627276
SELECT 2972690 - 2345414

CREATE TABLE tem.cxp_MC16441 AS 
select * from fin.cxp_doc 
--update fin.cxp_doc set vlr_total_abonos = 0, vlr_saldo = 3460000, vlr_total_abonos_me = 0, vlr_saldo_me = 3460000
where documento_Relacionado in ('MC16441')

SELECT * FROM fin.cxp_doc WHERE documento_Relacionado in ('MC16441') AND documento = 'CXP000005630'; 
--delete FROM fin.cxp_doc WHERE documento_Relacionado in ('MC16441') AND documento = 'CXP000005630'; 
-- 6-

Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC16441')
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC16441')

