SELECT   
						trans.id
						,trans.identificacion
						,trans.razon_social as transportadora
						,producto_ser.codigo_proserv as producto
						,anticipo.fecha_pago_fintra::date as fecha_vencimiento
						,anticipo.valor_neto_anticipo as valor_anticipos
						,anticipo.fecha_corrida::date
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
					AND anticipo.fecha_corrida::date <= fechaCorrida::date
					AND anticipo.cxc_corrida =''


					select * from etes.manifiesto_carga where id = '5' planilla = '0236901';


	select * from etes.transportadoras where id= 5
	select * from etes.agencias where id_transportadora =5
	select * from etes.manifiesto_carga 
	--update etes.manifiesto_carga set cxc_corrida = ''
	where id_agencia = 8 and planilla = '3505051'

	select etes.cxc_transportadoras(5, '2018-11-01', 'BTERRAZA')