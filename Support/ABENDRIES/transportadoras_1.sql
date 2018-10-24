SELECT 	       'FINV'::VARCHAR as distrito,
				propietario_es.identificacion as proveedor,
				'FAP'::VARCHAR as tipo_doc,			
				'ESTACION DE SERVICIO '||estacion.nombre_eds as descripcion, 
				estacion.municipio as agencia,
				--cmc_factura::VARCHAR as handle_code,--FALTA EL HC
				(select table_code from tablagen where table_type= 'AUTCXP' AND referencia='CXP_EDS' AND descripcion='LASNIEVES')as aprobador,
				'BANCOLOMBIA'::VARCHAR as banco,
				'CPAG'::VARCHAR as sucursal,
				'PES'::VARCHAR as moneda,			
				--SUM((veds.total_venta-veds.valor_comision_fintra)) as vlr_neto,
				SUM(veds.total_venta) as vlr_neto,
				1.0000000000::numeric as tasa			
			FROM etes.ventas_eds as veds
			INNER JOIN etes.manifiesto_carga as mc on (veds.id_manifiesto_carga=mc.id)		
			INNER JOIN etes.conductor as conductor on (conductor.id=mc.id_conductor)
			INNER JOIN etes.vehiculo as vehiculo on (vehiculo.id=mc.id_vehiculo)
			INNER JOIN etes.productos_es as prod on (veds.id_producto=prod.id)
			INNER JOIN etes.unidad_medida as unidad on (unidad.id=prod.id_unidad_medida)
			INNER JOIN etes.estacion_servicio as estacion on (veds.id_eds=estacion.id) 
			INNER JOIN etes.propietario_estacion as propietario_es on  (estacion.id_propietario_estacion=propietario_es.id)
			WHERE
			veds.reg_status='' 
			AND mc.reg_status='' 
			AND veds.id_eds=18::integer
			AND veds.documento_cxp='' AND fecha_venta::date='2018-10-17'::date
			GROUP BY 
			propietario_es.identificacion
			,estacion.nombre_eds
			,estacion.municipio;
			
		
		
		select * from tablagen where table_type= 'AUTCXP' AND referencia='CXP_EDS' AND descripcion='LASNIEVES')as aprobador,;
		
		