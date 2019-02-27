
SELECT       
    DISTINCT
    case when get_nombc(cod_cli) is null then
    sp.nombre else
    get_nombc(cod_cli) end as nombre_cliente
    ,cod_cli as cedula_cliente  
    ,nro_docs
    ,vr_desembolso
    ,valor_aval as vr_aval
    ,valor_fianza
    ,vr_custodia
    ,vr_negocio
    ,/*(select vlr*-1 
	from fin.cxp_items_doc 
	where descripcion ILIKE 'DESCUENTO ESTUDIO DE CREDITO%' and documento = (select documento 
										from fin.cxp_doc 
										where documento_relacionado = n.cod_neg and documento ILIKE 'MP%')) as*/ 
    40000 as estudio_credito
    ,case when tneg='03' then 'PAGARE'
	when tneg='02' then 'LETRA'
	when tneg='01' then 'CHEQUE'  END AS tipo_negocio
    ,n.fecha_negocio::date
    ,n.cod_neg
    ,get_est(estado_neg) as estado_neg
    ,observaciones
    ,get_nombp(n.nit_tercero) as afiliado
    ,n.nit_tercero
    ,replace(f_desem::date,'0099-01-01','0101-01-01')::date as fecha_desembolso
    ,cletras
    ,tot_pagado
    ,num_aval
    ,cpagare
    ,create_user  
    ,conv.id_convenio 
    ,s.nombre as sector
    ,sb.nombre as subsector
    ,coalesce (sa.numero_solicitud,0) as numero_solicitud
    ,replace(fecha_ap::date,'0099-01-01','0101-01-01')::date as fecha_aprobacion
    ,replace(fecha_liquidacion::date,'0099-01-01','0101-01-01')::date as fecha_liquidacion
    ,coalesce ((select ciclo from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as ciclo
    ,coalesce ((select  no_solicitud from anexos_negocios nx where nx.codneg=n.cod_neg)::text,'') as no_solicitud
    ,ana.analista
    ,replace(fecha_actividad::date,'0099-01-01','0101-01-01')::date as fecha_actividad
    ,(SELECT un.descripcion FROM rel_unidadnegocio_convenios run 
	INNER JOIN unidad_negocio un on (run.id_unid_negocio=un.id )	
		WHERE run.id_convenio=n.id_convenio and un.ref_4 !='') as unidad_negocio
    ,conv.agencia
    ,n.periodo as periodo_contabilizacion
    ,replace(substring(n.fecha_negocio,1,7),'-','') as periodo_negocio
    ,replace(replace(substring(n.f_desem,1,7),'-',''),'009901','') as periodo_desembolso 
    ,substring(n.fecha_negocio,1,4) as anio
    ,substring(n.f_desem,1,4) as anio_desem	
    ,(SELECT CASE WHEN count(0) > 0 THEN 'S' ELSE 'N' END  FROM rel_negocios_reestructuracion where negocio_reestructuracion =n.cod_neg) AS reestructuracion
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
    ,(n.f_desem::date-n.fecha_negocio::date) as diff_fecha
    ,valor_total_poliza
    ,coalesce(oc.valor_comprar,0) as valor_comprar
    ,case when oc.valor_comprar is not null then 
	(SELECT valor_cobrar*num_cheque FROM deducciones_microcredito where descripcion='DESCUENTO POR CHEQUE' and reg_status='')
    else 0.00 end as valor_descuento_cheque
    ,case when valor_total_poliza >0 then 'PL'
         when valor_fianza >0 then 'FZ'
         else 'N/A' end as tipo_garantia,
    n.tasa,
coalesce(nc.valor_notas,0) as valor_notas,
 spc.identificacion AS cedula_codeudor, spc.nombre AS nombre_codeudor, spc.direccion AS direccion_cod, spc.barrio AS barrio_cod, 
 spc.telefono AS telefono_cod, spc.celular AS celular_cod,
 sr.nombre AS nombre_ref_fam, sr.direccion AS  direccion_ref_fam, sr.ciudad AS ciudad_ref_fam, sr.telefono1 AS telefono_ref_fam, sr.celular AS celular_ref_fam,
 srp.nombre AS nombre_ref_per, srp.direccion AS  direccion_ref_per, srp.ciudad AS ciudad_ref_per, srp.telefono1 AS telefono_ref_per, srp.celular AS celular_ref_per
    From
    Negocios n
    INNER JOIN convenios conv on(conv.id_convenio=n.id_convenio)
    INNER JOIN solicitud_aval sa on (n.cod_neg=sa.cod_neg)
    INNER JOIN solicitud_persona sp on (sa.numero_solicitud=sp.numero_solicitud and sp.tipo='S')
    left JOIN solicitud_persona spC on (sa.numero_solicitud=spc.numero_solicitud and spc.tipo='C')
    LEFT JOIN solicitud_referencias sr ON (sr.numero_solicitud = sa.numero_solicitud AND sr.tipo_referencia = 'F' AND sr.secuencia = '1' AND sr.tipo = 'S')
    LEFT JOIN solicitud_referencias srp ON (srp.numero_solicitud = sa.numero_solicitud AND srp.tipo_referencia = 'P' AND srp.secuencia = '1' AND srp.tipo = 'S')
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
    LEFT JOIN (SELECT numero_solicitud, sum(valor_comprar) as valor_comprar , count(0) as num_cheque FROM solicitud_obligaciones_comprar where valor_comprar>0  group by numero_solicitud) oc on (oc.numero_solicitud=sa.numero_solicitud)
    LEFT JOIN (select n.cod_neg, sum(cxpn.vlr_neto) as valor_notas
		from negocios n
		inner join fin.cxp_doc cxp on cxp.documento_relacionado=n.cod_neg 
		inner join con.traslado_facturas_apoteosys tfa on tfa.documento=cxp.documento
		left join fin.cxp_doc cxpn on cxpn.documento_relacionado=cxp.documento
		where cxp.documento like 'MP%' AND cxp.referencia_3 = 'TRANSFERENCIA'
		AND cxpn.descripcion not in ('NC - DEUDORES','NC - VIDA DEUDORES','NC - DESCUENTO POR CHEQUE') group by n.cod_neg)nc on (nc.cod_neg=n.cod_neg)
    WHERE (n.estado_neg IN ('T','A','D')  AND n.cod_neg like 'MC%' ) 
    AND n.fecha_negocio  between '2017-01-01' AND substring(now(),1,4)||'-12-31' --AND n.cod_neg = 'MC09454'
    ORDER BY 
    fecha_actividad asc,
    n.fecha_negocio::date desc,
    fecha_desembolso DESC;

   
   