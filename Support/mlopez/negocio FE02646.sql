CREATE TABLE tem.FE02646 AS 
SELECT * FROM fin.cxp_doc WHERE documento_relacionado = 'FE02646';
SELECT * FROM ing_fenalco WHERE codneg = 'FE02646';

CREATE TABLE tem.FE02646_itm AS; 
SELECT * FROM fin.cxp_items_doc WHERE documento IN (SELECT documento FROM fin.cxp_doc WHERE documento_relacionado = 'FE02646');

CREATE TABLE tem.FE02646_fianza AS 
SELECT * FROM administrativo.historico_deducciones_fianza WHERE negocio = 'FE02646';
PM34576
PM34577

SELECT * FROM FIN.CXP_ITEMS_DOC WHERE documento IN ('PM34414');