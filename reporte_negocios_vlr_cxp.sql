SELECT * FROM consultas WHERE descripcion ILIKE '%reporte_negocios_vlr_cxp%';

--Query viejo
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
c.agencia
from solicitud_aval sa 
inner join negocios n on n.cod_neg = sa.cod_neg
inner join fin.cxp_doc cxp on (cxp.documento_relacionado=n.cod_neg )
inner join proveedor pr on pr.nit = n.nit_tercero
inner join convenios c on c.id_convenio=n.id_convenio
where substring(n.fecha_ap,1,10)::date >='2018-09-26' and substring(n.fecha_ap,1,10)::date <='2018-09-26'
AND sa.cod_neg = 'LB01284'
order by fecha_ap;



--QUery nuevo
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
where substring(n.fecha_ap,1,10)::date >='2018-09-01' and substring(n.fecha_ap,1,10)::date <='2018-09-27'
AND (cxp.documento ILIKE '%LP%' OR cxp.documento ILIKE '%MP%' OR cxp.documento ILIKE '%PM%' )
AND p.payment_name != 'FGA FONDO DE GARANTIAS S.A.'
GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
order by fecha_ap;



SELECT * FROM proveedor LIMIT 100;
SELECT * FROM solicitud_aval
SELECT * FROM solicitud_obligaciones_comprar ;
WHERE numero_solicitud in(SELECT numero_solicitud FROM solicitud_aval WHERE cod_neg = 'LB01284');

