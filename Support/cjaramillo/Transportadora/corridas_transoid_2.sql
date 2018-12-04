SELECT 
					id,
					identificacion,
					transportadora,
					producto,
					fecha_vencimiento,
					sum(valor_anticipos) AS valor,
					fecha_corrida,
					planilla
				FROM (
					SELECT   
						trans.id
						,trans.identificacion
						,trans.razon_social as transportadora
						,producto_ser.codigo_proserv as producto
						,anticipo.fecha_pago_fintra::date as fecha_vencimiento
						,anticipo.valor_neto_anticipo as valor_anticipos
						,anticipo.fecha_corrida::date
						,anticipo.cxc_corrida
						,anticipo.planilla
					FROM etes.manifiesto_carga anticipo 
						INNER JOIN etes.agencias as agencia on(agencia.id=anticipo.id_agencia)
						INNER JOIN etes.vehiculo as vehiculo on(vehiculo.id=anticipo.id_vehiculo)
						INNER JOIN etes.transportadoras as trans on (agencia.id_transportadora=trans.id)
						INNER JOIN etes.conductor as conductor on (anticipo.id_conductor=conductor.id)
						INNER JOIN etes.propietario as propietario on (vehiculo.id_propietario=propietario.id)
						INNER JOIN etes.productos_servicios_transp as producto_ser on (anticipo.id_proserv=producto_ser.id)
					WHERE 
					trans.id= 5
					AND anticipo.reg_status =''
					AND anticipo.fecha_corrida::date <= '2018-11-06'::date
					--AND anticipo.cxc_corrida =''
					
					UNION ALL 
					
					SELECT	 trans.id
						,trans.identificacion
						,trans.razon_social as transportadora
						,producto_ser.codigo_proserv as producto
						,reanticipo.fecha_pago_fintra::date as fecha_vencimiento
						,reanticipo.valor_reanticipo as valor_anticipos	
						,reanticipo.fecha_corrida::date
						,reanticipo.cxc_corrida
						,reanticipo.planilla
					FROM etes.manifiesto_reanticipos reanticipo 
						INNER JOIN etes.manifiesto_carga as anticipo on (reanticipo.id_manifiesto_carga=anticipo.id)
						INNER JOIN etes.agencias as agencia on(agencia.id=anticipo.id_agencia)
						INNER JOIN etes.vehiculo as vehiculo on(vehiculo.id=anticipo.id_vehiculo)
						INNER JOIN etes.transportadoras as trans on (agencia.id_transportadora=trans.id)
						INNER JOIN etes.conductor as conductor on (anticipo.id_conductor=conductor.id)
						INNER JOIN etes.propietario as propietario on (vehiculo.id_propietario=propietario.id)
						INNER JOIN etes.productos_servicios_transp as producto_ser on (anticipo.id_proserv=producto_ser.id)
					WHERE
					trans.id= 5
					AND reanticipo.reg_status =''
					AND reanticipo.fecha_corrida::date <= '2018-11-06'::date
					--AND reanticipo.cxc_corrida =''
				)tabla 
				GROUP BY 
				id,
				identificacion,
				transportadora,
				producto,
				fecha_vencimiento,
				fecha_corrida,
				planilla
				order by fecha_vencimiento

				1227413.00
SELECT 383757.00 +
356346.00 +
487310.00


	select  * from etes.manifiesto_carga where planilla in ('0236901','0237567','0237570','0237565');

	select * from con.factura where documento = 'R0036940'
	select * from con.factura_detalle where documento = 'R0036940'

	select * from con.comprobante where numdoc = 'R0036940'
	select * from con.comprobante where numdoc = 'R0036940'

	select * from etes.transportadoras where id= 5
	select * from etes.agencias where id_transportadora =5
	select * from etes.manifiesto_carga where id_agencia = 8