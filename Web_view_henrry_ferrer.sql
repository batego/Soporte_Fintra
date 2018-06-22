

select n.fecha_negocio,
       n.cod_neg, 
       n.vr_negocio,
       sa.pre_aprobado_micro, 
       sa.renovacion, 
       n.nit_tercero, 
       c.nomcli, 
       c.direccion, 
       ciu.nomciu, 
       sp.barrio, 
       sp.celular, 
       sn.nombre,
       sn.direccion,
       sn.barrio
from 		negocios n
left join 	cliente c 		on (n.nit_tercero = c.nit)
left join 	ciudad ciu 		on (c.dir_factura = ciu.codciu)
inner join 	solicitud_aval sa 	on (n.cod_neg = sa.cod_neg)
inner join 	solicitud_persona sp 	on (sa.numero_solicitud = sp.numero_solicitud) 
inner join 	solicitud_negocio sn 	on (sa.numero_solicitud = sn.numero_solicitud)
where 		n.cod_neg like 'MC%'
  and		n.fecha_negocio between  '2018-06-15'::date and '2018-06-15'::date
  and 		sp.tipo  = 'S'
order by 	n.cod_neg asc;


select * from negocios where cod_neg = 'MC14606'
union all
select * from negocios where cod_neg = 'MC14604'

select * from solicitud_aval limit 10


select  * from solicitud_aval where cod_neg = 'MC14539' limit 5
select * from solicitud_persona where numero_solicitud = '122731'
select * from solicitud_negocio limit 5
select * from negocios where cod_neg like 'MC14509%' limit 100
select * from cliente where nit = '10769649'
select * from ciudad where codciu = 'MT'
select * from barrio where codciu = 'MT'
select * from asesores limit 10



insert into consultas values (849,'BTERRAZA','HFERRER,BTERRAZA','REPORTE NEGOCIOS MICRO','select n.fecha_negocio,
       n.cod_neg, 
       n.vr_negocio,
       sa.pre_aprobado_micro, 
       sa.renovacion, 
       n.nit_tercero, 
       coalesce(c.nomcli, sp.nombre)  as nomcli,
       coalesce(c.direccion, sp.direccion) as direccion, 
       coalesce(ciu.nomciu, ciu2.nomciu) as nomciu, 
       sp.barrio, 
       sp.celular, 
       sn.nombre,
       sn.direccion,
       sn.barrio
from 		negocios n
left join 	cliente c 		on (n.nit_tercero = c.nit)
left join 	ciudad ciu 		on (c.dir_factura = ciu.codciu)
inner join 	solicitud_aval sa 	on (n.cod_neg = sa.cod_neg)
inner join 	solicitud_persona sp 	on (sa.numero_solicitud = sp.numero_solicitud) 
left join 	ciudad ciu2 		on (sp.ciudad = ciu2.codciu)
inner join 	solicitud_negocio sn 	on (sa.numero_solicitud = sn.numero_solicitud)
where 		n.cod_neg like ''MC%''
  and		n.fecha_negocio between  ?::date and ?::date
  and 		sp.tipo  = ''S''
order by 	n.cod_neg asc;','fecha inicial, fecha final',NOW(),'PSQL_SOT','A','');




-- delete from consultas where id = 849	

SELECT DISTINCT
            n.cod_neg AS CODIGO_NEG,
            get_nombp(n.nit_tercero) as AFILIADO,
            case when get_nombc(cod_cli) is null then
            sp.nombre else
            get_nombc(cod_cli) end AS CLIENTE,
            cod_cli AS CEDULA_CLIENTE,  
            coalesce(vista.nombre,'') as CODEUDOR ,
            coalesce(vista.identificacion,'') as ID_CODEUDOR,
            coalesce(vista.codigo,'') as CODIGO_ESTUDIANTE,
            coalesce(vista.programa,'') as programa, 
            CASE WHEN n.cmc = '01' THEN vr_negocio ELSE vr_desembolso END AS VR_NEGOCIO,
            vr_desembolso AS DESEMBOLSO,
            tot_pagado AS VR_DOCUMENTOS,
            get_est(estado_neg) as ESTADO,
            fecha_negocio as FECHA_NEG,
            fecha_ap AS FECHA_APROBACION,
            f_desem AS FECHA_DESEMBOLSO,
            coalesce (conv.nombre,'') as CONVENIO,
            s.nombre as SECTOR,
            sb.nombre as SUBSECTOR,    
            CASE WHEN n.cmc = '01' THEN 'Normal' ELSE 'Cartera' END AS TIPO,     
            num_aval AS AVAL,
            CASE WHEN tneg = '01' THEN 'Cheque' ELSE 'Letra' END AS TIPODOC,
            nro_docs AS CANTIDAD,
            coalesce ((select  no_solicitud from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as SOLICITUD,
            coalesce ((select ciclo from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as CICLO,
            create_user AS USUARIO_CREADOR,
            observaciones AS OBSERVACIONES,
            COALESCE(
            (SELECT 'REESTRUCTURADO'::TEXT FROM rel_negocios_reestructuracion WHERE negocio_base = n.cod_neg)
            ,(SELECT 'REESTRUCTURACION'::TEXT FROM rel_negocios_reestructuracion WHERE negocio_reestructuracion = n.cod_neg)
            ,'')::TEXT AS REESTRUCTURACION,   
            asesor,
            sa.renovacion AS RETANQUEO,
            sa.cod_negocio_renovado,
            sa.pre_aprobado_micro
            From
            Negocios n
            inner join convenios conv on(conv.id_convenio=n.id_convenio)
            inner join solicitud_aval sa on (n.cod_neg=sa.cod_neg)
            inner join solicitud_persona sp on (sa.numero_solicitud=sp.numero_solicitud and sp.tipo='S')
            left join vista_prueba_fenalco vista on (vista.cod_neg=n.cod_neg)
            left join sector    s on (s. cod_sector=n. cod_sector)
            left join subsector    sb on (sb.cod_subsector=n.cod_subsector and sb.cod_sector=n.cod_sector )
            left join negocios_analista ana on (ana.cod_neg=n.cod_neg)
            where conv.id_convenio in (select id_convenio from rel_unidadnegocio_convenios where id_unid_negocio=1 and id_convenio not in (40,41))
              --and n.fecha_negocio between ? and ?
            order by n.cod_neg asc;