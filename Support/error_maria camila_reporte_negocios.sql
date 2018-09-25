SELECT CASE WHEN count(*) = 3 THEN
		numero_solicitud
	ELSE
	count(*)
	END 
,numero_solicitud,creation_date  FROM  solicitud_persona GROUP BY numero_solicitud, creation_date ORDER BY creation_date DESC;

SELECT * FROM solicitud_persona WHERE numero_solicitud = '126106';129530;122259;121714;121666;120928
114817;114784;113029;112501;

SELECT * FROM solicitud_persona WHERE numero_solicitud IN(132621,129530, 126106) ORDER BY numero_solicitud;