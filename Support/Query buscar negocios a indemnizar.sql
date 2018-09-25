SELECT  
		    un.descripcion as nombre_linea_negocio,           
		    foto.codcli,
		    foto.nit::varchar as nit_cliente,
		    get_nombc(foto.nit)::varchar as nombre_cliente,
		    periodo_lote as periodo_foto,    
		    negasoc as negocio,       
		    coalesce(neg.num_pagare,'')::varchar as num_pagare,        
		    foto.documento,
		    foto.num_doc_fen as cuota,        
		    foto.fecha_vencimiento::date,		   
		    (sp_fecha_corte_foto(substring(periodo_lote,1,4),substring(periodo_lote,5,6)::int)::date-foto.fecha_vencimiento::date)::int as dias_mora,
		    foto.valor_factura::numeric as valor_factura,
		    foto.valor_factura::numeric-fdet.valor_unitario as valor_saldo_capital,
                    fdet.valor_unitario::numeric as valor_saldo_seguro,
		    foto.valor_abono::numeric,	
		    0.00::numeric as valor_desistir,
		    '0099-01-01'::date as fecha_indemnizacion,    
		    0::numeric as valor_saldo_mi,
		    0::numeric as valor_saldo_ca,
		    0::numeric as valor_saldo_cm,     
		    0::numeric as IxM,
		    0::numeric as GaC,
		    0::numeric as total_saldo,
		    foto.id_convenio::int as convenio,
		    cmc.cuenta,
		    un.ref_4,
		    ''::varchar as cartera_en,
		    'VENCIDO'::VARCHAR AS estado
	       FROM con.foto_cartera foto
	       INNER JOIN con.factura_detalle fdet on (foto.documento=fdet.documento and fdet.descripcion='SEGURO')
	       INNER join negocios AS neg on (neg.cod_neg=foto.negasoc and neg.estado_neg IN ('T','A'))
	       INNER JOIN solicitud_aval AS s ON (s.cod_neg=neg.cod_neg) AND s.reg_status='' 
	       INNER join rel_unidadnegocio_convenios as run on (run.id_convenio=foto.id_convenio)
	       INNER join unidad_negocio AS un on (run.id_unid_negocio=un.id)
	       INNER JOIN con.cmc_doc AS cmc on (cmc.cmc=foto.cmc and cmc.tipodoc=foto.tipo_documento)
	       INNER join administrativo.historico_deducciones_fianza as  df on (df.negocio =neg.cod_neg) 
	       LEFT join administrativo.control_indemnizacion_fianza as  ctrl on (ctrl.documento=foto.documento and ctrl.negocio =foto.negasoc ) 
	       WHERE periodo_lote='201809' 
	       AND foto.reg_status='' AND foto.dstrct ='FINV' 
	         AND substring(foto.documento,1,2) NOT IN ('AP','A','R0','FF','CP','PF','MI','CA')
		 AND foto.valor_saldo > 0   
	         AND s.fianza = 'S'       
	         AND ctrl.documento is null 
	         AND (sp_fecha_corte_foto(substring(periodo_lote,1,4),substring(periodo_lote,5,6)::int)::date-foto.fecha_vencimiento::date) between 1 and 180 
	         AND un.id ='1' 
	       AND df.nit_empresa_fianza ='9002207536'
	       AND foto.negasoc = 'MC08337'
		--#filtmonto
		ORDER BY foto.negasoc,foto.documento, foto.num_doc_fen;
		
	
	
	SELECT sp_fecha_corte_foto(substring('201809',1,4),substring('201809',5,6)::int)::date-'2018-03-12'::date;
	2018-03-12