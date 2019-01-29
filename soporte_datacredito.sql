
DELETE from cr_historico_reportes where (negocio, creation_date) NOT IN  (
SELECT negocio, min(creation_date)  FROM cr_historico_reportes WHERE periodo_lote = '201811' AND tipo = 'S' GROUP BY negocio
HAVING count(negocio) > 1 ) AND periodo_lote = '201811'  AND tipo = 'S'
AND negocio IN (SELECT negocio FROM cr_historico_reportes WHERE periodo_lote = '201811' AND tipo = 'S' GROUP BY negocio HAVING count(negocio) > 1 );


SELECT * FROM tem.soporte_datacred;


