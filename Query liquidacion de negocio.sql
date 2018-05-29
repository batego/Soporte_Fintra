SELECT 
                neg.cod_cli,
                neg.cod_neg as negasoc,
                get_nombc(neg.cod_cli) as cliente,
                (select nombre from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as codeudor,
                (select identificacion from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as cc_codeudor,
                (select genero from solicitud_persona where tipo in ('C','E') and numero_solicitud = (select numero_solicitud from solicitud_aval where cod_neg = neg.cod_neg) limit 1) as genero_codeudor,
                neg.fecha_negocio ::date as fecha_negocio,
                CASE WHEN neg.estado_neg = 'T' THEN 'TRANSFERIDO'
                     WHEN neg.estado_neg = 'A' THEN 'APROBADO'
                END AS estado_neg,
                (SELECT nombre FROM convenios WHERE id_convenio=neg.id_convenio)  AS convenio, 
                neg.id_convenio,
                tasa_interes,
                sa.afiliado,
                eg_tipo_negocio(neg.cod_neg) AS tipo_negocio,
                (coalesce (neg2.vr_negocio,0) + coalesce (neg.vr_negocio,0) ) as vr_negocio, 
                (coalesce(neg2.valor_aval,0) + coalesce (neg.valor_aval,0)) as valor_aval,
                (select vr_negocio from negocios where cod_neg = neg.cod_neg) as valor_neg,
                (select coalesce (vr_negocio,0) as valor from negocios where negocio_rel = neg.cod_neg)as valoraval,
                neg.nro_docs,
                sum (fac.saldo_cartera) as saldo_cartera,
                fianza,
                neg.visto_bueno_fianza,
                solp.genero,
                solp.tipo_id
            FROM (
                SELECT 
                    SUM (valor_saldo) AS saldo_cartera,
                    codcli, 
                    nit, 
                    negasoc
		FROM negocios 
		INNER JOIN con.factura fac on (fac.negasoc=negocios.cod_neg)
		WHERE 
                    negocios.estado_neg in ('T', 'A','PR')
                    #FILTROINTERNO --cod_cli = '72277150'
                    AND fac.reg_status=''
                    AND SUBSTRING(fac.documento,1,2) NOT IN ('CP','FF','DF') 
                    AND fac.reg_status !='A' AND fac.dstrct='FINV'
                    --AND valor_saldo > 0
		GROUP BY codcli,nit,negasoc
            ) AS fac  
            INNER JOIN negocios AS neg ON (fac.nit = neg.cod_cli and fac.negasoc = neg.cod_neg and   neg.estado_neg in ('T', 'A','PR'))
	    LEFT JOIN (
			SELECT 
				vr_negocio,
				valor_aval,
				cod_cli,
				cod_neg,
				negocio_rel 
			FROM negocios 
			WHERE
			negocios.estado_neg in ('T', 'A','PR')
			GROUP BY cod_cli,cod_neg,vr_negocio,valor_aval,negocio_rel
	    ) AS neg2 ON (neg2.negocio_rel = neg.cod_neg and neg2.cod_cli = neg.cod_cli)
            INNER JOIN solicitud_aval AS sa ON (neg.cod_neg=sa.cod_neg)
            INNER JOIN solicitud_persona solp on (solp.numero_solicitud = sa.numero_solicitud and solp.tipo = 'S')
            INNER JOIN convenios c on (c.id_convenio = neg.id_convenio)
            WHERE 
                --financia_aval = 't'
                neg.negocio_rel =''
               #PARAMETRO -- neg.cod_cli = '72277150'
            GROUP BY
                neg.cod_cli,
                cliente,
                neg.fecha_negocio,
                convenio, 
                neg.id_convenio,
                sa.afiliado,
                neg2.vr_negocio, 
                neg.nro_docs,
                fianza,
                tasa_interes,
                neg2.valor_aval,
                neg.visto_bueno_fianza,
                fac.saldo_cartera,
                neg.cod_neg,
                neg.estado_neg,
                neg.vr_negocio,
                neg.valor_aval,
                solp.genero,
                solp.tipo_id
               ORDER BY fecha_negocio