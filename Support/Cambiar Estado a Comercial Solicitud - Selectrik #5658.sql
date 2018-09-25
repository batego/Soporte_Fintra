--Consultamos el estado
select * from opav.sl_estados_etapas_ofertas 

--Consultamos la solicitud
SELECT trazabilidad, estado,* FROM opav.ofertas where id_solicitud IN  ('926370','927141');

--Actualizamos el estado y la trazabilidad
update opav.ofertas set trazabilidad = '5', estado = '510' where id_solicitud IN  ('927095');


SELECT trazabilidad, estado,* FROM opav.ofertas where id_solicitud IN  ('927095');