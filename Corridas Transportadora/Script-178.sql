SELECT 
                    id,
                    identificacion,
                    transportadora,
                    producto,
                    fecha_vencimiento,
                    sum(valor_anticipos) AS valor,
                    fecha_corrida,
                    count(0) as total_corte	
                FROM (
                        SELECT   
                                 trans.id
                                ,trans.identificacion
                                ,trans.razon_social as transportadora
                                ,producto_ser.descripcion as producto
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
                        trans.id= 3
                        AND anticipo.reg_status =''
                        AND anticipo.fecha_corrida::date <= '2018-11-27'::date
                        AND anticipo.cxc_corrida =''
                        UNION ALL 
                        SELECT	 trans.id
                                ,trans.identificacion
                                ,trans.razon_social as transportadora
                                ,producto_ser.descripcion as producto
                                ,reanticipo.fecha_pago_fintra::date as fecha_vencimiento
                                ,reanticipo.valor_reanticipo as valor_anticipos	
                                ,reanticipo.fecha_corrida::date
                        FROM etes.manifiesto_reanticipos reanticipo 
                                INNER JOIN etes.manifiesto_carga as anticipo on (reanticipo.id_manifiesto_carga=anticipo.id)
                                INNER JOIN etes.agencias as agencia on(agencia.id=anticipo.id_agencia)
                                INNER JOIN etes.vehiculo as vehiculo on(vehiculo.id=anticipo.id_vehiculo)
                                INNER JOIN etes.transportadoras as trans on (agencia.id_transportadora=trans.id)
                                INNER JOIN etes.conductor as conductor on (anticipo.id_conductor=conductor.id)
                                INNER JOIN etes.propietario as propietario on (vehiculo.id_propietario=propietario.id)
                                INNER JOIN etes.productos_servicios_transp as producto_ser on (anticipo.id_proserv=producto_ser.id)
                        WHERE
                        trans.id= 3
                        AND reanticipo.reg_status =''
                        AND reanticipo.fecha_corrida::date <= '2018-11-27'::date
                        AND reanticipo.cxc_corrida =''
                )tabla 
                GROUP BY 
                id,
                identificacion,
                transportadora,
                producto,
                fecha_vencimiento,
                fecha_corrida
                order by fecha_vencimiento;