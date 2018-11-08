SELECT estado_neg, actividad,* FROM negocioS WHERE cod_neg = 'LB01296';
SELECT estado_sol,* FROM solicitud_aval WHERE cod_neg = 'LB01296'; 

SELECT * FROM negocios_trazabilidad WHERE cod_neg ='LB01296';

CREATE TABLE TEM.LB01296_CXP AS				--SELECT * FROM  TEM.LB01296_CXP
select * from fin.cxp_doc
--delete from fin.cxp_doc
where documento_Relacionado in ('LB01296');

CREATE TABLE TEM.LB01296_CXP_IT AS			--SELECT * FROM TEM.LB01296_CXP_IT;
select * from fin.cxp_items_doc
--delete from fin.cxp_items_doc
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('LB01296'));


CREATE TABLE tem.fact_LB01296 AS			-- select * from tem.fact_LB01296;
select * from con.factura 
--delete from con.factura
where negasoc in ('LB01296')

CREATE TABLE tem.fact_det_LB01296 AS		--select * from tem.fact_det_LB01296
select * from con.factura_detalle
-- delete from con.factura_detalle
where documento in (select documento from con.factura where negasoc in ('LB01296'))


--CONTABLE (CON.COMPROBANTE, CON.COMPRODET)

CREATE TABLE tem.comprob_LB01296 as
select * from con.comprobante
--delete from con.comprobante
where numdoc in ('LB01296')

CREATE TABLE tem.comprodet_LB01296 as
select * from con.comprodet
--delete from con.comprodet
where numdoc in ('LB01296')


--SE ELIMINAN EN APOTEOSYS


---DIFERIDOS (DIFERIDOS)
CREATE TABLE tem.fen_LB01296 as
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('LB01296') ORDER BY cuota;

CREATE TABLE tem.LB01296_A AS 
---update ing_fenalco SET reg_status = '' WHERE reg_status = 'A' AND codneg = 'LB01296' ORDER BY cuota;

SELECT * FROM tem.lb01296_a;
SELECT * FROM tem.fen_LB01296 ;

CREATE TABLE tem.LB01296_cuota1 AS 
SELECT * FROM ing_fenalco WHERE codneg = 'LB01296' AND  cuota = '1';

--otra copia tem.fen_LB01296_2

SELECT * FROM con.comprobante WHERE numdoc IN (SELECT cod FROM tem.lb01296_a);
SELECT * FROM con.comprodet WHERE numdoc = 'LI000024782';






