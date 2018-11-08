SELECT estado_neg, actividad, * FROM negocios WHERE cod_neg = 'MC16871';
SELECT numero_solicitud, * FROM solicitud_aval WHERE cod_neg = 'MC16871';

SELECT * FROM detalle_poliza_negocio WHERE cod_neg='135739';

select * from fin.cxp_items_doc
--DELETE FROM fin.cxp_items_doc 
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC16871'));

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento_relacionado = 'MC16871';

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento_relacionado = 'MP14273';

SELECT * FROM fin.cxp_items_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento  IN ('MP14273-FZ2','MP14273-FZ1');


