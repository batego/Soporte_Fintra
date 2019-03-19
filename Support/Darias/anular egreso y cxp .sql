/*
	ANULAR EGRESOS - ELIMINAR DOCUMENTOS GENERADOS POR NEGOCIOS - REESTABLECER SALDO CXP - DEVOLVER NEGOCIOS A BANDEJA DE TRANSFERENCIA 
	SOLICITO ANULAR LOS SIGUIENTES EGRESOS Y LOS DOCUMENTOS GENERADOS POR EL DESEMBOLSO ASI COMO REESTABLECER EL SALDO DE LA CXP Y 
	COLOCAR EL NEGOCIO NUEVAMENTE EN LA BANDEJA DE TRANSFERENCIAS DEL MODULO TRANSFERIR NEGOCIOS 
	
	EGRESOS 
	EG67920
	EG67921
	EG67928
	
	CXP
	MP15950 
	MP15968
	MP15963
	
	NEGOCIOS 
	MC18728 4545703	BUENO TAPASCO OCTAVIO DE JESUS
	MC18701 1193114228	GUZMAN MACHADO CARLOS MARIO
	MC18712 64718566	NAVARRO MORALES ALICIA ISABEL 
*/

--cxp cab y det: MC18728
CREATE TABLE tem.MC18728 AS 					
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC18728';

CREATE TABLE tem.MC18728_det AS 
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MC18728');


--restablecer Saldo Cxp
SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC18728'; -- rest saldo
SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MP15950';

SELECT * FROM fin.cxp_items_doc WHERE documento = 'CXP000006970';

-- Egreso
SELECT * FROM egreso WHERE document_no IN ('EG67920');
--delete FROM egreso WHERE document_no IN ('EG67920');

SELECT documento, document_no, vlr,* 
FROM egresodet WHERE document_no IN ('EG67920');
--delete FROM egresodet WHERE document_no IN ('EG67920');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG67920');
--delete FROM con.comprobante WHERE numdoc IN ('EG67920');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG67920');
--delete FROM con.comprodet WHERE numdoc IN ('EG67920');


/*
 * --Cartera

CREATE TABLE tem.MC18354 AS;							--insert into con.factura select * from tem.MC18354
SELECT * FROM con.factura WHERE negasoc = 'MC18728';
--DELETE FROM con.factura WHERE negasoc = 'MC18354';

CREATE TABLE tem.MC18354_det AS;						--insert into con.factura_detalle  select * from tem.MC18354_det
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18728');
--delete FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18354');

CREATE TABLE tem.MC18354_comp AS;						--insert into con.comprobante  select * from tem.MC18354_comp
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18728');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18354');

CREATE TABLE tem.MC18354_compdt AS;						--insert into con.comprodet  select * from tem.MC18354_compdt
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18728');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18354');


--Diferido
CREATE TABLE tem.MC18354_dif AS;						--insert into ing_fenalco select * from tem.MC18354_dif
SELECT * FROM ing_fenalco WHERE codneg = 'MC18728';
--delete FROM ing_fenalco WHERE codneg = 'MC18354';
*/


 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC18728');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC18728');