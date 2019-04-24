SELECT
                    facturas.*, 
                    cmc.sigla_comprobante,   
                    cmc.cuenta,
                    (select codigo_cuenta_contable from con.factura_detalle where documento = facturas.numdoc limit 1) as cc_contable,
                    cmc.dbcr,
		    get_nombc(facturas.tercero) as nomb_cli
              FROM
 
               (
                   SELECT
			  a.dstrct   ,
                          a.tipo_documento       as tipo_doc,
			  a.nit                  as tercero,
                          a.documento            as numdoc,
                          a.base,
                          a.codcli,
                          a.cmc                  as  hc,
                          a.moneda ,
                          a.fecha_factura ,             
			  substr( a.fecha_vencimiento,1,4 ) ||  substr( a.fecha_vencimiento,6,2 )  as periodo,
		          a.valor_factura as debe
 
                    FROM      con.factura        a
                    WHERE
                              --a.dstrct                      =  ?
                       --AND    a.fecha_factura               &lt;=  ?
                          a.fecha_contabilizacion       = '0099-01-01 00:00:00'
                       AND    a.reg_status                  = ''
                       AND    A.nit 			    = '32786596'

                ) facturas

                LEFT JOIN  con.tipo_docto  tdoc ON (      tdoc.dstrct          =  facturas.dstrct
                                                      AND tdoc.codigo_interno  =  facturas.tipo_doc 
                                                   )
                
                LEFT JOIN  con.cmc_doc     cmc  ON ( 
                                                          cmc.dstrct           = tdoc.dstrct
                                                      AND cmc.tipodoc          = tdoc.codigo
                                                      AND cmc.cmc              = facturas.hc
                                                    )
                                                    
