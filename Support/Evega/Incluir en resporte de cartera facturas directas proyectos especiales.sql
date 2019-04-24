--select * from consultas where descripcion='CARTERA_MULTISERVICIOS';


/**
 * Funcion Original
 */

(
SELECT   tipo_ref1
        ,ref1
	,tipo_solicitud
	,tipo_ref2,ref2 ,ident
	,ejecutivo,ciudad,sector,nomcli,codcli
	,COALESCE((string_to_array(padre_cliente,'@'))[1],nomcli) AS nombre_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[2],nit) AS nit_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[3],'') AS cod_padre_cons
	,COALESCE((string_to_array(padre_cliente,'@'))[4],'') AS nics_padre_cons
	,valor_factura,valor_saldo
	,documento,valor_unitario as valor_intereses,cuenta,fecha_factura,fecha_vencimiento,ndiasf,clasificacion1 as fiducia,
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
---------este bloque fue cambiado----------------
((SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario, fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura as fra
            left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                   -- AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','SR','SV','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('PM','RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459
		
) tabla
)) as tbl_ndiasf
---------fin bloque cambiado----------------

where tbl_ndiasf.ref1=tabla2.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual ,
	extemporaneo,
	comentario as status		
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,fecha_vencimiento_calculada
FROM (	
SELECT tipo_ref1,fra.ref1
	,ofe.tipo_solicitud AS tipo_solicitud
	,tipo_ref2,ref2 
	,fra.nit as ident
        ,ee.nombre AS ejecutivo,
	(select nomciu from ciudad where codciu=cc.ciudad) AS ciudad,
	cc.sector AS sector
	,ofe.comentario  AS comentario
        ,COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	fra.codcli,	
	fra.valor_factura,                   
	fra.valor_saldo,
	fra.documento,
	fd.valor_unitario,
        (SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	fra.fecha_factura,
        fra.fecha_vencimiento,       
        CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END AS ndiasf  
	,fra.clasificacion1
	,ofe.esoficial AS extemporaneo	
        ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select cliente_padre('''||fra.codcli||''','''||id_cliente||''') as salida') AS ct (salida character varying))  AS padre_cliente
        ,fra.nit
        ,ing.max_fec_ing
        ,ding.val_ing
        ,ing2.max_fec_ing2
        ,ding2.val_ing2
        ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select fecha_vencimiento_calculada('''||fra.ref1||''','''||fra.documento||''') as salida') AS ct (salida character varying))::date AS fecha_vencimiento_calculada

            FROM con.factura fra
	    left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN ofertas_view_dblink ofe ON ( ofe.id_solicitud = fra.referencia_1 )
            LEFT JOIN cliente cc ON ( cc.codcli = ofe.id_cliente )
	    LEFT JOIN ejecutivos_view_dblink ee ON ( ee.id_ejecutivo=cc.id_ejecutivo )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
            --LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
            --LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND SUBSTR(id.documento,1,2) in ('PM','NM')
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND SUBSTR(id.documento,1,2) in ('PM','NM') 
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	   LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND SUBSTR(f.documento,1,2) in ('PM','NM') 
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	   LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND SUBSTR(f.documento,1,2) in ('PM','NM') 
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
	
           WHERE
                    fra.dstrct = 'FINV'       
                    AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','FP','SR','SV','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) ='PM' 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,documento--8459
		
) tabla2
)

UNION ALL
---BLOQUE DOS---
(
SELECT tipo_ref1,ref1
	,tipo_solicitud
	,tipo_ref2,ref2,ident,ejecutivo,ciudad,sector, nomcli,
	codcli
	, nomcli AS nombre_padre
	, nit AS nit_padre
	, '' AS cod_padre
	, '' AS nics_padre
	,valor_factura, valor_saldo, documento,valor_unitario as valor_intereses,cuenta, fecha_factura, fecha_vencimiento,
	ndiasf,clasificacion1 as fiducia,
		
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
((

/* bloque cambiado */
SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario,fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura fra
            left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))            
           WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                    --AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','FU','DC') --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('PM','RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459

) tabla 
 ))as tbl_ndiasf
where tbl_ndiasf.ref1=tabla.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual

	,extemporaneo
	,comentario AS status
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,
	fecha_vencimiento_clculada
FROM (
SELECT tipo_ref1,fra.ref1
	,'':: CHARACTER  AS tipo_solicitud	
	,tipo_ref2,ref2,   fra.nit as ident
	,cc.ejecutivo_cta AS ejecutivo
	,cc.ciudad AS ciudad
	,cc.sector AS sector
	 
	,ofe.comentario AS comentario,
	    COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	    fra.codcli,
	    fra.valor_factura,
	    fra.valor_saldo,
	    fra.documento,
	fd.valor_unitario,
	    (SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	    fra.fecha_factura,
	    fra.fecha_vencimiento,
	    (CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END) AS ndiasf
	    ,fra.clasificacion1
	    ,'-1'::CHARACTER VARYING AS extemporaneo
	    ,fra.nit
	    ,ing.max_fec_ing, ding.val_ing
	    ,ing2.max_fec_ing2, ding2.val_ing2, '0099-01-01'::date as fecha_vencimiento_clculada
       FROM con.factura fra
	left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN app_ofertas ofe ON ( ofe.num_os = fra.ref1 )
	    LEFT JOIN app_clientes cc ON ( cc.id_cliente = ofe.id_cliente )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
            LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
            LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
			AND i.dstrct='FINV'
			AND id.documento like 'PM%' 
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
			AND i.dstrct='FINV'
			AND id.documento like 'PM%'  
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	    LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
			AND f.dstrct='FINV'
                        AND f.documento like 'PM%' 
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	    LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
			AND f.dstrct='FINV'
                        AND f.documento like 'PM%'
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
            WHERE
                    fra.dstrct = 'FINV'          
                    AND fra.valor_saldo >0         
		    AND	fra.cmc IN ('CM' ,'PM')
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16' 
                    AND (SUBSTR(fra.documento,1,2) ='PM'  --and /*fra.ref1='INMS02386-11' and */tipo_documento = 'FAC' and fra.documento='PM18732_1' 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A' )
			)
            ORDER BY fecha_vencimiento,documento--8459
            
) tabla
)

UNION ALL
--BLOQUE TRES--
(
SELECT   tipo_ref1
        ,ref1
	,tipo_solicitud
	,tipo_ref2,ref2 ,ident
	,ejecutivo,ciudad,sector,nomcli,codcli
	,COALESCE((string_to_array(padre_cliente,'@'))[1],nomcli) AS nombre_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[2],nit) AS nit_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[3],'') AS cod_padre_cons
	,COALESCE((string_to_array(padre_cliente,'@'))[4],'') AS nics_padre_cons
	,valor_factura,valor_saldo
	,documento,valor_unitario as valor_intereses,cuenta,fecha_factura,fecha_vencimiento,ndiasf,clasificacion1 as fiducia,
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
---------este bloque fue cambiado----------------
((SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario,fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura as fra 
	    left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
           WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                   -- AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','SR','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459
		
) tabla
)) as tbl_ndiasf
---------fin bloque cambiado----------------

where tbl_ndiasf.ref1=tabla.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual ,
	extemporaneo,
	comentario as status		
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,fecha_vencimiento_calculada
FROM (	
SELECT tipo_ref1,fra.ref1
	,ofe.tipo_solicitud AS tipo_solicitud
	,tipo_ref2,ref2 
	,fra.nit as ident
        ,ee.nombre AS ejecutivo,
	(select nomciu from ciudad where codciu=cc.ciudad) AS ciudad,
	cc.sector AS sector
	,ofe.comentario  AS comentario
        ,COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	fra.codcli,	
	fra.valor_factura,                   
	fra.valor_saldo,
	fra.documento,
	fd.valor_unitario,
	(SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	fra.fecha_factura,
        fra.fecha_vencimiento,       
        CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END AS ndiasf  
       ,fra.clasificacion1
       ,'-1'::CHARACTER VARYING AS extemporaneo
       ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select cliente_padre('''||fra.codcli||''','''||id_cliente||''') as salida') AS ct (salida character varying))  AS padre_cliente
       ,fra.nit
       ,ing.max_fec_ing, ding.val_ing
       ,ing2.max_fec_ing2, ding2.val_ing2 
       ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select fecha_vencimiento_calculada('''||fra.ref1||''','''||fra.documento||''') as salida') AS ct (salida character varying))::date AS fecha_vencimiento_calculada

            FROM con.factura fra
	left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN ofertas_view_dblink ofe ON ( ofe.id_solicitud = fra.referencia_1 )
            LEFT JOIN cliente cc ON ( cc.codcli = ofe.id_cliente )
	    LEFT JOIN ejecutivos_view_dblink ee ON ( ee.id_ejecutivo=cc.id_ejecutivo )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND id.documento like 'RM%'
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND id.documento like 'RM%'
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	   LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND f.documento like 'RM%'
                        
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	   LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND f.documento like 'RM%'
                      
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
           WHERE
                    fra.dstrct = 'FINV'       
		    AND fra.valor_saldo > 0         
		    AND	fra.cmc IN ('RF','SR')
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='RM00037_7' 
                    AND SUBSTR(fra.documento,1,2) ='RM'  
				
            ORDER BY fecha_vencimiento,documento
) tabla
)






/**
 * Funcion Modificada
 */


(
SELECT   tipo_ref1
        ,ref1
	,tipo_solicitud
	,tipo_ref2,ref2 ,ident
	,ejecutivo,ciudad,sector,nomcli,codcli
	,COALESCE((string_to_array(padre_cliente,'@'))[1],nomcli) AS nombre_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[2],nit) AS nit_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[3],'') AS cod_padre_cons
	,COALESCE((string_to_array(padre_cliente,'@'))[4],'') AS nics_padre_cons
	,valor_factura,valor_saldo
	,documento,valor_unitario as valor_intereses,cuenta,fecha_factura,fecha_vencimiento,ndiasf,clasificacion1 as fiducia,
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
---------este bloque fue cambiado----------------
((SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario, fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura as fra
            left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                   -- AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','SR','SV','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('PM','RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459
		
) tabla
)) as tbl_ndiasf
---------fin bloque cambiado----------------

where tbl_ndiasf.ref1=tabla2.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual ,
	extemporaneo,
	comentario as status		
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,fecha_vencimiento_calculada
FROM (	
SELECT tipo_ref1,fra.ref1
	,ofe.tipo_solicitud AS tipo_solicitud
	,tipo_ref2,ref2 
	,fra.nit as ident
        ,ee.nombre AS ejecutivo,
	(select nomciu from ciudad where codciu=cc.ciudad) AS ciudad,
	cc.sector AS sector
	,ofe.comentario  AS comentario
        ,COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	fra.codcli,	
	fra.valor_factura,                   
	fra.valor_saldo,
	fra.documento,
	fd.valor_unitario,
        (SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	fra.fecha_factura,
        fra.fecha_vencimiento,       
        CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END AS ndiasf  
	,fra.clasificacion1
	,ofe.esoficial AS extemporaneo	
        ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select cliente_padre('''||fra.codcli||''','''||id_cliente||''') as salida') AS ct (salida character varying))  AS padre_cliente
        ,fra.nit
        ,ing.max_fec_ing
        ,ding.val_ing
        ,ing2.max_fec_ing2
        ,ding2.val_ing2
        ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select fecha_vencimiento_calculada('''||fra.ref1||''','''||fra.documento||''') as salida') AS ct (salida character varying))::date AS fecha_vencimiento_calculada

            FROM con.factura fra
	    left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN ofertas_view_dblink ofe ON ( ofe.id_solicitud = fra.referencia_1 )
            LEFT JOIN cliente cc ON ( cc.codcli = ofe.id_cliente )
	    LEFT JOIN ejecutivos_view_dblink ee ON ( ee.id_ejecutivo=cc.id_ejecutivo )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
            --LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
            --LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND SUBSTR(id.documento,1,2) in ('PM','NM')
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND SUBSTR(id.documento,1,2) in ('PM','NM') 
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	   LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND SUBSTR(f.documento,1,2) in ('PM','NM') 
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	   LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND SUBSTR(f.documento,1,2) in ('PM','NM') 
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
	
           WHERE
                    fra.dstrct = 'FINV'       
                    AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','FP','SR','SV','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) ='PM' 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,documento--8459
		
) tabla2
)

UNION ALL
---BLOQUE DOS---
(
SELECT tipo_ref1,ref1
	,tipo_solicitud
	,tipo_ref2,ref2,ident,ejecutivo,ciudad,sector, nomcli,
	codcli
	, nomcli AS nombre_padre
	, nit AS nit_padre
	, '' AS cod_padre
	, '' AS nics_padre
	,valor_factura, valor_saldo, documento,valor_unitario as valor_intereses,cuenta, fecha_factura, fecha_vencimiento,
	ndiasf,clasificacion1 as fiducia,
		
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
((

/* bloque cambiado */
SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario,fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura fra
            left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))            
           WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                    --AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','FU','DC') --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('PM','RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459

) tabla 
 ))as tbl_ndiasf
where tbl_ndiasf.ref1=tabla.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual

	,extemporaneo
	,comentario AS status
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,
	fecha_vencimiento_clculada
FROM (
SELECT tipo_ref1,fra.ref1
	,'':: CHARACTER  AS tipo_solicitud	
	,tipo_ref2,ref2,   fra.nit as ident
	,cc.ejecutivo_cta AS ejecutivo
	,cc.ciudad AS ciudad
	,cc.sector AS sector
	 
	,ofe.comentario AS comentario,
	    COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	    fra.codcli,
	    fra.valor_factura,
	    fra.valor_saldo,
	    fra.documento,
	fd.valor_unitario,
	    (SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	    fra.fecha_factura,
	    fra.fecha_vencimiento,
	    (CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END) AS ndiasf
	    ,fra.clasificacion1
	    ,'-1'::CHARACTER VARYING AS extemporaneo
	    ,fra.nit
	    ,ing.max_fec_ing, ding.val_ing
	    ,ing2.max_fec_ing2, ding2.val_ing2, '0099-01-01'::date as fecha_vencimiento_clculada
       FROM con.factura fra
	left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN app_ofertas ofe ON ( ofe.num_os = fra.ref1 )
	    LEFT JOIN app_clientes cc ON ( cc.id_cliente = ofe.id_cliente )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
            LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
            LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
			AND i.dstrct='FINV'
			AND id.documento like 'PM%' 
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
			AND i.dstrct='FINV'
			AND id.documento like 'PM%'  
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	    LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
			AND f.dstrct='FINV'
                        AND f.documento like 'PM%' 
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	    LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
			AND f.dstrct='FINV'
                        AND f.documento like 'PM%'
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
            WHERE
                    fra.dstrct = 'FINV'          
                    AND fra.valor_saldo >0         
		    AND	fra.cmc IN ('CM' ,'PM')
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16' 
                    AND (SUBSTR(fra.documento,1,2) ='PM'  --and /*fra.ref1='INMS02386-11' and */tipo_documento = 'FAC' and fra.documento='PM18732_1' 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A' )
			)
            ORDER BY fecha_vencimiento,documento--8459
            
) tabla
)

UNION ALL
--BLOQUE TRES--
(
SELECT   tipo_ref1
        ,ref1
	,tipo_solicitud
	,tipo_ref2,ref2 ,ident
	,ejecutivo,ciudad,sector,nomcli,codcli
	,COALESCE((string_to_array(padre_cliente,'@'))[1],nomcli) AS nombre_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[2],nit) AS nit_padre
	,COALESCE((string_to_array(padre_cliente,'@'))[3],'') AS cod_padre_cons
	,COALESCE((string_to_array(padre_cliente,'@'))[4],'') AS nics_padre_cons
	,valor_factura,valor_saldo
	,documento,valor_unitario as valor_intereses,cuenta,fecha_factura,fecha_vencimiento,ndiasf,clasificacion1 as fiducia,
	(CURRENT_DATE-ndiasf::DATE) AS dias_vencidos,
	CASE WHEN (CURRENT_DATE-ndiasf::DATE)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN (CURRENT_DATE-ndiasf::DATE)>=0 THEN '0 A 30'	     
	     WHEN (CURRENT_DATE-ndiasf::DATE)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango,	
	(select CASE WHEN max(ndiasf)>=361 THEN 'MAYOR A 1 AÑO'
	     WHEN max(ndiasf)>=181 THEN 'ENTRE 180 Y 360'	
	     WHEN max(ndiasf)>=121 THEN 'ENTRE 121 Y 180'
	     WHEN max(ndiasf)>=91 THEN 'ENTRE 91 Y 120'
	     WHEN max(ndiasf)>=61 THEN 'ENTRE 61 Y 90'
	     WHEN max(ndiasf)>=31 THEN 'ENTRE 31 Y 60'
	     WHEN max(ndiasf)>=0 THEN '0 A 30'	     
	     WHEN max(ndiasf)<0 THEN 'CORRIENTE'
	ELSE '0' END AS rango
from
---------este bloque fue cambiado----------------
((SELECT valor_unitario,ref1,ndiasf	
FROM (	
SELECT fd.valor_unitario,fra.ref1,CURRENT_DATE-(CASE WHEN tipo_ref2='SV' THEN 	
		     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			 SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		     END 
		     ELSE
		     SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
		 END)::DATE  AS ndiasf
            FROM con.factura as fra 
	    left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
           WHERE    valor_saldo<>0 and
                    fra.dstrct = 'FINV'       
                   -- AND fra.valor_saldo >0            
		    AND	fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','SR','CV','FU','DC' ) --hcg
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
                    AND (SUBSTR(fra.documento,1,2) in ('RM') 
				OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
			)
            ORDER BY fecha_vencimiento,fra.documento--8459
		
) tabla
)) as tbl_ndiasf
---------fin bloque cambiado----------------

where tbl_ndiasf.ref1=tabla.ref1) as vencimiento_mayor,	
	CURRENT_DATE AS fecha_actual ,
	extemporaneo,
	comentario as status		
	,max_fec_ing, val_ing
	,max_fec_ing2, val_ing2,fecha_vencimiento_calculada
FROM (	
SELECT tipo_ref1,fra.ref1
	,ofe.tipo_solicitud AS tipo_solicitud
	,tipo_ref2,ref2 
	,fra.nit as ident
        ,ee.nombre AS ejecutivo,
	(select nomciu from ciudad where codciu=cc.ciudad) AS ciudad,
	cc.sector AS sector
	,ofe.comentario  AS comentario
        ,COALESCE(get_nombrecliente(fra.codcli), 'NR') AS nomcli, 
	fra.codcli,	
	fra.valor_factura,                   
	fra.valor_saldo,
	fra.documento,
	fd.valor_unitario,
	(SELECT cuenta FROM con.cmc_doc as cmc where cmc.tipodoc=fra.tipo_documento and cmc.cmc= fra.cmc ) as cuenta,
	fra.fecha_factura,
        fra.fecha_vencimiento,       
        CASE WHEN tipo_ref2='SV' THEN 	
		    CASE WHEN SUBSTR(fra.fecha_vencimiento,6,2)='01' THEN
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) ELSE
			SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
		    END 
	    ELSE
		SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
		
	    END AS ndiasf  
       ,fra.clasificacion1
       ,'-1'::CHARACTER VARYING AS extemporaneo
       ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select cliente_padre('''||fra.codcli||''','''||id_cliente||''') as salida') AS ct (salida character varying))  AS padre_cliente
       ,fra.nit
       ,ing.max_fec_ing, ding.val_ing
       ,ing2.max_fec_ing2, ding2.val_ing2 
       ,(select * from dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17','select fecha_vencimiento_calculada('''||fra.ref1||''','''||fra.documento||''') as salida') AS ct (salida character varying))::date AS fecha_vencimiento_calculada

            FROM con.factura fra
	left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
            LEFT JOIN ofertas_view_dblink ofe ON ( ofe.id_solicitud = fra.referencia_1 )
            LEFT JOIN cliente cc ON ( cc.codcli = ofe.id_cliente )
	    LEFT JOIN ejecutivos_view_dblink ee ON ( ee.id_ejecutivo=cc.id_ejecutivo )
            LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
            LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )            
            LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND id.documento like 'RM%'
			GROUP BY id.dstrct,id.tipo_doc,id.documento) ing ON (ing.dstrct = fra.dstrct
					 AND ing.tipo_doc = fra.tipo_documento
					 AND ing.documento = fra.documento)
	    LEFT JOIN (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
			FROM con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND i.dstrct='FINV'
			AND id.documento like 'RM%'
			GROUP BY id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion) ding ON (ding.dstrct = fra.dstrct
					 AND ding.tipo_doc = fra.tipo_documento
					 AND ding.documento = fra.documento
					 AND ding.fecha_consignacion = ing.max_fec_ing)
	   LEFT JOIN (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND f.documento like 'RM%'
                        
			GROUP BY f.ref1) ing2 ON (ing2.ref1=fra.ref1)
	   LEFT JOIN (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
			FROM con.factura f,con.ingreso i,con.ingreso_detalle id
			WHERE i.dstrct = id.dstrct
			AND i.tipo_documento = id.tipo_documento
			AND i.num_ingreso = id.num_ingreso
			AND i.reg_status != 'A'
			AND id.reg_status != 'A'
                        AND id.dstrct = f.dstrct
			AND id.tipo_doc = f.tipo_documento
                        AND id.documento = f.documento
                        AND f.reg_status != 'A'
                        AND f.dstrct='FINV'
                        AND f.documento like 'RM%'
                      
			GROUP BY f.ref1,i.fecha_consignacion) ding2 ON (ding2.ref1=fra.ref1
					 AND ding2.fecha_consignacion = ing2.max_fec_ing2)
           WHERE
                    fra.dstrct = 'FINV'       
		    AND fra.valor_saldo > 0         
		    AND	fra.cmc IN ('RF','SR')
                    AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='RM00037_7' 
                    AND SUBSTR(fra.documento,1,2) ='RM'  
				
            ORDER BY fecha_vencimiento,documento
) tabla
)

UNION ALL 
--BLOQUE CUATRO proyectos especiales--
(
 SELECT * FROM dblink('dbname=selectrik port=5432 host=192.168.100.185 user=postgres password=bdversion17', 'SELECT * FROM Facturas_proyectos_especiales') AS fapres (tipo_ref1 character VARYING,	ref1 text,	tipo_solicitud character VARYING,	tipo_ref2 character VARYING,	ref2 text,	ident character VARYING,	ejecutivo character VARYING,	ciudad character VARYING,	sector character VARYING,	nomcli text,	codcli character VARYING,	nombre_padre text,	nit_padre text,	cod_padre_cons text,	nics_padre_cons text,	valor_factura NUMERIC,  valor_saldo NUMERIC,	documento character VARYING, valor_intereses numeric,cuenta character VARYING,	fecha_factura date, fecha_vencimiento date,	ndiasf text,	fiducia character VARYING,	dias_vencidos NUMERIC, rango text, vencimiento_mayor text, fecha_actual date, extemporaneo character VARYING, status text, max_fec_ing date,	val_ing numeric, max_fec_ing2 date, val_ing2 numeric, fecha_vencimiento_calculada date)
)
