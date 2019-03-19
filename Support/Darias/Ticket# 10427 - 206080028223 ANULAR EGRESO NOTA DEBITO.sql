CREATE TABLE TEM.BC42_EG AS ;
select * from egreso WHERE document_no = 'BC42';

CREATE TABLE TEM.BC42_EGDT AS; 
select * from egresodet WHERE document_no = 'BC42';

CREATE TABLE TEM.BC42_COMP AS ;		
SELECT * FROM CON.comprobante WHERE numdoc IN ('BC42');
CREATE TABLE TEM.BC42_COMPDT AS; 
SELECT * FROM CON.comproDET WHERE numdoc IN ('BC42');

--Nota debito Operativo
CREATE TABLE TEM.ND5_ND AS;
SELECT * FROM FIN.cxp_doc WHERE documento = '206080028223-ND5';

CREATE TABLE TEM.ND5_NDDT AS;
SELECT * FROM FIN.cxp_ITEMS_doc WHERE documento = '206080028223-ND5';

CREATE TABLE TEM.ND4_ND AS;
SELECT * FROM FIN.cxp_doc WHERE documento = '206080028223-ND4';

CREATE TABLE TEM.ND4_NDDT AS;
SELECT * FROM FIN.cxp_ITEMS_doc WHERE documento = '206080028223-ND4';

--Nota debito Contable
CREATE TABLE TEM.ND5_NDC AS;
SELECT * FROM con.comprobante WHERE numdoc = '206080028223-ND5';

CREATE TABLE TEM.ND5_NDCD AS;
SELECT * FROM con.comprodet WHERE numdoc = '206080028223-ND5';

CREATE TABLE TEM.ND4_NDC AS;
SELECT * FROM con.comprobante WHERE numdoc = '206080028223-ND4';

CREATE TABLE TEM.ND4_NDCD AS;
SELECT * FROM con.comprodet WHERE numdoc = '206080028223-ND4';
----------------------------------------------------------------------------

SELECT * FROM FIN.cxp_doc WHERE documento = '206080028223';--308.972.223
SELECT * FROM FIN.cxp_items_doc WHERE documento = '206080028223';


CREATE TABLE tem.darias_206080028223 AS;  --SELECT * FROM tem.darias_206080028223
select * from fin.credito_bancario_detalle where documento='206080028223';