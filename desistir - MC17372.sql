
---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC17372');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC17372');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',137136, 'DES', 'BTERRAZA', NOW(),  'MC17372', 'Cliente desistio, segun lo informado por  HENRRY FERRER ');


---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.MC17372_CXP AS;				--SELECT * FROM TEM.MC17372_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC17372'); 


CREATE TABLE TEM.MC17372_CXP_IT AS;
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (SELECT documento FROM fin.cxp_doc WHERE documento_Relacionado in ('MC17372'));

CREATE TABLE TEM.MC17372_FAC AS						--SELECT * FROM TEM.MC17372_FAC
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('MC17372')


CREATE TABLE TEM.MC17372_FAC_DET AS;
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC17372'))




--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC17372_COMPR AS;
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC17372')


CREATE TABLE TEM.MC17372_COMPRODET AS;
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC17372')

CREATE TABLE tem.comp_MC17372 AS 
SELECT * FROM con.comprobante 
--DELETE from con.comprobante
WHERE numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MC17372')); 


CREATE TABLE tem.compdet_MC17372 AS     --select * from tem.compdet_MC17372
SELECT * FROM con.comprodet 
--DELETE from con.comprodet
WHERE numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MC17372')); 


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE tem.ing_fen AS ;
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC17372');




