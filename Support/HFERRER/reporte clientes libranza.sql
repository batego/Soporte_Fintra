select * from consultas where descripcion ILIKE '%libranza%';

SELECT  neg.cod_neg AS Negocio, 
		neg.creation_date AS Fecha,
		sp.nombre AS Nombre,
		sp.direccion AS Direccion,
		sp.barrio AS Barrio,
		--sp.ciudad AS Ciudad,
		c.nomciu as Ciudad,
		--sp.departamento,
		e.department_name AS Nombre_dpto,
		CASE WHEN sp.tipo = 'C' THEN 
			'Codeudor'
		ELSE 
			'Titular'
		END AS Tipo
FROM negocios neg
INNER JOIN solicitud_aval sa ON (sa.cod_neg = neg.cod_neg)
INNER JOIN solicitud_persona sp ON (sp.numero_solicitud = sa.numero_solicitud)
INNER JOIN ciudad c ON (c.codciu = sp.ciudad)
INNER JOIN estado e ON (e.department_code = c.coddpt)
WHERE neg.cod_neg ilike 'LB%' 
  AND neg.creation_date::date BETWEEN ? AND ? 
  AND neg.estado_neg in('T','V') 
  AND neg.actividad not in('DEC') 
ORDER BY neg.cod_neg, sp.tipo desc;

select * from estado;
SELECT * FROM solicitud_aval where cod_neg = 'LB01339';
select * from solicitud_persona where numero_solicitud = '135790';