SELECT estado_neg, actividad, * FROM negocios WHERE cod_neg = 'MC17113';
SELECT estado_sol, numero_solicitud, * FROM solicitud_aval WHERE cod_neg = 'MC17113';

SELECT * FROM detalle_poliza_negocio WHERE cod_neg='136384';--135844

select * from fin.cxp_items_doc
--DELETE FROM fin.cxp_items_doc 
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC17113'));

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento_relacionado = 'MC17113';

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento_relacionado  IN ('MP14516');

SELECT * FROM fin.cxp_items_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento IN ('MP14516-FZ2','MP14516-FZ1');

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento IN ('MP14516-FZ2','MP14516-FZ1');

SELECT * FROM negocios_trazabilidad WHERE cod_neg = 'MC17113';


