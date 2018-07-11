--ELIMINAR EGRESO Y TODOS LOS DOCUMENTOS GENERADOS NEGOCIO MICRO 
-- SOLICITO ELIMINAR EGRESO Y TODOS LOS DOCUMENTOS GENERADOS AL DESEMBOLSAR EL SIGUIENTE NEGOCIO DE MICRO Y COLOCAR EL NEGOCIO NUEVAMENTE EN EL MODULO DE TRANSFERENCIA:
-- COD NEG	NIT TERCERO	AFILIADO
-- MC14913	10951160	GONZALEZ VEGA EDUARD GIOVANNY
-- EGRESO : EG60218 $3.440.003
-- REESTABLECER SALDO CXP MP12612 $3.500.000


-- 1- Eliminar Cartera
-- 2- Diferidos
-- 3- Egresos
-- 4- Eliminar cxp efecty
-- 5- restablecer saldo cxp cliente
-- 6- cambiar estado para transferir nuevamente 


-- 1- Eliminar Cartera

--CONTABLE

select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select documento from con.factura where negasoc = 'MC14913')

select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select documento from con.factura where negasoc = 'MC14913')


-- Operativo
create table tem.MC14913_fac_det as
SELECT * FROM con.factura_detalle
--delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc = 'MC14913')

create table tem.MC14913_fac as
SELECT * FROM con.factura
--delete from con.factura
where negasoc in ('MC14913')



-- 2- Diferidos

select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select cod from ing_fenalco where codneg = 'MC14913' )

select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select cod from  ing_fenalco where codneg = 'MC14913')

select * from ing_fenalco where codneg = 'MC14913' 
-- delete from ing_fenalco where codneg = 'MC14913' 


-- 3- Egreso

select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG60218')

select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG60218')

select * from egresodet
--delete from egresodet
where document_no in ('EG60218')

select * from egreso
--delete from egreso
where document_no in ('EG60218')



-- 4-
-- 5-

select * from fin.cxp_doc 
--update fin.cxp_doc set vlr_total_abonos = 0, vlr_saldo = 3460000, vlr_total_abonos_me = 0, vlr_saldo_me = 3460000
where documento_Relacionado in ('MC14913')


select* from con.comprodet where numdoc = 'MP12612'
select* from con.comprobante where numdoc = 'MP12612'

-- 6-

Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC14913')
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC14913')







