select reportado,* from cr_obligaciones_areportar_criesgo where creation_date::date ='2019-01-16';
--UPDATE cr_obligaciones_areportar_criesgo SET reportado = 'N' where creation_date::date ='2019-01-16';

CREATE TABLE TEM.DATACREDI_18012019 AS;
select * from cr_historico_reportes where creation_date::date ='2019-01-18';

--DELETE from cr_historico_reportes where creation_date::date ='2019-01-16';

SELECT * FROM TEM.DATACREDI_18012019;


--delete FROM cr_historico_reportes WHERE periodo_lote= '201812'  AND id_unidad_negocio= 16;

SELECT * 
from cr_historico_reportes
WHERE  periodo_lote = '201812' and reg_status !='A' AND id_unidad_negocio= 16;--and cr.reportado=''

SELECT * FROM negocios WHERE cod_neg = 'MC06902'