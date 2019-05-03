SELECT
                f.dstrct,
                f.tipo_documento,
                f.codcli,
                f.nit,
                get_nombrecliente( f.codcli ) AS nombre_cliente,
                f.reg_status,
                f.documento,
                f.valor_facturame AS valor_factura,
                f.valor_abonome AS valor_abono,
                f.valor_saldome AS valor_saldo,
                f.moneda,	
                f.fecha_factura,
                f.fecha_vencimiento,
                f.fecha_ultimo_pago,
                f.descripcion,
                f.creation_user,
                TO_CHAR ( f.fecha_impresion, 'YYYY-MM-DD HH24:MI') AS fecha_impresion,
                TO_CHAR ( f.fecha_anulacion, 'YYYY-MM-DD HH24:MI') AS fecha_anulacion,
                TO_CHAR ( f.fecha_contabilizacion, 'YYYY-MM-DD HH24:MI') AS fecha_contabilizacion,
                f.transaccion, 
                array_to_string( array_accum( det.numero_remesa ), ', ' ) AS ots,
                -- AMATURANA 28.03.2007
                usuario_anulo,
                get_tel(f.codcli) AS tel,
		        get_dir(f.codcli) AS dir 
                ,f.negasoc                           
            FROM con.factura f 
            LEFT JOIN con.factura_detalle det ON ( det.dstrct = f.dstrct AND det.tipo_documento = f.tipo_documento AND det.documento = f.documento  )
            WHERE f.descripcion like '%NUMERO OS:%FOMS13626-%'  AND f.reg_status!='A'                 
            GROUP BY 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,22,f.negasoc
            ORDER BY f.fecha_factura ASC;
            
      --NM14561_1
           
           SELECT * FROM opav.ofertas WHERE num_os = 'FOMS13626-18';
           select * from opav.acciones where id_solicitud = '926371' id_accion = '9046136';
          
          
          select  factura_cliente,* from opav.subclientes_ofertas 
			--update opav.subclientes_ofertas set factura_cliente = ''
		  where id_solicitud in('926371');
		
		
		CREATE TABLE TEM.NM14561_1 AS; 
		select * from con.factura_detalle where  referencia_1 ='9046136';--860013704
		select * from con.factura WHERE  documento ='NM14561_1';--NM14561_1 ref1 ='FOMS13626-18'
		
		select * from con.comprobante where numdoc='NM14561_1';
	
		create table tem.NM14561_1_det_compr AS;
	    select * from con.comprodet where numdoc='NM14561_1' AND referencia_1 = '9046136';
		
           