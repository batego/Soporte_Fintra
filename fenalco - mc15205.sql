MC15205

CREATE TABLE TEM.ING_FENALCO_MC15205 AS ;
select * from ing_fenalco
--delete from ing_fenalco
where codneg in ('MC15205');

CREATE TABLE tem.fenalco_MC15205_comp AS;
SELECT * FROM con.comprobante 
-- DELETE from con.comprobante
WHERE numdoc IN ('CA500526600','MI500526600',
'CM500790600',
'MI500526601',
'CM500790601',
'CA500526601');

CREATE TABLE tem.fenalco_MC15205_compdt AS;
SELECT * FROM con.comprodet 
-- delete from con.comprodet
WHERE numdoc IN ('CA500526600','MI500526600',
'CM500790600',
'MI500526601',
'CM500790601',
'CA500526601');