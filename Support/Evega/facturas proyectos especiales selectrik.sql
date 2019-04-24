
--DROP VIEW Facturas_proyectos_especiales;
--CREATE VIEW Facturas_proyectos_especiales AS
SELECT   tipo_ref1
        ,ref1
		,tipo_solicitud
		,tipo_ref2,
		ref2 
		,ident
		,ejecutivo,
		ciudad,
		sector,
		nomcli,
		codcli
		,COALESCE((string_to_array(padre_cliente,'@'))[1],nomcli) AS nombre_padre
		,COALESCE((string_to_array(padre_cliente,'@'))[2],nit) AS nit_padre
		,COALESCE((string_to_array(padre_cliente,'@'))[3],'') AS cod_padre_cons
		,COALESCE((string_to_array(padre_cliente,'@'))[4],'') AS nics_padre_cons
		,valor_factura
		,valor_saldo
		,documento
		,valor_unitario as valor_intereses
		,cuenta
		,fecha_factura
		,fecha_vencimiento
		,ndiasf
		,clasificacion1 as fiducia,
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
		((SELECT ref1,ndiasf	
		  FROM (	
				SELECT fra.ref1,
				      CURRENT_DATE - (CASE WHEN tipo_ref2='SV' THEN 	
				     CASE WHEN SUBSTR(fecha_vencimiento,6,2)='01' THEN
					 	SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) 
					 ELSE
					 	SUBSTR(CAST(SUBSTR((fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
				     END 
				     ELSE
				     	SUBSTR((fecha_vencimiento + interval'10 days' ) ,1,10)
				 	 END)::DATE  AS ndiasf
		        FROM con.factura as fra            
		        WHERE    valor_saldo<>0 
		             and fra.dstrct = 'FINV'       
		                   -- AND fra.valor_saldo >0            
				     AND fra.cmc IN ('OV','OP','FM','CM' ,'PM' ,'FP','RF','SR','SV','CV','FU' )
		             AND fra.reg_status != 'A' AND tipo_ref2='SV' --and fra.documento='PM38312_16'
		                    AND (SUBSTR(fra.documento,1,2) in ('PM','RM') 
						OR NOT EXISTS(SELECT ff.documento FROM con.factura ff WHERE ff.documento=REPLACE(fra.documento,'N','P') and ff.reg_status!='A')
					)
		            ORDER BY fecha_vencimiento,documento--8459
			   	
		       ) tabla
		)) as tbl_ndiasf
		where tbl_ndiasf.ref1 = tabla2.ref1
		)as vencimiento_mayor,	
		CURRENT_DATE AS fecha_actual ,
		extemporaneo,
		comentario as status		
		,max_fec_ing
		, val_ing
		,max_fec_ing2
		, val_ing2
		,fecha_vencimiento_calculada
FROM (	
		SELECT tipo_ref1
			   ,fra.ref1
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
						SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '28' AS TIMESTAMP),1,10) 
				   ELSE
						SUBSTR(CAST(SUBSTR((fra.fecha_vencimiento+INTERVAL'1 month') ,1,8) || '30' AS TIMESTAMP),1,10)				
				   END 
			   ELSE
					SUBSTR((fra.fecha_vencimiento + interval'10 days' ) ,1,10)
				
			   END AS ndiasf  
			   ,fra.clasificacion1
			   ,ofe.esoficial AS extemporaneo
			   ,(SELECT c2.nomcli || '@' || c2.nit || '@' || id_cliente || '@' || 
				       (SELECT array_to_string(array_accum(n2.nic),' ; ') FROM OPAV.clientes_eca_nics n2 WHERE n2.id_cliente=c2.codcli AND n2.reg_status!='A' )
				 FROM cliente c2 
				 WHERE c2.codcli =(SELECT s2.id_cliente_padre  
								   FROM opav.subclientes_eca s2
								   WHERE     s2.id_subcliente=fra.codcli and s2.reg_status!='A')
			    ) AS padre_cliente
                ,fra.nit
                ,ing.max_fec_ing
                , ding.val_ing
		        ,ing2.max_fec_ing2
		        ,ding2.val_ing2
		        ,((select s.fecha_inicio_pago from opav.subclientes_ofertas s inner join opav.ofertas o on
		          (o.id_solicitud= s.id_solicitud) where o.num_os=fra.ref1 limit 1)::date + ((split_part(fra.documento,'_',2)::numeric -1)::text || ' month')::interval )::date 
		        as fecha_vencimiento_calculada
	    FROM con.factura fra
	    left join con.factura_detalle fd on (fd.documento= fra.documento and fd.concepto in ('088','227'))
	    LEFT JOIN opav.ofertas ofe ON ( ofe.id_solicitud = fra.referencia_1 )
	    LEFT JOIN cliente cc ON ( cc.codcli = ofe.id_cliente )
	    LEFT JOIN opav.ejecutivos ee ON ( ee.id_ejecutivo=cc.id_ejecutivo )
	    LEFT JOIN cliente cli ON ( cli.codcli = fra.codcli )
	    LEFT JOIN cia ON ( cia.dstrct = fra.dstrct )
	    --LEFT JOIN negocios ON (negocios.cod_neg=fra.negasoc)
	    --LEFT JOIN proveedor ON (negocios.nit_tercero=proveedor.nit)            
	    LEFT JOIN  (SELECT id.dstrct,id.tipo_doc,id.documento,max(i.fecha_consignacion) AS max_fec_ing 
					FROM con.ingreso i, con.ingreso_detalle id
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
	    LEFT JOIN  (SELECT id.dstrct,id.tipo_doc,id.documento,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing
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
	   LEFT JOIN   (SELECT f.ref1,max(i.fecha_consignacion) AS max_fec_ing2
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
	   LEFT JOIN   (SELECT f.ref1,i.fecha_consignacion,SUM(id.valor_ingreso) AS val_ing2
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
	            AND	fra.cmc IN ('OV','OP','FM','FP','SR','SV','CV','FU' )
	            AND fra.reg_status != 'A' 
	            AND tipo_ref2='SV' --and fra.documento='PM38312_16'
	            AND (SUBSTR(fra.documento,1,2) ='PM' OR NOT EXISTS(SELECT ff.documento 
					 FROM con.factura ff 
					 WHERE ff.documento = REPLACE(fra.documento,'N','P') 
					   and ff.reg_status!='A')
					)
				AND fra.referencia_1 IN (SELECT id_solicitud FROM opav.ofertas WHERE tipo_proyecto IN ('TPR00006','TPR00008'))
		        ORDER BY fecha_vencimiento,documento--8459
				
	  ) tabla2;


--select * from Facturas_proyectos_especiales;
