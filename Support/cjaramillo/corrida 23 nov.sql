
SELECT fecha_aprobacion, corrida, tipo_documento, vlr_saldo_me,
cheque,ret_pago,tipo_documento_rel,factura_tipo_nomina,
* 
FROM fin.cxp_doc WHERE documento = 'EDS0000376';
SELECT * FROM fin.cxp_ITEMS_doc WHERE documento = 'EDS0000376';


SELECT  *
               FROM        
               (               
                    SELECT                    
                         a.*,
                         b.plaveh          as placa ,
                         c.payment_name    as nombre,
                         c.tipo_pago      ,
                         c.banco_transfer ,
                         c.suc_transfer   ,
                         c.tipo_cuenta    ,
                         c.no_cuenta      ,
                         c.cedula_cuenta  ,
                         c.nombre_cuenta  ,
                         b.feccum         ,
                         b.base           as baseOC
                      FROM
                         (
                                SELECT
                                        a.dstrct          as distrito,        
                                        a.proveedor       as proveedor,       
                                        a.agencia         as agencia,         
                                        a.tipo_documento  as tipoDoc,         
                                        a.documento       as factura,         
                                        a.banco           as banco,           
                                        a.sucursal        as sucursal,
                                        a.moneda_banco    as moneda_banco,
                                        a.fecha_documento as fecha,
                                        a.moneda          as moneda,
                                        a.vlr_saldo       as saldo,
                                        a.vlr_saldo_me    as saldo_me,
                                        b.planilla        as planilla,
                                        a.base
                                   FROM
                                        fin.cxp_doc  a,
                                        fin.cxp_items_doc  b
                                   WHERE
                                        a.dstrct         = 'FINV'
                                   AND  a.fecha_aprobacion != '0099-01-01 00:00:00'                                   
                                   AND  a.corrida           = ''                
                                   AND  a.tipo_documento    = 'FAP'             
                                  -- AND  (a.vlr_saldo_me     != 0  OR (  a.vlr_saldo_me  = 0  AND   a.cheque='' )   )   
                                   AND  (a.vlr_saldo_me   != 0  AND   a.cheque='' )
                                   AND  a.reg_status        = ''
                                   AND  a.ret_pago         != 'S'
                                   AND a.tipo_documento_rel !='NEG'
                                   AND  a.factura_tipo_nomina != 'S'
                                   AND A.documento in ('EDS0000377','EDS0000376')
                                   -- Se verifica que no este en precheque pendiente por imprimir
				   AND  NOT EXISTS ( SELECT 1
					FROM 	fin.precheque_detalle p 
					WHERE 	p.dstrct = a.dstrct AND
						p.proveedor = a.proveedor AND
						p.tipo_documento = a.tipo_documento AND
						p.documento = a.documento AND
						p.reg_status = ''
						)
                                   --se verifica que el  proveedor no se le deba retener el pago             
                                   AND  NOT EXISTS ( SELECT 1 
                                                     FROM proveedor pr
                                                     WHERE 
                                                        pr.nit = a.proveedor
                                                     AND ret_pago ='S'
                                                   )                  
                                   AND  b.dstrct            =  a.dstrct         
                                   AND  b.proveedor         =  a.proveedor      
                                   AND  b.tipo_documento    =  a.tipo_documento 
                                   AND  b.documento         =  a.documento      
                                   AND  b.item              = '001'
                       ) a
                      LEFT JOIN  planilla  b
                        ON  ( b.numpla    = a.planilla   )
                      LEFT JOIN  proveedor  c
                        ON  ( a.proveedor = c.nit        )
                ) a;
                
   SELECT * FROM proveedor WHERE nit ='9001157157';
  
  CREATE TABLE tem.corrida_23nov AS;
  SELECT * FROM fin.cxp_doc 
 UPDATE fin.cxp_doc SET user_update = '', corrida = ''
  WHERE corrida = '5385';
 
 
 SELECT  DISTINCT corrida, " +
    "                                                           get_nombreusuario(creation_user) AS generador" +
    "                                                   FROM    fin.corridas 
    
    
    CREATE TABLE tem.corridas_table_corridas_5385 as
    SELECT * FROM fin.corridas WHERE corrida = '5385';
 	delete FROM fin.corridas WHERE corrida = '5385';
 
