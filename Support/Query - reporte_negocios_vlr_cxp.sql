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
inner join fin.cxp_doc cxp on (cxp.documento_relacionado=n.cod_neg)
inner join proveedor pr on pr.nit = n.nit_tercero
inner join convenios c on c.id_convenio=n.id_convenio
where substring(n.fecha_ap,1,10)::date >=? and substring(n.fecha_ap,1,10)::date <=?
order by fecha_ap



--QUery Viejo
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
cc.entidad
from solicitud_aval sa 
inner join negocios n on n.cod_neg = sa.cod_neg
inner join fin.cxp_doc cxp on (cxp.documento_relacionado=n.cod_neg)
inner join proveedor pr on pr.nit = n.nit_tercero
inner join convenios c on c.id_convenio=n.id_convenio
LEFT  JOIN solicitud_obligaciones_comprar cc ON (sa.numero_solicitud = cc.numero_solicitud) 
where substring(n.fecha_ap,1,10)::date >=? and substring(n.fecha_ap,1,10)::date <=?
order by fecha_ap