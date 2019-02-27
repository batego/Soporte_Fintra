SELECT estado_neg, actividad,* FROM negocios WHERE cod_neg = 'LB01375';
SELECT estado_neg, actividad,* FROM negocios WHERE cod_neg = 'LB01367';
SELECT * FROM solicitud_aval WHERE cod_neg = 'LB01375';
---------------------------------------------------------------------
--Cartera Operativa
SELECT * FROM con.factura WHERE negasoc = 'LB01375';--Oper
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'LB01375');--Det

--Cartera cab Contable
SELECT * FROM con.comprobante 
WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'LB01375');

--Cartera det Contable
SELECT * FROM con.comprodet WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'LB01375');

---------------------------------------------------------------------
--Cxp Operativa
select * from fin.cxp_doc where documento_relacionado='LB01375';--Cab

select * from fin.cxp_items_doc 
where documento IN (select documento from fin.cxp_doc where documento_relacionado='LB01375');--Det

--Cxp Contable
SELECT * FROM con.comprobante 
WHERE numdoc IN (select documento from fin.cxp_doc where documento_relacionado='LB01375');

SELECT * FROM con.comprodet 
WHERE numdoc IN (select documento from fin.cxp_doc where documento_relacionado='LB01375');

---------------------------------------------------------------------
--Diferidos Operativo
SELECT * FROM ing_fenalco WHERE codneg = 'LB01375';


--Egreso Operativo
SELECT * FROM egreso WHERE document_no = 'EG66716';--Cab
SELECT * FROM egresodet WHERE document_no = 'EG66716';--Det}



SELECT * FROM con.comprobante WHERE numdoc ILIKE 'LB013%';



SELECT * FROM negocios_trazabilidad WHERE cod_neg =  'LB01375';

-- Actual parameter values may differ, what you see is a default string representation of values
DELETE FROM public.negocios_trazabilidad
WHERE dstrct='FINV' AND numero_solicitud=144626 AND actividad='DES' AND fecha='2019-02-06 14:47:12.801' ;
