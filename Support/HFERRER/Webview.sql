SELECT * FROM negocios WHERE cod_neg = 'MC16368';
SELECT * FROM consultas WHERE descripcion = 'reporte_negocios_vlr_cxp';
SELECT MAX(FECHA) FROM negocios_trazabilidad WHERE cod_neg = 'MC16368' AND actividad = 'FOR'; 


select 
n.cod_neg,
n.tasa,
n.nit_tercero,
pr.payment_name as afiliado,--get_nombp(n.nit_tercero)
pr.banco_transfer as banco_afiliado,
n.cod_cli,
get_nombc(n.cod_cli) as cliente,
cxp.documento as cxp,
vr_negocio,
cxp.vlr_saldo_me as valor_cxp,
n.fecha_ap as fecha_aprobacion,
asesor,
c.agencia,
cc.nit_entidad AS Nit_entidad,
p.payment_name AS nombre_entidad
from solicitud_aval sa 
inner join negocios n on n.cod_neg = sa.cod_neg
inner join fin.cxp_doc cxp on (cxp.documento_relacionado=n.cod_neg)
inner join proveedor pr on pr.nit = n.nit_tercero
inner join convenios c on c.id_convenio=n.id_convenio
LEFT  JOIN solicitud_obligaciones_comprar cc ON (sa.numero_solicitud = cc.numero_solicitud AND  cxp.proveedor=cc.nit_entidad) 
LEFT JOIN proveedor p ON (cxp.proveedor = p.nit)
INNER JOIN (SELECT MAX(FECHA) AS fecha,cod_neg FROM negocios_trazabilidad WHERE actividad = 'FOR' GROUP BY cod_neg ) nt ON (nt.cod_neg = n.cod_neg)
--INNER JOIN negocios_trazabilidad nt ON (sa.cod_neg = nt.cod_neg AND )
where substring(nt.fecha,1,10)::date >=? and substring(nt.fecha,1,10)::date <=?
--substring(n.fecha_ap,1,10)::date >=? and substring(n.fecha_ap,1,10)::date <=?
AND (cxp.documento ILIKE '%LP%' OR cxp.documento ILIKE '%MP%' OR cxp.documento ILIKE '%PM%' )
AND p.payment_name != 'FGA FONDO DE GARANTIAS S.A.'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
order by fecha_ap;

