select * from egreso WHERE document_no = 'BC38';
select * from egresodet WHERE document_no = 'BC38';

SELECT * FROM CON.comprobante WHERE numdoc IN ('BC38');
SELECT * FROM CON.comproDET WHERE numdoc IN ('BC38');

SELECT * FROM FIN.cxp_doc WHERE documento = '206010023004-ND15';
SELECT * FROM FIN.cxp_ITEMS_doc WHERE documento = '206010023004-ND15';

SELECT * FROM FIN.cxp_doc WHERE documento = '206010023004';--308.972.223
SELECT * FROM FIN.cxp_items_doc WHERE documento = '206010023004';

SELECT 2309665178 - 13514560; --2296150618
SELECT 1604752191 + 13514560

CREATE TABLE tem.darias_206010023004 AS ;
select * from fin.credito_bancario_detalle where documento='206010023004';