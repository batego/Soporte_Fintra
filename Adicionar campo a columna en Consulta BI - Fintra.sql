select   
    DISTINCT
    case when get_nombc(cod_cli) is null then
    sp.nombre else
    get_nombc(cod_cli) end as nombre_cliente
    ,cod_cli as cedula_cliente 
    ,nro_docs as Plazo_credito 
    ,vr_desembolso
    ,valor_aval as vr_aval
    ,vr_custodia
    ,vr_negocio
    ,case when tneg='03' then 'PAGARE'
     when tneg='02' then 'LETRA'
     when tneg='01' then 'CHEQUE'  END AS tipo_negocio
    ,fecha_negocio::date
    ,n.cod_neg
    ,get_est(estado_neg) as estado_neg
    ,observaciones
    ,get_nombp(n.nit_tercero) as afiliado
    ,n.nit_tercero
    ,f_desem::date as fecha_desembolso
    ,cletras
    ,tot_pagado
    ,num_aval
    ,cpagare
    ,create_user 
    ,conv.id_convenio
    ,s.nombre as sector
    ,sb.nombre as subsector
    ,coalesce (sa.numero_solicitud,0) as numero_solicitud
    ,fecha_ap::date as fecha_aprobacion
    ,fecha_liquidacion::date
    ,coalesce ((select ciclo from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as ciclo
    ,coalesce ((select  no_solicitud from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as no_solicitud
    ,ana.analista
    ,fecha_actividad::date
    ,(SELECT un.descripcion FROM rel_unidadnegocio_convenios run
    INNER JOIN unidad_negocio un on (run.id_unid_negocio=un.id )   
        WHERE run.id_convenio=n.id_convenio and un.ref_4 !='') AS unidad_negocio
    ,conv.agencia
    ,periodo as periodo_contabilizacion
    ,replace(substring(n.fecha_negocio,1,7),'-','') as periodo_negocio
    ,replace(replace(substring(n.f_desem,1,7),'-',''),'009901','') as periodo_desembolso
    ,substring(n.fecha_negocio,1,4) as anio   
    ,(SELECT CASE WHEN count(0) > 0 THEN 'S' ELSE 'N' END  FROM rel_negocios_reestructuracion WHERE negocio_reestructuracion =n.cod_neg) AS reestructuracion
    ,sa.asesor   
    ,liquidador.total_pagado_liq
    ,liquidador.capital
    ,liquidador.interes_corriente
    ,liquidador.cuota_admin
    ,liquidador.valor_cat
    ,liquidador.valor_seguro
    ,liquidador.remesa
    ,coalesce(tiene_liq,'N') AS tiene_liq
    ,eg_aval_negocio(n.cod_neg) AS tipo_capital
    ,(SELECT CASE  WHEN count(0)>1 THEN 'S' ELSE 'N' END FROM  negocios WHERE id_convenio in (SELECT id_convenio FROM convenios  where tipo='Microcredito')  AND  estado_neg ='T' AND cod_cli =n.cod_cli) as renovacion
    ,(select count(0) from administrativo.preaprobados_fintra_credit pre where pre.periodo=replace(replace(substring(n.f_desem,1,7),'-',''),'009901','') and pre.cedula_deudor=n.cod_cli) as pre_aprobado
    ,(select clasificacion from administrativo.clasificacion_clientes_fintracredit  where cedula_deudor =n.cod_cli order by periodo desc limit 1) as clasificacion
    ,nomciu as ciudad_titular
    ,department_name as dpto_titular
    ,upper(sp.barrio) as barrio_titular
    ,sp.estrato as estrato_titular
    ,upper(sp.direccion) as direccion_titular
    ,upper(sp.email) as email_titular
    ,sp.telefono as telefono_titular
    ,sp.celular as celular_titular
    ,(select descripcion from estado_civil where cod= sp.estado_civil) as estado_civil_titular
    ,(now()::date-sp.fecha_nacimiento::date)/365 as edad_titular
    ,sp.tipo_persona as tipo_persona_titular
    ,sp.num_de_hijos as hijos_titular
    ,upper(sp.profesion) as profesion_titular
    ,upper(sl.ocupacion) as ocupacion_titular
    ,upper(sl.cargo) as cargo_titular
    ,spe.tipo
    ,upper(spe.nombre) as nombre_codeudor
    ,spe.estrato as estrato_codeudor
    ,upper(spe.barrio) as barrio_codeudor
    ,upper(spe.direccion) as direccion_codeudor
    ,upper(spe.email) as email_codeudor
    ,spe.telefono as telefono_codeudor
    ,spe.celular as celular_codeudor
    ,nomciu as ciudad_codeudor
    ,department_name as dpto_codeudor
    ,(select descripcion from estado_civil where cod= sp.estado_civil) as estado_civil_codeudor
    ,(now()::date-spe.fecha_nacimiento::date)/365 as edad_codeudor
    ,spe.tipo_persona as tipo_persona_codeudor
    ,spe.num_de_hijos as hijos_codeudor
    ,upper(spe.profesion) as profesion_codeudor
    ,upper(sle.ocupacion) as ocupacion_codeudor
    ,upper(sle.cargo) as cargo_codeudor
    ,sbi.tipo_de_bien
    ,hipoteca
    ,a_favor_de
    ,valor_comercial
    ,sbi.direccion,
    (case when sp.reg_status = '' then 'Activo' else 'Inactivo' end)  as Estado
    From
    Negocios n
    INNER JOIN convenios conv on(conv.id_convenio=n.id_convenio)
    INNER JOIN solicitud_aval sa on (n.cod_neg=sa.cod_neg)
    --INNER JOIN negocios neg on (sa.cod_neg = neg.cod_neg)
    INNER JOIN solicitud_persona sp on (sa.numero_solicitud=sp.numero_solicitud and sp.tipo='S')
    INNER JOIN solicitud_laboral sl ON (sl.numero_solicitud=sp.numero_solicitud and sl.tipo = 'S')
    LEFT JOIN solicitud_persona spe ON spe.numero_solicitud=sa.numero_solicitud and spe.tipo in ('C','E')
    LEFT JOIN solicitud_laboral sle ON sle.numero_solicitud=spe.numero_solicitud and sle.tipo in ('C','E')
    INNER JOIN (SELECT  cod_neg,sum(capital) as capital
                ,sum(interes) as interes_corriente
                ,sum(cuota_manejo) as cuota_admin
                ,sum(cat) as valor_cat
                ,sum(seguro) as valor_seguro
                                ,sum(valor) as total_pagado_liq
                ,sum(remesa) as remesa
                ,'S'::varchar as tiene_liq
        FROM documentos_neg_aceptado WHERE reg_status='' group by cod_neg) liquidador on (liquidador.cod_neg=n.cod_neg)
    LEFT JOIN sector    s on (s. cod_sector=n. cod_sector)
    LEFT JOIN subsector    sb on (sb.cod_subsector=n.cod_subsector and sb.cod_sector=n.cod_sector)
    LEFT JOIN negocios_analista ana on (ana.cod_neg=n.cod_neg)
    INNER JOIN ciudad c on c.codciu=sp.ciudad
    INNER JOIN estado e on e.department_code=sp.departamento
    LEFT JOIN solicitud_bienes sbi on sbi.numero_solicitud=sa.numero_solicitud
    WHERE (n.estado_neg IN ('T','A') or (n.estado_neg in ('L','T') AND n.cod_neg like 'LB%' )) 
    AND n.fecha_negocio  between (substring(now(),1,4)::integer-3)::varchar||'-01-01' AND substring(now(),1,4)||'-12-31'
    ORDER BY
    fecha_actividad::date asc,
    fecha_negocio::date desc,
    f_desem::date desc
limit 200

--estado
--plazo credito
--Data 2015

--     select * from solicitud_persona limit 100
--     select * from solicitud_aval where cod_neg = 'FA10710' limit 100
--     select * from negocios  limit 100
