ANULAR EGRESO Y TODOS LOS DOCUMENTOS GENERADOS AL DESEMBOLSAR NEGOCIO DE MICRO - 
REESTABLECER SALDO DE LA CXP - REESTABLECER NEGOCIO EN MODULO DE TRANSFERENCIA

ANULAR EGRESO Y DOCUMENTOS GENERADOS POR DESEMBOLSO DE NEGOCIO DE MICRO - 
REESTABLECER SALDO CXP Y REESTABLECER NEGOCIO EN EL MODULO DE TRANSFERENCIA:

EGRESO 
EG68407 $491 29/03/19

CXP
MP15991

NEGOCIO
MC18793 32251680 PINEDA CARDENAS PETRONA DEL CARMEN

--restablecer Saldo Cxp
CREATE TABLE tem.MC18793 AS; 
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MC18793';-- rest saldo    138710.00    20.488
SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MP15991';

-- Egreso
SELECT * FROM egreso WHERE document_no IN ('EG68407');--19997.00       138710.00
--delete FROM egreso WHERE document_no IN ('EG68407');

SELECT documento, document_no, vlr,* 
FROM egresodet WHERE document_no IN ('EG68407');
--delete FROM egresodet WHERE document_no IN ('EG68407');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG68407');
--delete FROM con.comprobante WHERE numdoc IN ('EG68407');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG68407');
--delete FROM con.comprodet WHERE numdoc IN ('EG68407');


--Cartera

CREATE TABLE tem.MC18793 AS;							--insert into con.factura select * from tem.MC18793
SELECT * FROM con.factura WHERE negasoc = 'MC18793';
--DELETE FROM con.factura WHERE negasoc = 'MC18793';

CREATE TABLE tem.MC18793_det AS;						--insert into con.factura_detalle  select * from tem.MC18793_det
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');
--delete FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');

CREATE TABLE tem.MC18793_comp AS;						--insert into con.comprobante  select * from tem.MC18793_comp
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');

CREATE TABLE tem.MC18793_compdt AS;						--insert into con.comprodet  select * from tem.MC18793_compdt
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18793');


--Diferido
CREATE TABLE tem.MC18793_dif AS;						--insert into ing_fenalco select * from tem.MC18793_dif
SELECT * FROM ing_fenalco WHERE codneg = 'MC18793';
--delete FROM ing_fenalco WHERE codneg = 'MC18793';


 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC18793');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC18793');