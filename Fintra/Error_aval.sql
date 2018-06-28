select get_lcod('NUMERO_AVAL');

 UPDATE  
            negocios		
            SET 
            num_aval = '15846', 
            estado_neg = 'V',
            aval_manual='S'			
            WHERE 
            cod_neg = 'MC14691';


UPDATE
            solicitud_aval
            SET
            numero_aprobacion='15846',
            estado_sol='V',
            last_update=now()
            WHERE
            cod_neg = 'MC14691';


        