SELECT 
	 round(ng.vr_negocio) as vr_negocio,min(fecha_vencimiento), cod_cli,
	 ng.nro_docs,
	 fac.negasoc,
	 round(SUM(fac.valor_factura-(SELECT seguro FROM documentos_neg_aceptado  where cod_neg=fac.negasoc limit 1))) as capital,
	 (SELECT case when  ( now() :: date  > min(fecha_vencimiento) :: date  ) then 'N' else 'S' end as aldia                 
    FROM con.factura as f where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.fecha_ultimo_pago ='0099-01-01' AND f.reg_status !='A' ) as aldia,
	 (Select case when MAX(f.fecha_vencimiento) is null then now()::date else MAX(f.fecha_vencimiento) end FROM con.factura as f 
	 where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.valor_saldo > 0) as fecha_pc,
	 count(0) as docPagos
    FROM con.factura as fac 
    INNER JOIN negocios as ng on (ng.cod_neg=negasoc)
    WHERE
	 negasoc = (SELECT sa.cod_neg FROM solicitud_persona AS sp  
		 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
		 WHERE sp.identificacion='1067885412' and sa.id_convenio in ('10','11','12','13','43','46','47','48','49','52','54','55') and sa.estado_sol in ('T')and sp.tipo='S'
		and sp.creation_date = (SELECT max(spa.creation_date) FROM solicitud_persona spa inner join solicitud_aval saa on (spa.numero_solicitud = saa.numero_solicitud ) where spa.identificacion='1067885412' AND spa.reg_status!='A' and spa.tipo='S' and saa.estado_sol in ('T'))
		group by sa.cod_neg) AND  ng.cod_cli = '1067885412'
	AND fac.documento like 'MC%'  AND  fac.valor_saldo = 0  AND fac.fecha_ultimo_pago !='0099-01-01' AND fac.reg_status !='A'
	AND (select count(0) from negocios n 
		inner join solicitud_aval sa on sa.cod_neg=n.cod_neg
		inner join solicitud_persona sp2 on sp2.numero_solicitud=sa.numero_solicitud
		where sp2.tipo='C' and sp2.identificacion =ng.cod_cli  and n.estado_neg = 'T' AND sp2.reg_status!='A' 
		and (select sum(valor_saldo) from con.factura where negasoc = sa.cod_neg and fecha_vencimiento <= now()) != 0) <= 1 
	AND (select count(0) from con.factura where negasoc in 
		(select cod_neg from solicitud_aval where numero_solicitud in (select numero_solicitud from solicitud_persona where identificacion=ng.cod_cli and tipo='C' and reg_status!='A'))
		and valor_saldo !=0 and fecha_vencimiento < now()) = 0 
    GROUP BY 
	 ng.vr_negocio,
	 ng.nro_docs,
	 fac.negasoc,
	 ng.cod_cli