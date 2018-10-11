--ANULAR EGRESO - REESTABLECER SALDO CXP - REESTABLECER NEGOCIO AL MODULO DE TRANSFERENCIA
--POR ERROR EL SIGUIENTE NEGOCIO FUE DESEMBOLSADO POR EL BANCO INCORRECTO:
--SOLICITO ANULAR EGRESO DESMARCAR 
--- ELIMINAR TODOS LOS DOCUMENTOS QUE SE GENERAN POR SER UN NEGOCIO DE MICROCREDITO 
--- REESTABLECER SALDO DE LA CXP Y COLOCAR NUEVAMENTE EL NEGOCIO EN EL MODULO DE TRANSFERENCIA 
--
--NEGOCIO MC16271 1045713513	BLANCO RUSSILL PEDRO MIGUEL
--CXP MP13687 $2.322.662
--EGRESO EG63050 



-- 1- Eliminar Cartera
-- 2- Diferidos
-- 3- Egresos
-- 4- Eliminar cxp efecty
-- 5- restablecer saldo cxp cliente
-- 6- cambiar estado para transferir nuevamente 


-- 1- Eliminar Cartera

--CONTABLE

CREATE TABLE tem.MC16271_comp AS 
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select documento from con.factura where negasoc = 'MC16271')

CREATE TABLE tem.MC16271_compdt AS 
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select documento from con.factura where negasoc = 'MC16271')


-- Operativo
CREATE TABLE tem.MC16271_facdet AS 
SELECT * FROM con.factura_detalle
--delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc = 'MC16271')

CREATE TABLE tem.MC16271_fact AS 
SELECT * FROM con.factura
--delete from con.factura
where negasoc in ('MC16271')



-- 2- Diferidos
CREATE TABLE tem.MC16271_comp_dif AS 
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select cod from ing_fenalco where codneg = 'MC16271' )

CREATE TABLE tem.MC16271_compdet AS 
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select cod from  ing_fenalco where codneg = 'MC16271')

CREATE TABLE tem.MC16271_ingfen AS 
select * from ing_fenalco where codneg = 'MC16271' 
-- delete from ing_fenalco where codneg = 'MC16271' 


-- 3- Egreso
CREATE TABLE tem.MC16271_egr_comp AS 				--SELECT * FROM tem.MC16271_egr_comp
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG63050')

CREATE TABLE tem.MC16271_egr_comprob AS 			--SELECT * FROM  tem.MC16271_egr_comprob
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG63050')

CREATE TABLE tem.MC16271_egrdt AS 			--SELECT * FROM  tem.MC16271_egrdt
select * from egresodet
--delete from egresodet
where document_no in ('EG63050')		--2322662.00

CREATE TABLE tem.MC16271_egr_egre AS  		--SELECT * FROM tem.MC16271_egr_egre
select * from egreso
--delete from egreso
where document_no in ('EG63050')


-- 4-
-- 5-

select * from fin.cxp_doc 
--update fin.cxp_doc set vlr_total_abonos = 0, vlr_saldo = 3460000, vlr_total_abonos_me = 0, vlr_saldo_me = 3460000
where documento_Relacionado in ('MC16271')


select* from con.comprodet where numdoc = 'MP12612'
select* from con.comprobante where numdoc = 'MP12612'

-- 6-

Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC16271')
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC16271')







