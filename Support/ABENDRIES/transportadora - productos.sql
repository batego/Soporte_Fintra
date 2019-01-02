-- Config Transportadora
-- Agregar usuario a opciones_menu_modulos where modulo='transportadora' 
--Ejemplo:
select * 
from opciones_menu_modulos where modulo='transportadora' 
AND reg_status='' 
AND usuario ilike '%mmuskus%' AND dstrct = 'FINV' order by orden;


--Agregar usuario a ETES.usuarios_agencias
-- ejemplo
select * from ETES.usuarios_agencias;
select * from etes.transportadoras;
SELECT * FROM ETES.agencias ;
SELECT * FROM USUARIOS WHERE idusuario='EDSNIEVES';
SELECT * FROM perfilusuarios WHERE usuarios = 'EDSMALAMBO';

--Estaciones de servicio
select * from etes.estacion_servicio;

--hacer la relacion del sgte query
SELECT ag.id, cod_agencia, nombre_agencia, ag.id_transportadora, trans.cod_transportadora,trans.idusuario as user_trans 
from etes.usuarios_agencias us
INNER JOIN etes.agencias ag ON ag.id = us.id_agencia
INNER JOIN etes.transportadoras trans ON trans.id = ag.id_transportadora
WHERE id_usuario = 'APACHON';




 --Asociar productos a la Eds          
 select * from  etes.configcomerial_productos where id_eds = '18';
 select * from etes.productos_es;
