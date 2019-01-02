CREATE TABLE tem.CXP000006208 as
SELECT * FROM fin.cxp_doc WHERE documento = 'CXP000006208';

CREATE TABLE tem.CXP000006208_det AS
SELECT * FROM fin.cxp_items_doc WHERE documento = 'CXP000006208';

select * from fin.cxp_doc 
--update fin.cxp_doc set vlr_total_abonos = 0, vlr_saldo = 3460000, vlr_total_abonos_me = 0, vlr_saldo_me = 3460000
where documento_Relacionado in ('MC17173'); 



SELECT * FROM FIN.cxp_doc WHERE documento_relacionado = 'MP14808';-- 333162


;
select * from con.comprodet 
--delete from con.comprodet
where numdoc in  (select document_no from  egresodet where document_no = 'EG64427')

CREATE TABLE tem.MC16440_egr_comprob AS ;			
select * from con.comprobante 
--delete from con.comprobante 
where numdoc in (select document_no from egreso where document_no = 'EG64427')

CREATE TABLE tem.MC16440_egrdt AS 	;		
select * from egresodet
--delete from egresodet
where document_no in ('EG64427');		

CREATE TABLE tem.MC16440_egr_egre AS ; 		
select * from egreso
--delete from egreso
where document_no in ('EG64427');


SELECT * FROM con.factura 
--delete from con.factura 
WHERE negasoc ='MC17173';

SELECT * FROM con.factura_detalle 
--delete from con.factura_detalle
WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc ='MC17173');



 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17173');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17173');


select * from ing_fenalco 
--DELETE FROM ing_fenalco 
where codneg = 'MC17173' ;


SELECT * FROM CON.comprobante WHERE numdoc IN (select COD from ing_fenalco WHERE codneg = 'MC17173');