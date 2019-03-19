--ANULAR EGRESO - ELIMINAR DOCUMENTOS GENERADOS POR EL NEGOCIO - AUTORIZACION DE DESISTIMIENTO
--SOLICITO ANULAR EL SIGUIENTE EGRESO Y ELIMINAR TODOS LOS DOCUMENTOS GENERADOS CON EL DESEMBOLSO - REESTABLECER SALDO DE LA CXP :
--EGRESO 
--EG67603 $807.282 27/02/19
--
--CXP
--MP15765
--
--NEGOCIO 
--MC18499	72226622	BELLIO TORREGLOSA OSCAR
--
--AL REALIZAR LA ANULACION POR FAVOR INFORMAR INMEDIATAMENTE AL SR HENRY FERRER PARA QUE PROCEDA CON EL DESISITMIENTO DEL NEGOCIO.
;
CREATE TABLE tem.egreso_EG67603 AS;
select * from egreso where document_no = 'EG67603';--Egreso : 807282.00

CREATE TABLE tem.egresodet_EG67603 AS;
select * from egresodet where document_no = 'EG67603';--Egreso

CREATE TABLE tem.COMPROBANTE_EG67603 AS;
SELECT * FROM CON.comprobante WHERE numdoc = 'EG67603';

CREATE TABLE tem.COMPRODET_EG67603 AS;
SELECT * FROM CON.comprodet WHERE numdoc = 'EG67603';

select * from fin.cxp_doc where documento_relacionado = 'MC18499';
select * from fin.cxp_doc where documento_relacionado = 'MP15764';

select * from negocios where cod_neg='MC18499';

CREATE TABLE tem.cartera_MC18499 AS;
SELECT * FROM con.factura WHERE negasoc = 'MC18499';

CREATE TABLE tem.carteradet_MC18499 AS;
SELECT * FROM con.factura_detalle WHERE documento IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18499');

CREATE TABLE tem.COMPROBANTE_MC18499 AS;
SELECT * FROM con.comprobante WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18499');

CREATE TABLE tem.COMPRODET_MC18499 AS;				--select * from tem.COMPRODET_MC18499;
SELECT * FROM con.comproDET WHERE numdoc IN (SELECT documento FROM con.factura WHERE negasoc = 'MC18499');

CREATE TABLE tem.diferidos_MC18499 AS;
SELECT * FROM ing_fenalco WHERE codneg = 'MC18499';

-- No se generaron
CREATE TABLE tem.diferidos_MC18499 AS;
SELECT * FROM CON.comprobante WHERE numdoc IN (SELECT COD FROM tem.diferidos_MC18499);