SELECT * FROM mc_estado_cuenta_fenalco_2('FA36903','FINV', '2018-06-12'::date) as factura (	
					   factura varchar
                                           ,fecha DATE
                                           ,convenio varchar
                                           ,item VARCHAR
                                           ,dias_mora INTEGER
                                           ,saldo_inicial numeric
                                           ,valor_cuota numeric 
                                           ,valor_saldo_cuota numeric 
                                           ,capital numeric
                                           ,interes numeric
                                           ,seguro numeric
                                           ,mipyme numeric
                                           ,cuota_manejo numeric
                                           ,interes_mora numeric  
                                           ,gac numeric  
                                           ,valor_saldo_global_cuota numeric
                                           ,estado varchar	
            )order by factura.item::numeric 

--'FG2302506';'2018-06-02';'17';'6';10;258705.95;278983.00;57781.00;258706.00;4277.00;0.00;0.00;16000.00;2096.09;0.00;281079.09;'VENCIDA'

            