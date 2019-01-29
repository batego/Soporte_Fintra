--ANULAR Y ELIMINAR EGRESO - RESTABLECER SALDO DE CXP - COLOCAR NEGOCIOS EN MODULO DE TRANSFERENCIA DE NEGOCIOS 
--ANULAR Y ELIMINAR EGRESO Y TODOS LOS DOCUMENTOS GENERADOS DE LOS SIGUIENTES NEGOCIOS DESEMBOLSADOS - REESTABLECER SALDO DE LAS CXP - COLOCAR LOS NEGOCIOS EN MODULO DE TRANSFERENCIA DE NEGOCIOS PARA TRANSFERIR CORRECTAMENTE:
--
--EGRESOS 
--EG65456
--EG65457
--EG65458
--EG65459
--EG65460
--EG65461
--
--REESTABLECER SALDO CXP
--MP15109
--MP15125
--MP15128
--MP15131
--MP15132
--MP15138
--
--
--NEGOCIOS 
--COD NEG	NIT TERCERO	AFILIADO
--MC17780	70522292	ROJAS BERNARDO 						CXP000006404
--MC17822	1064980831	HERNANDEZ MONTES KATERINE MARIA     CXP000006405
--MC17823	1065001358	AYALA GUERRERO CELYMAR				CXP000006406
--MC17824	50902619	GALEANO MARTINEZ LIBIA BIBIAN
--MC17806	1064997596	POSADA GOMEZ YENIFER YULIETH
--MC17803	50897771	SALGADO MERCADO JAQUELINE INES

--RECUERDO QUE HAY QUE ELMINAR TODOS LOS DOCUMENTOS QUE SE GENERAN INCLUSIVE LA CXP AUTOMATICAS A NOMBRE DE EFECTY
------------------------------------------------------------------------------
--si son compra de cartera no se deben eliminar la cartera ni diferidos

SELECT * FROM egreso WHERE document_no IN ('EG65461');

SELECT * FROM egresodet WHERE document_no IN ('EG65461');

SELECT * FROM con.comprobante WHERE numdoc IN ('EG65461');

SELECT * FROM con.comprodet WHERE numdoc IN ('EG65461');

121.320

SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC17803';-- Restablecer el saldo MP 
SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MP15138';-- nc
--Efecty
SELECT * FROM fin.cxp_items_doc WHERE documento ='CXP000006409';
SELECT * FROM con.comprobante WHERE numdoc IN ('CXP000006409');
SELECT * FROM con.comprodet WHERE numdoc IN ('CXP000006409');

---------------------------Cartera-------------------------
CREATE TABLE tem.MC17803_compdt AS;				
select * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17803');

CREATE TABLE tem.MC17803_comp AS;
select * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17803');

CREATE TABLE tem.MC17803_det AS;
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC17803');

CREATE TABLE tem.MC17803 AS;
SELECT * FROM con.factura WHERE negasoc = 'MC17803';

--diferidos
CREATE TABLE tem.MC17803_dif AS;
SELECT * FROM ing_fenalco WHERE codneg = 'MC17803';


--------------------FIn Cartera-----------------------

 Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, 
financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios 
--update negocios set update_user = 'BTERRAZA', estado_neg = 'A', actividad = 'FOR'
where cod_neg in  ('MC17803');
-- 
-- actividad = 'FOR'
-- estado_neg = 'A'

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'A' 
where cod_neg in ('MC17803');

SELECT vlr_neto,* FROM fin.cxp_doc WHERE documento_relacionado = 'MC17803'; -- tipo_referencia_1 = ''






------Backup Negocios ------
CREATE TABLE tem.MC17822_comp AS;
CREATE TABLE tem.MC17822_compdt AS;
CREATE TABLE tem.MC17822_det AS;
CREATE TABLE tem.MC17822 AS;
CREATE TABLE tem.MC17822_dif AS;


CREATE TABLE tem.MC17823_compdt AS		
CREATE TABLE tem.MC17823_comp AS
CREATE TABLE tem.MC17823_det AS
CREATE TABLE tem.MC17823 AS
CREATE TABLE tem.MC17823_dif AS


CREATE TABLE tem.MC17824_compdt AS				
CREATE TABLE tem.MC17824_comp AS
CREATE TABLE tem.MC17824_det AS
CREATE TABLE tem.MC17824 AS
CREATE TABLE tem.MC17824_dif AS


CREATE TABLE tem.MC17806_compdt AS;				
CREATE TABLE tem.MC17806_comp AS;
CREATE TABLE tem.MC17806_det AS;
CREATE TABLE tem.MC17806 AS;
CREATE TABLE tem.MC17806_dif AS;

