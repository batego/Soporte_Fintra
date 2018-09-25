SELECT * FROM (
SELECT case when ends.estado::varchar is null then 
				 'NO ENDOSADO'
			else ends.estado::varchar
			end as estado_endoso, 
	   cod AS codigo, 
	   valor, 
	   codneg AS negocio, 
	   fecha_doc AS fecha_documento,
	   fecha_doc AS Fecha_vencimiento,
       fecha_contabilizacion,
       c.cuenta
FROM ing_fenalco i
left JOIN con.cmc_doc c ON (i.cmc = c.cmc AND c.tipodoc = i.tipodoc)
LEFT  JOIN negocios_endosados ends on (ends.negocio=i.codneg)
WHERE i.tipodoc = 'IF' AND i.fecha_doc::date  >= '2018-07-01'::date
AND i.reg_status = ''
ORDER BY i.fecha_doc DESC) AS a WHERE a.estado_endoso = 'NO ENDOSADO';


