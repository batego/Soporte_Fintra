---1. CAMBIAR ESTADO DEL NEGOCIO A DESISTIDO EN LA TABLA NEGOCIO Y SOLICITUD_AVAL
Select actividad, estado_neg, cod_neg, nit_tercero, vr_negocio, financia_aval, negocio_rel, tasa,pend_perfeccionamiento, * from negocios
--update negocios set update_user = 'BTERRAZA', estado_neg = 'D'
where cod_neg in  ('FE03849');

select estado_sol, cod_neg, numero_solicitud from solicitud_aval --where numero_solicitud = '104550'
--update solicitud_aval set estado_sol= 'D'
where cod_neg in ('FE03849');


---.2. SE INSERTAR LA TRAZABILIDAD
INSERT INTO negocios_trazabilidad(
reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios)
VALUES ('', 'FINV',143788 , 'DES', 'BTERRAZA', NOW(),  'FE03849', 'Cliente desistio, segun lo informado por  HFERRER ');

SELECT * FROM NEGOCIOS WHERE COD_NEG = 'FE03849'
---3. ELIMINAR DOCUMENTOS OPERATIVOS Y CONTABLES

--OPERATIVO (FIN.CXP_DOC, FIN.CXP_ITEMS_DOC, CON.FACTURA, CON.FACTURA_DETALLE, EGRESO Y EGRESODET)

CREATE TABLE TEM.FE03849_CXP AS				--SELECT * FROM TEM.FE03849_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('FE03849')

CREATE TABLE TEM.FE03849_CXP_IT AS
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (SELECT documento FROM FIN.cxp_doc WHERE documento_Relacionado in ('FE03849'))

--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE TEM.FE03849_COMPRO_IT AS
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('FE03849')

CREATE TABLE TEM.FE03849_COMPRODET_IT AS
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('FE03849')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE TEM.FE03849_DIFERIDOS AS
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('FE03849');



PM36163
PM36162;
SELECT * FROM FIN.cxp_doc WHERE documento IN (SELECT COD FROM TEM.FE03849_DIFERIDOS); 




