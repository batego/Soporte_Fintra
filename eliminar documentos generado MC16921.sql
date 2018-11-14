SELECT estado_neg, actividad, * FROM negocios WHERE cod_neg = 'MC16921';
SELECT estado_sol, numero_solicitud, * FROM solicitud_aval WHERE cod_neg = 'MC16921';

SELECT * FROM detalle_poliza_negocio WHERE cod_neg='MC16921';--135844

select * from fin.cxp_items_doc
--DELETE FROM fin.cxp_items_doc 
where documento in (select documento from fin.cxp_doc where documento_Relacionado in ('MC16921'));

SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_doc 
WHERE documento_relacionado = 'MC16921';



SELECT * FROM fin.cxp_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento_relacionado  IN ('MP14326','MP14328');

SELECT * FROM fin.cxp_items_doc 
--DELETE FROM fin.cxp_items_doc 
WHERE documento IN ('MP14326-FZ1',
'MP14326-FZ2');


