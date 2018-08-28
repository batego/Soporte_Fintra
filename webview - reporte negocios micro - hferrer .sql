-- select * from consultas where descripcion ilike '%Reporte negocios micro%' and creador = 'BTERRAZA'
UPDATE consultas SET QUERY = 'select n.fecha_negocio,
       n.cod_neg, 
       n.vr_negocio,
       sa.pre_aprobado_micro, 
       sa.renovacion, 
       n.nit_tercero, 
       coalesce(c.nomcli, sp.nombre)  as nomcli,
       coalesce(c.direccion, sp.direccion) as direccion, 
       ciu2.nomciu as nomciu, 
       sp.barrio, 
       sp.celular, 
       sn.nombre,
       sn.direccion,
       sn.barrio
from 		negocios n
left join 	cliente c 		on (n.nit_tercero = c.nit)
--left join 	ciudad ciu 		on (c.dir_factura = ciu.codciu)
inner join 	solicitud_aval sa 	on (n.cod_neg = sa.cod_neg)
inner join 	solicitud_persona sp 	on (sa.numero_solicitud = sp.numero_solicitud) 
left join 	ciudad ciu2 		on (sp.ciudad = ciu2.codciu)
inner join 	solicitud_negocio sn 	on (sa.numero_solicitud = sn.numero_solicitud)
where 		n.cod_neg like ''MC%''
  and		n.fecha_negocio between  ?::date and ?::date
  and 		sp.tipo  = ''S''
order by 	n.cod_neg asc;' where descripcion ilike '%Reporte negocios micro%' and creador = 'BTERRAZA'


select n.fecha_negocio,
       n.cod_neg, 
       n.vr_negocio,
       sa.pre_aprobado_micro, 
       sa.renovacion, 
       n.nit_tercero, 
       coalesce(c.nomcli, sp.nombre)  as nomcli,
       coalesce(c.direccion, sp.direccion) as direccion, 
       ciu2.nomciu as nomciu, 
       sp.barrio, 
       sp.celular, 
       sn.nombre,
       sn.direccion,
       sn.barrio
from 		negocios n
left join 	cliente c 		on (n.nit_tercero = c.nit)
--left join 	ciudad ciu 		on (c.dir_factura = ciu.codciu)
inner join 	solicitud_aval sa 	on (n.cod_neg = sa.cod_neg)
inner join 	solicitud_persona sp 	on (sa.numero_solicitud = sp.numero_solicitud) 
left join 	ciudad ciu2 		on (sp.ciudad = ciu2.codciu)
inner join 	solicitud_negocio sn 	on (sa.numero_solicitud = sn.numero_solicitud)
where 		n.cod_neg like 'MC%'
  --and		n.fecha_negocio between  '2018-07-01'::date and '2018-07-05'::date
  and 		sp.tipo  = 'S'
  and 		n.cod_neg = 'MC15555'
order by 	n.cod_neg asc;



