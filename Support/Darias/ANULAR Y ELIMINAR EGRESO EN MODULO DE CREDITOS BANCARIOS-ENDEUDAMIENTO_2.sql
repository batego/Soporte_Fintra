SELECT 182997223 + 78299075 + 13514560 + 1370485013;

select * from egreso WHERE document_no = 'BC39'; --182997223.00
select * from egresodet WHERE document_no = 'BC39';

select * from egreso WHERE document_no = 'BC35'; --78299075.00
select * from egresodet WHERE document_no = 'BC35';

SELECT * FROM CON.comprobante WHERE numdoc IN ('BC39');
SELECT * FROM CON.comproDET WHERE numdoc IN ('BC39');

SELECT * FROM CON.comprobante WHERE numdoc IN ('BC35');
SELECT * FROM CON.comproDET WHERE numdoc IN ('BC35');

SELECT * FROM FIN.cxp_doc WHERE documento = '206010023004-ND16'; --13514560.00
SELECT * FROM FIN.cxp_ITEMS_doc WHERE documento = '206010023004-ND16';

SELECT * FROM FIN.cxp_doc WHERE documento = '206010023004-ND17';
SELECT * FROM FIN.cxp_ITEMS_doc WHERE documento = '206010023004-ND17';

SELECT * FROM CON.comprobante WHERE numdoc IN ('206010023004-ND16');
SELECT * FROM CON.comproDET WHERE numdoc IN ('206010023004-ND16');

SELECT * FROM CON.comprobante WHERE numdoc IN ('206010023004-ND17');
SELECT * FROM CON.comproDET WHERE numdoc IN ('206010023004-ND17');

SELECT * FROM FIN.cxp_doc WHERE documento = '206010023004';
SELECT * FROM FIN.cxp_items_doc WHERE documento = '206010023004';

CREATE TABLE tem.darias_206010023004 AS ;
select * from fin.credito_bancario_detalle where documento='206010023004';