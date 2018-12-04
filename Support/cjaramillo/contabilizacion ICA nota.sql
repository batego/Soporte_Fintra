SELECT a.*,                        
                       c.cmc           as cmc_cliente,
                       b.codigo_cuenta as cuenta_banco,
                       d.cuenta        as cuenta_cliente,
                       c.nomcli         as nomb
                  FROM con.ingreso a
                       LEFT JOIN banco       b ON (b.dstrct = a.dstrct AND b.branch_code = a.branch_code AND b.bank_account_no = a.bank_account_no)
		          LEFT JOIN cliente     c ON (c.codcli = a.codcli)
		          LEFT JOIN con.cmc_doc d ON (d.tipodoc = a.tipo_documento  AND d.cmc = CASE WHEN a.tipo_documento IN ('ICA','ICR')  THEN a.cmc ELSE c.cmc END)
                  WHERE  a.tipo_documento IN ('ICA','ICR')
                    AND a.num_ingreso NOT IN (
                        SELECT i.num_ingreso 
                        FROM con.ingreso i 
                        WHERE (i.vlr_ingreso !=(SELECT COALESCE(SUM(d.valor_ingreso),0) FROM con.ingreso_detalle d WHERE d.num_ingreso=i.num_ingreso AND reg_status!='A')                                
                                )
                                AND (NOT(i.fecha_contabilizacion='0099-01-01 00:00:00' AND i.reg_status ='A'))	                                
                         )
                  and  a.num_ingreso = 'IA484189'
                 ORDER BY a.tipo_documento, a.num_ingreso;