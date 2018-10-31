

SELECT *
                FROM   con.subledger
                WHERE                       
                  cuenta                                 =  '13109601'
                 AND   tipo_subledger || '-' || id_subledger  =  '900301404'
                 AND   reg_status                             = '';
                 
                 --buscar el nit de la factura y crear un registro en la tala con.subledger
                 SELECT * FROM con.factura WHERE documento = 'PM14221_1';
                 
                
 SELECT * FROM cliente WHERE codcli = 'CS32559' nit = '900301404';
 SELECT * FROM con.subledger WHERE creation_USER = 'BTERRAZA';