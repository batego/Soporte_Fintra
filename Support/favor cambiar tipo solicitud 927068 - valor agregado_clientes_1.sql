SELECT tipo_solicitud,* FROM opav.ofertas WHERE id_Solicitud IN ('927068');
--Estado antes de cambiarlo: Standard
--Estado despues de cambiarlo: VALOR agregado_clientes_1

SELECT * FROM opav.acciones WHERE id_solicitud = '927068';

SELECT tipo_solicitud, * FROM opav.ofertas WHERE tipo_solicitud ILIKE '%agregado_clientes_1%' LIMIT 100;   --!= 'Standard' LIMIT 100;
	