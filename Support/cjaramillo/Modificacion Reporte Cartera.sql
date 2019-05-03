SELECT
            (select dato from tablagen where table_type='TIPOGEST' and table_code=fo.tipo_gestion) as gestion,
            replace(get_comment(fra.documento),'{}','') as com,
            (select dato from tablagen where table_type='PRXACCION' and table_code=fo.prox_accion) as proxima_accion,
            fo.fecha_prox_gestion as fecha_proxima_accion,
            (SELECT dato AS codigo FROM tablagen WHERE table_type='ESTCLIENT' and reg_status!='A' and table_code =  (select estado_gestion_cartera from cliente  where codcli = fra.codcli)) as estado_cliente,
            fra.codcli,
            fra.nit as ident,
            COALESCE(cli.nomcli, 'NR') AS nomcli, --COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli,
            negocios.nit_tercero AS nit_afiliado,
            COALESCE(proveedor.payment_name,'NR') AS afiliado, --COALESCE(get_nombp(negocios.nit_tercero),'NR') AS afiliado, 
            COALESCE(substring(negocios.f_desem,1,10),'NR') As desemb,
            sp.direccion,
            sp.barrio,
            COALESCE(cli.telefono ||' - '|| cli.telcontacto,'NR') as tel,
            (select nomciu from ciudad where codciu= sp.ciudad ) as ciudad, 
            (select identificacion from solicitud_persona where tipo='E' and numero_solicitud=sa.numero_solicitud) as cedula_estudiante,
            (select nombre from solicitud_persona where tipo='E' and numero_solicitud=sa.numero_solicitud) as nombre_estudiante,
            (select telefono from solicitud_persona where tipo='E' and numero_solicitud=sa.numero_solicitud) as telefono_estudiante,
            (select direccion from solicitud_persona where tipo='E' and numero_solicitud=sa.numero_solicitud) as direccion_estudiante, 
            (select identificacion from solicitud_persona where tipo='C' and numero_solicitud=sa.numero_solicitud) as cedula_codeudor,
            (select nombre from solicitud_persona where tipo='C' and numero_solicitud=sa.numero_solicitud) as nombre_codeudor,
            (select telefono from solicitud_persona where tipo='C' and numero_solicitud=sa.numero_solicitud) as telefono_codeudor,
            (select direccion from solicitud_persona where tipo='C' and numero_solicitud=sa.numero_solicitud) as direccion_codeudor, 
            COALESCE(cast(negocios.vr_aval AS TEXT),'0.00') as tasa,
            fra.documento,
            negocios.cod_neg,
            sa.asesor,
            (SELECT max(fecha_consignacion)  
               from con.ingreso_detalle id, con.ingreso i
               where id.num_ingreso = i.num_ingreso
               and id.dstrct = i.dstrct
               and id.tipo_documento = i.tipo_documento
               and id.dstrct = 'FINV'
               and id.tipo_documento in ('ING','ICA')
               and i.reg_status = ''
               and id.documento = fra.documento
            )as fecha_ultimo_pago,
            (SELECT sum(i.vlr_ingreso) 
               from con.ingreso_detalle id, con.ingreso i
               where id.num_ingreso = i.num_ingreso
               and id.dstrct = i.dstrct
               and id.tipo_documento = i.tipo_documento
               and id.dstrct = 'FINV'
               and id.tipo_documento in ('ING','ICA')
               and i.reg_status = ''
               and id.documento = fra.documento
               and fecha_consignacion = fecha_ultimo_pago
            )as vlr_ultimo_pago,
            fra.valor_saldome,
            fra.valor_saldo,
            fra.fecha_factura,
            fra.fecha_vencimiento,
            fra.agencia_cobro,
            fra.moneda,
            fra.obs,
            fra.cmc,
            cmc.cuenta as cuenta,
            fra.valor_factura,
            fra.valor_facturame,
            fra.valor_saldome,
            CASE WHEN SUBSTRING(fra.documento,1,2) IN ('CM','MI','CA') THEN  0 ELSE  capital END as capital,
            CASE WHEN SUBSTRING(fra.documento,1,2) IN ('CM','MI','CA') THEN 0 ELSE
		(CASE WHEN (select count(0) from tem.negocios_facturacion_old where cod_neg = fra.negasoc) = 1 THEN 	
			(CASE WHEN (SELECT  count(*)
				    FROM con.factura fac
				    WHERE  fac.negasoc= fra.negasoc
				    AND fac.num_doc_fen= fra.num_doc_fen
				    AND SUBSTRING(fac.documento,1,2) IN ('CM')
				    AND fac.reg_status !='A' ) = 1 THEN (SELECT  coalesce(sum(valor_saldo),0.00) as saldo
							    FROM con.factura fac
							    WHERE  fac.negasoc= fra.negasoc
							    AND fac.num_doc_fen= fra.num_doc_fen
							    AND SUBSTRING(fac.documento,1,2) IN ('CM')
							    AND fac.reg_status !='A' ) ELSE cuota_manejo END) ELSE cuota_manejo END) END as cuota_manejo,
            CASE WHEN SUBSTRING(fra.documento,1,2) IN ('CM','MI','CA') THEN 0 ELSE
		(CASE WHEN (select count(0) from tem.negocios_facturacion_old where cod_neg = fra.negasoc) = 1 THEN 
			(CASE WHEN (SELECT  count(*)
				    FROM con.factura fac
				    WHERE  fac.negasoc= fra.negasoc
				    AND fac.num_doc_fen= fra.num_doc_fen
				    AND SUBSTRING(fac.documento,1,2) IN ('MI','TS')
				    AND fac.reg_status !='A' ) = 1 THEN (SELECT  coalesce(sum(valor_saldo),0.00) as saldo
							    FROM con.factura fac
							    WHERE  fac.negasoc= fra.negasoc
							    AND fac.num_doc_fen= fra.num_doc_fen
							    AND SUBSTRING(fac.documento,1,2) IN ('MI','TS')
							    AND fac.reg_status !='A' ) ELSE interes END) ELSE interes END) END  as interes,
            CASE WHEN SUBSTRING(fra.documento,1,2) IN ('CM','MI','CA') THEN 0 ELSE
		(CASE WHEN (select count(0) from tem.negocios_facturacion_old where cod_neg = fra.negasoc) = 1 THEN  
			(CASE WHEN (SELECT count(*)
				    FROM con.factura fac
				    WHERE  fac.negasoc=fra.negasoc
				    AND fac.num_doc_fen=  fra.num_doc_fen
				    AND SUBSTRING(fac.documento,1,2) IN ('CA')
				    AND fac.reg_status !='A') = 1 THEN (SELECT coalesce(sum(valor_saldo),0.00) as saldo
							    FROM con.factura fac
							    WHERE  fac.negasoc=fra.negasoc
							    AND fac.num_doc_fen=  fra.num_doc_fen
							    AND SUBSTRING(fac.documento,1,2) IN ('CA')
							    AND fac.reg_status !='A') ELSE cat END) ELSE cat END) END as cat,
            CASE WHEN SUBSTRING(fra.documento,1,2) IN ('CM','MI','CA') THEN  0 ELSE seguro END as seguro, 
            COALESCE(fra.agencia_facturacion, '') AS agfacturacion,
            COALESCE(fra.agencia_facturacion, '') AS codagfacturacion,
            -1 * (fra.fecha_vencimiento::date - '2019-04-04'::date) AS ndias,
            CASE WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=361 THEN 'MAYOR A 1 AÑO'
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=181 THEN 'ENTRE 180 Y 360'   
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=121 THEN 'ENTRE 121 Y 180'
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=91 THEN 'ENTRE 91 Y 120'
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=61 THEN 'ENTRE 61 Y 90'
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=31 THEN 'ENTRE 31 Y 60'
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))>=1 THEN '1 A 30'        
                     WHEN ((now()::date-fra.fecha_vencimiento::DATE ))<= 0 THEN 'CORRIENTE'
            ELSE '0' END AS rango,
            CASE WHEN tipo_ref2='SV' THEN
	    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
		SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
		SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10) 
		END ELSE
			CASE WHEN fra.negasoc like 'NF%' THEN (fra.fecha_vencimiento::DATE + interval'60 days' )::DATE::TEXT
			ELSE     SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10) END
			END AS ndiasf,
            COALESCE( cia.moneda, '' ) AS moneda_cia,
            COALESCE(cli.agduenia, '') AS agduenia,	     
            COALESCE( fra.num_doc_fen,'NR') as docu,
            COALESCE(negocios.banco_cheque,'NR') AS bank,
            COALESCE(negocios.num_aval,'NR') AS aval,
            '' AS ref, --COALESCE(get_numfac(fra.observacion),'NR') AS ref,
            COALESCE(an.no_solicitud, 0) as no_solicitud,
            COALESCE(an.ciclo, 0) as ciclo,
            COALESCE(cm.liquidacion::text, '') as fecha_facturacion,
            COALESCE(negocios.num_pagare,'NR') AS numero_pagare
            ,tipo_ref1,ref1,tipo_ref2,ref2
            ,negocios.negocio_rel
            ,negocios.id_convenio
            ,(SELECT eg_altura_mora_periodo(negocios.cod_neg::VARCHAR, REPLACE(substring(now()::date,1,7),'-','')::integer, 1::integer,0::integer))::varchar AS Altura_mora
            
            ,CASE WHEN (substring(fra.negasoc,1,2) = 'MC') OR (substring(fra.negasoc,1,2) = 'FE')  THEN
			            CASE WHEN (SELECT negocio from administrativo.control_indemnizacion_fianza WHERE negocio = fra.negasoc AND documento = fra.documento) IS NOT NULL THEN
			            			'Cartera Indemnizada'::varchar
			            	 ELSE 
			            	 		'Sin Indemnizar'::varchar
			            END
	         ELSE
	        	  		CASE WHEN (SELECT negocio from administrativo.control_indemnizacion_fenalco WHERE negocio = fra.negasoc AND documento = fra.documento) IS NOT NULL THEN
			            			'Cartera Indemnizada'::varchar
			            	 ELSE 
			            	 		'Sin Indemnizar'::varchar
			            END
             END AS Indemnizado           
             
            FROM con.factura fra
            LEFT JOIN con.cmc_doc cmc ON ( cmc.cmc = fra.cmc and cmc.tipodoc=fra.tipo_documento)
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
            LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
            LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)
            LEFT JOIN anexos_negocios an ON (an.codneg = fra.negasoc)
            LEFT JOIN ciclos_metrotel cm ON (an.ciclo = cm.ciclo and abs(cm.primer_vencimiento-fra.fecha_vencimiento::date) < 10) 
            LEFT JOIN con.factura_observacion fo ON (fo.documento=fra.documento and fo.creation_date = (select max(o.creation_date) from con.factura_observacion as o where o.documento=fra.documento) and  REPLACE(substring(fo.creation_date,1,8),'-','') = REPLACE(substring(now(),1,8),'-',''))
            LEFT JOIN solicitud_aval sa ON (sa.cod_neg=negocios.cod_neg)
            LEFT JOIN solicitud_persona sp ON (sp.numero_solicitud=sa.numero_solicitud and sp.tipo ='S')
            LEFT JOIN documentos_neg_aceptado doc_neg on item = COALESCE(fra.num_doc_fen,'NR') AND  doc_neg.cod_neg=negocios.cod_neg
            WHERE 
            
            fra.negasoc = 'MC15956'
                  and  fra.dstrct = 'FINV'
          --AND fra.tipo_documento = 'FAC'
          --AND fra.valor_saldome != 0
          --AND negocios.id_convenio in (10)
            AND fra.reg_status != 'A'
            ORDER BY fecha_vencimiento
            
            
          --MC0662904
            
            --SELECT valor_fianza, valor_total_poliza,* FROM negocios WHERE cod_neg = 'FA18608';
            --SELECT valor_fianza, valor_total_poliza, cod_neg,* FROM negocios WHERE valor_fianza > 0 and cod_neg ilike 'MC%' order by creation_date desc LIMIT 100 ;