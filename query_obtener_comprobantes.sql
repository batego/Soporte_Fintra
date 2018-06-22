SELECT  periodo             ,
                    tipodoc             ,
                    numdoc              ,
                    grupo_transaccion   ,
                    creation_date::date ,
                    fecha_aplicacion::date  ,
                    creation_user       ,
                    total_debito        ,
                    total_credito       ,
                    dstrct, tercero
            FROM    con.comprobante
            WHERE    numdoc = '10076984' AND 
                     tipodoc='AEF' AND 
                    reg_status != 'A'
                     AND periodo LIKE '%%' 

                     
SELECT  periodo             ,
                    tipodoc             ,
                    numdoc              ,
                    grupo_transaccion   ,
                    creation_date::date ,
                    fecha_aplicacion::date  ,
                    creation_user       ,
                    total_debito        ,
                    total_credito       ,
                    dstrct, tercero
            FROM    con.comprobante
            WHERE    numdoc = '10076984' AND 
                     tipodoc='FAP' AND 
                    reg_status != 'A'
                     AND periodo LIKE '%%' 