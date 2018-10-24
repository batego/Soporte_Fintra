SELECT ag.id, cod_agencia, nombre_agencia, ag.id_transportadora, trans.cod_transportadora,trans.idusuario as user_trans 
from etes.usuarios_agencias us
INNER JOIN etes.agencias ag ON ag.id = us.id_agencia
INNER JOIN etes.transportadoras trans ON trans.id = ag.id_transportadora
WHERE id_usuario = 'LASNIEVES';


SELECT * FROM etes.usuarios_agencias ;
SELECT * FROM etes.agencias ;
select * from etes.transportadoras;
SELECT etes.cxp_estaciones(?, ?, ?)as retorno


SELECT etes.cxp_estaciones(18, '2018-10-17', 'LASNIEVES')as retorno;

select aprobador,* from fin.cxp_doc limit 10;


