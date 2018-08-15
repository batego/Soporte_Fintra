select get_lcod('NUMERO_AVAL');

 UPDATE  
            negocios		
            SET 
            num_aval = '17497', 
            estado_neg = 'V',
            aval_manual='S'			
            WHERE 
            cod_neg = 'FE01052';


UPDATE
            solicitud_aval
            SET
            numero_aprobacion='17497',
            estado_sol='V',
            last_update=now()
            WHERE
            cod_neg = 'FE01052';


        