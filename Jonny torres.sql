SELECT  nombre_linea_negocio,
                    num_pagare, 
                    nit_cliente,
                    nombre_cliente, 
                    negocio,
                    max(altura_mora) as altura_mora,
                    max(dias_mora) as dias_mora,
                    sum(valor_factura) as valor_factura, 
                    sum(valor_saldo_capital) as valor_saldo_capital, 
                    sum(valor_saldo_seguro) as valor_saldo_seguro,
                    sum(valor_saldo_mi) as valor_saldo_mi,
                    sum(valor_saldo_ca) as valor_saldo_ca,
                    sum(valor_saldo_cm) as valor_saldo_cm,	
                    sum(IxM) as IxM,
                    sum(GaC) as GaC,
                    sum(total_saldo) as total_saldo	
            FROM sp_facturas_indemnizar_fianza_micro('201903'::varchar, 1::int, '9002207536'::varchar,360::int, ''::varchar, '1'::boolean, '0'::boolean,'0'::boolean) AS 
                                                    (nombre_linea_negocio character varying,           
                                                    codcli character varying,
                                                    nit_cliente character varying, 
                                                    nombre_cliente character varying, 
                                                    periodo_foto character varying, 
                                                    negocio character varying,  
                                                    num_pagare character varying,                
                                                    documento character varying, 
                                                    cuota character varying,     
                                                    fecha_vencimiento date, 
                                                    dias_mora int, 
                                                    valor_factura numeric, 
                                                    valor_saldo_capital numeric, 				
                                                    valor_desistir numeric, 
                                                    fecha_indemnizacion date,
                                                    valor_saldo_mi numeric,
                                                    valor_saldo_ca numeric,				 
                                                    IxM numeric,
                                                    GaC numeric,
                                                    total_saldo numeric,
                                                    convenio int,
                                                    cuenta character varying, 
                                                    ref_4 character varying, 
                                                    cartera_en character varying,
                                                    estado character varying,
                                                    valor_saldo_cm numeric,
                                                    valor_saldo_seguro numeric,
                                                    valor_abono numeric,
                                                    altura_mora character varying,
                                                    esquema_old  character varying)
            GROUP BY  
            nombre_linea_negocio,
            num_pagare, 
            nit_cliente,
            nombre_cliente, 
            negocio;