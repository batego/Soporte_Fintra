SELECT * FROM consultas WHERE descripcion ILIKE 'reporte_cartera_validacion';
--Filtro
--2019-02-25
--2019-03-15
--2019-03-15
--201903
--2
--201903
--2


select 
       t2.periodo_lote,
       t2.nit,
       t2.nombre_cliente,
       t2.negasoc,
       t2.cuota,
       t2.id_convenio, 
       t2.documento,
       t2.fecha_vencimiento, 
       t2.valor_factura,
       t2.valor_abono,   
       t2.valor_saldo_capital,
       t2.saldo_interes_cartera,
       t2.saldo_cat_cartera,
       t2.mi_generado,
       t2.cat_generado,
       t2.altura_mora,
       t2.liq_capital,
       t2.liq_interes,
       t2.liq_cat,
       t2.liq_seguro,
       t2.liq_cuota_admin,
       t2.liq_valor_cuota,
       (t2.valor_saldo_capital+(CASE WHEN t2.mi_generado =1 THEN t2.saldo_interes_cartera 
				     WHEN negocio_old='N' THEN (SELECT saldo_interes FROM eg_detalle_saldo_facturas_mc(t2.negasoc,t2.cuota::integer))	
				ELSE t2.liq_interes END)
				+(CASE WHEN t2.cat_generado =1 THEN t2.saldo_cat_cartera 
				       WHEN negocio_old='N' THEN (SELECT saldo_cat FROM eg_detalle_saldo_facturas_mc(t2.negasoc,t2.cuota::integer))	
				ELSE t2.liq_cat END))  as total_saldo_factura    
FROM(
	SELECT t.periodo_lote,
	       t.nit,
	       get_nombc(t.nit)	as nombre_cliente,
	       t.negasoc,
	       t.cuota,
	       t.id_convenio, 
	       t.documento,
	       t.fecha_vencimiento, 
	       t.valor_factura,
	       t.valor_abono,   
	       CASE WHEN (SELECT count(*) FROM  tem.negocios_facturacion_old tem WHERE cod_neg=t.negasoc) =1 THEN 'S' ELSE 'N' END AS  negocio_old,
	       CASE WHEN (SELECT count(*) FROM  tem.negocios_facturacion_old tem WHERE cod_neg=t.negasoc) =1 THEN t.valor_saldo 
	       ELSE (SELECT saldo_capital+saldo_cuota_manejo+saldo_seguro FROM eg_detalle_saldo_facturas_mc(t.negasoc,t.cuota::integer))
	       END AS valor_saldo_capital,
	       (SELECT  coalesce(sum(valor_saldo),0.00) as saldo
					FROM con.factura fac 
					WHERE  fac.negasoc= t.negasoc
					AND fac.num_doc_fen= t.cuota
					AND SUBSTRING(fac.documento,1,2) IN ('MI','TS') 
					AND fac.reg_status !='A' ) as saldo_interes_cartera,
		(SELECT  count(*)
					FROM con.factura fac 
					WHERE  fac.negasoc= t.negasoc
					AND fac.num_doc_fen= t.cuota
					AND SUBSTRING(fac.documento,1,2) IN ('MI','TS') 
					AND fac.reg_status !='A' ) as mi_generado,
		(SELECT coalesce(sum(valor_saldo),0.00) as saldo 
						FROM con.factura fac 
						WHERE  fac.negasoc=t.negasoc
						AND fac.num_doc_fen=  t.cuota
						AND SUBSTRING(fac.documento,1,2) IN ('CA') 
						AND fac.reg_status !='A') as saldo_cat_cartera,	
		(SELECT count(*)
						FROM con.factura fac 
						WHERE  fac.negasoc=t.negasoc
						AND fac.num_doc_fen=  t.cuota
						AND SUBSTRING(fac.documento,1,2) IN ('CA') 
						AND fac.reg_status !='A') as cat_generado,			
	       t.altura_mora,
	       eg_vlrs_liq_cuota(t.negasoc,'CAPITAL', t.cuota::INTEGER) as liq_capital,
	       eg_vlrs_liq_cuota(t.negasoc,'INTERES', t.cuota::INTEGER) as liq_interes,
	       eg_vlrs_liq_cuota(t.negasoc,'CAT', t.cuota::INTEGER) as liq_cat,
	       eg_vlrs_liq_cuota(t.negasoc,'SEGURO', t.cuota::INTEGER) as liq_seguro,
	       eg_vlrs_liq_cuota(t.negasoc,'CUOTA-ADMINISTRACION', t.cuota::INTEGER) as liq_cuota_admin,
	       eg_vlrs_liq_cuota(t.negasoc,'VALOR-CUOTA', t.cuota::INTEGER) as liq_valor_cuota	 
	FROM (
	SELECT 
	       f.periodo_lote,
	       f.nit,	
	       f.negasoc,
	       f.num_doc_fen as cuota,
	       f.id_convenio, 
	       f.documento,
	       f.fecha_vencimiento, 
	       f.valor_factura,
	       f.valor_abono,   
	       f.valor_saldo,	     
	       (SELECT   
			eg_altura_mora_periodo(f.negasoc,201412,3,maxdia::INTEGER)
		    FROM (	
			 SELECT max('2019-02-25'::date-(fecha_vencimiento)) as maxdia
			 FROM con.foto_ciclo_pagos fra            
			 WHERE fra.dstrct = 'FINV'       
				  AND fra.valor_saldo > 0            
				  AND fra.reg_status = '' 
				  AND fra.negasoc =  f.negasoc
				  AND fra.id_convenio = f.id_convenio
				  AND fra.tipo_documento in ('FAC','NDC')
				  AND substring(fra.documento,1,2) not in ('CP','FF','DF') 
				  AND fra.fecha_vencimiento <= '2019-03-15'
				  AND fra.periodo_lote =f.periodo_lote
			 GROUP BY negasoc			
		    )t
		)as altura_mora	  
	from 
	con.foto_ciclo_pagos f
	WHERE   f.reg_status = ''			
	AND f.dstrct = 'FINV'
	AND f.tipo_documento = 'FAC'
	AND f.valor_saldo > 0
	AND SUBSTRING(f.documento,1,2) in ('MC','TD')
	AND f.id_convenio != 41	
	AND f.fecha_vencimiento <= '2019-03-15'
	AND f.id_ciclo =(SELECT id FROM con.ciclos_facturacion WHERE periodo ='201903' AND num_ciclo = 2)
	AND f.negasoc NOT IN (SELECT cod_neg FROM extractos_generados 
							 WHERE unidad_negocio = 1 
							 AND periodo ='201903' AND num_ciclo =2)
	group by f.id_convenio, f.negasoc,f.nit, f.periodo_lote,f.num_doc_fen,f.documento,f.fecha_vencimiento, f.valor_factura, f.valor_abono,f.valor_saldo
	)t 
	WHERE t.negasoc !='MC15923' AND altura_mora in  ('1- CORRIENTE','2- 1 A 30','3- ENTRE 31 Y 60','4- ENTRE 61 Y 90','5- ENTRE 91 Y 120','6- ENTRE 121 Y 180','7- ENTRE 180 Y 360')
	ORDER BY  altura_mora,negasoc, cuota
)t2


--Negocio Excluido: MC15923