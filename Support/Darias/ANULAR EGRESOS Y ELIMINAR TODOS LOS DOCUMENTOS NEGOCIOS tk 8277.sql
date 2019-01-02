--ANULAR EGRESOS - REESTABLECER SALDO CXP - REESTABLECER NEGOCIOS EN MODULO DE TRANSFERENCIA
--SOLICITO ANULAR LOS SIGUIENTES EGRESOS - ELIMINAR TODOS LOS DOCUMENTOS GENERADOS - REESTABLECER SALDO CXP -
-- REESTABLECER NEGOCIOS EN EL MODULO DE TRANSFERENCIA 
--
--EGRESOS 
--EG64795 :MP14998
--EG64796 :MP15009
--EG64797 :MP15013
--
--CXP 
--MP14998 : 3.760.440.00
--MP15009 : 1.052.005.00
--MP15013
--
--
--NEGOCIOS
--MC17651 -- cartera, dieferidos, rest sald, elim egreso
--MC17667 -- cartera, dieferidos, rest sald, elim egreso
--MC17674
--

------------------------------------------------------------------------------
--MC17651

SELECT * FROM egreso WHERE document_no IN ('EG64795');
--delete FROM egreso WHERE document_no IN ('EG64795');

SELECT documento, document_no, vlr,* 
FROM egresodet WHERE document_no IN ('EG64795');
--delete FROM egresodet WHERE document_no IN ('EG64795');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG64795');
--delete FROM con.comprobante WHERE numdoc IN ('EG64795');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG64795');
--delete FROM con.comprodet WHERE numdoc IN ('EG64795');


SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC17651';-- rest saldo
CREATE TABLE tem.MC17651 as
SELECT * FROM con.factura WHERE negasoc = 'MC17651';
--DELETE FROM con.factura WHERE negasoc = 'MC17651';

CREATE TABLE tem.MC17651_det as
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');
--delete FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');

CREATE TABLE tem.MC17651_comp as
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');

CREATE TABLE tem.MC17651_compdt as
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17651');


CREATE TABLE tem.MC17651_dif as
SELECT * FROM ing_fenalco WHERE codneg = 'MC17651';
--delete FROM ing_fenalco WHERE codneg = 'MC17651';

select * FROM con.comprobante WHERE numdoc IN (SELECT cod FROM tem.MC17651_dif);

 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17651');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17651');

------------------------------------------------------------------------------
--MC17667

SELECT * FROM egreso WHERE document_no IN ('EG64796');
--delete FROM egreso WHERE document_no IN ('EG64796');

SELECT documento, document_no, vlr,* 
FROM egresodet WHERE document_no IN ('EG64796');
--delete FROM egresodet WHERE document_no IN ('EG64796');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG64796');
--delete FROM con.comprobante WHERE numdoc IN ('EG64796');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG64796');
--delete FROM con.comprodet WHERE numdoc IN ('EG64796');


SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC17667';-- rest saldo

CREATE TABLE tem.MC17667 as
SELECT * FROM con.factura WHERE negasoc = 'MC17667';
--DELETE FROM con.factura WHERE negasoc = 'MC17667';

CREATE TABLE tem.MC17667_det as
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');
--delete FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');

CREATE TABLE tem.MC17667_comp as
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');

CREATE TABLE tem.MC17667_compdt as
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17667');


CREATE TABLE tem.MC17667_dif as
SELECT * FROM ing_fenalco WHERE codneg = 'MC17667';
--delete FROM ing_fenalco WHERE codneg = 'MC17667';

select * FROM con.comprobante WHERE numdoc IN (SELECT cod FROM tem.MC17667_dif);

 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17667');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17667');

---------------------------------------------------------------------------------------------------------
--MC17674

SELECT * FROM egreso WHERE document_no IN ('EG64797');
--delete FROM egreso WHERE document_no IN ('EG64797');

SELECT documento, document_no, vlr,* 
FROM egresodet WHERE document_no IN ('EG64797');
--delete FROM egresodet WHERE document_no IN ('EG64797');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG64797');
--delete FROM con.comprobante WHERE numdoc IN ('EG64797');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG64797');
--delete FROM con.comprodet WHERE numdoc IN ('EG64797');


SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC17674';-- rest saldo

CREATE TABLE tem.MC17674 as
SELECT * FROM con.factura WHERE negasoc = 'MC17674';
--DELETE FROM con.factura WHERE negasoc = 'MC17674';

CREATE TABLE tem.MC17674_det as
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');
--delete FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');

CREATE TABLE tem.MC17674_comp as
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');

CREATE TABLE tem.MC17674_compdt as
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17674');


CREATE TABLE tem.MC17674_dif as
SELECT * FROM ing_fenalco WHERE codneg = 'MC17674';
--delete FROM ing_fenalco WHERE codneg = 'MC17674';

select * FROM con.comprobante WHERE numdoc IN (SELECT cod FROM tem.MC17674_dif);

 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17674');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17674');
