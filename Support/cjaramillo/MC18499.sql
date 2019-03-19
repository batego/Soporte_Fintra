---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('MC18499');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('MC18499');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',147716 , 'DES', 'BTERRAZA', NOW(),  'MC18499', 'Cliente desistio, segun lo informado por  CAROLINA JARAMILLO');

-- select * from negocios where cod_neg = 'MC18499'
---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC,)

CREATE TABLE TEM.MC18499_CXP AS	;		
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MC18499'); 

CREATE TABLE TEM.MC18499_CXP_IT AS	;		
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC18499'));

CREATE TABLE TEM.MC18499_notas AS;	
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('MP15764');

CREATE TABLE TEM.MC18499_notas_det AS;	
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MP15764'));

--COntable (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

select * from con.comprobante where numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MC18499'));
select * from con.comprodet where numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MC18499'));

select * from con.comprobante where numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MP15764'));
select * from con.comprodet where numdoc IN (select documento from fin.cxp_doc where documento_Relacionado in ('MP15764'));


--Cartera Operativo
CREATE TABLE TEM.MC18499_FAC_IT AS;
select * from con.factura --LIMIT 20	SELECT * FROM CON.FACTURA 
--delete from con.factura
where negasoc in ('MC18499');

CREATE TABLE TEM.MC18499_FACDET_IT AS;
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('MC18499'));

--Cartera contable
select * from con.comprobante where numdoc IN (select documento from con.factura where negasoc in ('MC18499'));
select * from con.comprodet where numdoc IN (select documento from con.factura where negasoc in ('MC18499'));



--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.MC18499_COMPRO_IT AS;
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('MC18499');

CREATE TABLE TEM.MC18499_COMPRODET_IT AS;
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('MC18499');


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE TEM.MC18499_diferidos AS;			--select * from TEM.MC18499_diferidos
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC18499');

select * from con.comprobante where numdoc IN (select numdoc from ing_fenalco where codneg in ('MC18499'));
