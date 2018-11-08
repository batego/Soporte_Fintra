---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, f_desem, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC15205');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval swet estado_sol= 'D'
where cod_neg in ('MC15205');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',128305 , 'DES', 'BTERRAZA', NOW(),  'MC15205', 'Cliente desistio, segun lo informado por  HFERRER ');


SELECT * FROM detalle_poliza_negocio WHERE cod_neg = 'MC15205';


-- select * from negocios where cod_neg = 'MC15205'
---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)


--Eliminar las NC para los negocios que son compra de cartera
--1 se eliminan contablemente
SELECT * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP12815');
--delete FROM con.comprodet WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP14084');

SELECT * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP12815');
--delete FROM con.comprobante WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP14084');

--2 eliminar operativamente
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP12815');
--delete FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'MP14084');

SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'MP12815';
--delete FROM fin.cxp_doc WHERE documento_relacionado = 'MP14084';





-----------------------------------------------
/****       CXP Operativo y contable      ****/
-----------------------------------------------
--cxp cabecera contable
CREATE TABLE TEM.MC15205_CXP_compdt AS			--insert into con.comprobante select * from TEM.MC15205_CXP_compdt
SELECT * FROM con.comprobante 
--DELETE from con.comprobante
WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_Relacionado in ('MC15205')) AND documento != 'CXP000004790');

--cxp detalle contable
CREATE TABLE TEM.MC15205_CXP_comp AS			--insert into con.comprodet select * from TEM.MC15205_CXP_comp where documento != 'CXP000004790'
SELECT * FROM con.comprodet 
--DELETE from con.comprodet 
WHERE numdoc IN (SELECT documento FROM fin.cxp_doc WHERE documento_Relacionado in ('MC15205')) AND documento != 'CXP000004790')

--cxp  operativo detalle
CREATE TABLE TEM.MC15205_CXP_IT AS			-- insert into fin.cxp_items_doc SELECT * FROM TEM.MC15205_CXP_IT where documento != 'CXP000004790'
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC15205')) AND documento != 'CXP000004790';

--cxp operativo cabecera
CREATE TABLE TEM.MC15205_CXP AS				-- insert into fin.cxp_doc select * from TEM.MC15205_CXP where documento != 'CXP000004790'
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC15205') AND documento != 'CXP000004790';



-----------------------------------------------
/****       factura Operativo y contable      ****/
-----------------------------------------------

--factura contable cabecera
CREATE TABLE tem.comp_fact_mc15205 AS     	-- insert into con.comprobante  select * from tem.comp_fact_mc15205
SELECT * FROM con.comprobante 
--DELETE FROM con.comprobante 
WHERE numdoc IN (select documento from con.factura where negasoc in ('MC15205'));

--factura contable detalle
CREATE TABLE tem.comp_factdt_mc15205 AS     -- insert into con.comprodet select * from tem.comp_factdt_mc15205
SELECT * FROM con.comprodet 
--DELETE FROM con.comprodet
WHERE numdoc IN (select documento from con.factura where negasoc in ('MC15205'));

--factura Operativa detalle
CREATE TABLE TEM.MC15205_FACDET_IT AS		-- insert into con.factura_detalle select * from TEM.MC15205_FACDET_IT
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC15205'));

--factura Operativa cabecera
CREATE TABLE TEM.MC15205_FAC_IT AS          -- insert into con.factura select * from TEM.MC15205_FAC_IT
select * from con.factura 
--delete from con.factura
where negasoc in ('MC15205');


-----------------------------------------------
/****       Egreso Operativo y contable      ****/
-----------------------------------------------

--egreso operativo cabecera
CREATE TABLE TEM.MC15205_EGR_EG61137_IT AS		  -- insert into egreso select * from TEM.MC15205_EGR_EG61137_IT
select * from egreso
--delete from egreso
where document_no in ('EG61137');

--egreso operativo detalle
CREATE TABLE TEM.MC15205_EGRDET_EG61137_IT AS	   -- insert into egresodet select * from TEM.MC15205_EGRDET_EG61137_IT
select * from egresodet
--delete from egresodet
where document_no in ('EG61137');

--egreso contable cabecera
CREATE TABLE TEM.MC15205_EGR_EG61137_comp AS		-- insert into con.comprobante select * from TEM.MC15205_EGR_EG61137_comp
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('EG61137');

--egreso contable detalle
CREATE TABLE TEM.MC15205_EGRDET_EG61137_comdt AS  -- insert into con.comprodet select * from TEM.MC15205_EGRDET_EG61137_comdt
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('EG61137');


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC15205_COMPRO_IT AS		-- insert into con.comprobante select * from TEM.MC15205_COMPRO_IT
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC15205');

CREATE TABLE TEM.MC15205_COMPRODET_IT AS    -- insert into con.comprodet select * from TEM.MC15205_COMPRODET_IT
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC15205');


--SE ELIMINAN EN APOTEOSYS

-----------------------------------------------
/****       diferidos Operativo y contable      ****/
-----------------------------------------------
--direridos contable
CREATE TABLE TEM.MC15205_diferidos_com AS	-- insert into con.comprobante SELECT * FROM TEM.MC15205_diferidos_com;
SELECT * FROM con.comprobante 
--delete from con.comprobante
WHERE numdoc IN (SELECT cod FROM ing_fenalco WHERE codneg = 'MC15205');

CREATE TABLE TEM.MC15205_diferidos_conpdet AS	 -- insert into con.comprodet select * from TEM.MC15205_diferidos_conpdet
SELECT * FROM con.comprodet 
-- delete FROM con.comprodet 
WHERE numdoc IN (SELECT cod FROM ing_fenalco WHERE codneg = 'MC15205');


---DIFERIDOS (DIFERIDOS) operativo
CREATE TABLE TEM.MC15205_diferidos AS			--insert into ing_fenalco select * from TEM.MC15205_diferidos
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC15205');









