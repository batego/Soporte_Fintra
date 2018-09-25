select * from sp_facturas_indemnizar_fianza_micro('201806'::varchar, 1::int, '9002207536'::varchar,90::int, ''::varchar, '0'::boolean, '0'::boolean,'0'::boolean) as 
              ( nombre_linea_negocio character varying,           
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
                esquema_old  character varying);
                
               
 --create table tem.indemniz_MC12091 as               
 select * from administrativo.control_indemnizacion_fianza where negocio = 'MC12091';-- periodo_foto = '201805' limit 10; --WHERE negocio = 'MC07624';
 --delete from administrativo.control_indemnizacion_fianza where negocio = 'MC12091';
 SELECT * FROM administrativo.historico_deducciones_fianza WHERE negocio = 'MC12091';
 
 -- tabla backup tem.indemniz_MC12091
 select * from tem.indemniz_MC12091;
 insert into administrativo.control_indemnizacion_fianza select * from tem.indemniz_MC12091;
 
 
 
 SELECT * FROM tem.facturas_indemnizar_fianza_micro where negocio = 'MC12091';  -- WHERE negocio = 'MC11741';
 select * from con.foto_cartera where negasoc = 'MC12091';
 
------------------------InsertIndemnizar---------------------
 INSERT INTO administrativo.control_indemnizacion_fianza(
            periodo_foto, 
            nit_empresa_fianza, 
            codcli, 
            nit_cliente, 
            nombre_cliente, 
            negocio, 
            num_pagare,
            documento, 
            cuota, 
            fecha_vencimiento, 
            fecha_indemnizacion, 
            altura_mora, 
            dias_vencidos, 
            valor_factura,
            valor_saldo_capital, 
            valor_saldo_mi, 
            valor_saldo_ca, 
            ixm, 
            gac, 
            valor_indemnizado, 
            id_convenio,  
            linea_negocio, 
            creation_date, 
            creation_user)
            VALUES ('201806', 
            '9002207536', 
            'CL38531', 
            '10006429', 
            'CARDONA ACOSTA JHON MARIO', 
            'MC11741', 
            '15656',
            'MC1021505', 
            '5', 
            '2018-05-12', 
            now()::DATE, 
            '2- 1 A 30', 
            '19', 
            '304519.00', 
            '206325.00', 
            '65154.00', 
            '9219.00', 
            '0', 
            '0', 
            '284698.00',
            '10', 
            '1', 
            'JDBERMUDEZ', 
            '', 
            '', 
            '',
            '',
            '',
            now(),
            '');