SELECT * FROM CON.factura WHERE documento = 'NM14387_1';

CREATE TABLE TEM.NM14387_1 AS 
SELECT * FROM CON.factura_detalle WHERE documento = 'NM14387_1';

--backup detalle factura 
SELECT * FROM TEM.NM14387_1;


--backup contable cab
CREATE TABLE TEM.NM14387_1_cont AS 
delete FROM con.comprobante WHERE numdoc = 'NM14387_1';

--backup contable detalle 
CREATE TABLE TEM.NM14387_1_compdt AS 
delete FROM con.comprodet WHERE numdoc = 'NM14387_1';