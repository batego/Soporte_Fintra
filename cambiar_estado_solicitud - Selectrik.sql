--Consultamos el estado
select * from opav.sl_estados_etapas_ofertas where ID_ETAPA_OFERTA = 1 

--Consultamos la solicitud
SELECT trazabilidad, estado,* FROM opav.ofertas where id_solicitud = '926668'

--Actualizamos el estado y la trazabilidad
update opav.ofertas set trazabilidad = '1', estado = '140' where id_solicitud = '926668'