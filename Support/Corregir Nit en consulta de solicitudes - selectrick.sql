SELECT * FROM cliente WHERE nit = '890104259-7'; --AND codcli = 'CL17161';			--8909000825
SELECT * FROM nit WHERE cedula = '8909000825';

SELECT * FROM con.factura WHERE nit ilike '%89010425%';
SELECT * FROM con.factura_detalle WHERE nit ilike '89010425%';
SELECT * FROM con.comprobante WHERE tercero ilike '89010425%';
SELECT tercero,* FROM con.comprodet WHERE tercero ilike '89010425%';
           
   
SELECT a.estado, a.codcli, a.nomcli, a.notas, 
	   a.agduenia, a.reg_status, a.creation_date, a.last_update, 
	   a.base, a.texto_oc, 
	   CASE WHEN c.tipo_iden = 'NIT' THEN
	   			 CASE WHEN POSITION('-' IN a.nit) != 0 then	
				 	  	   substring(a.nit, 1,POSITION('-' in a.nit)-1)
				 	  ELSE
	   			 		   substring(a.nit, 1,9)
	   			 END
			ELSE
				 a.nit
	   END AS nit,
	   a.cedagente, a.rentabilidad, 
	   a.soportes_fac, a.fiduciaria, a.dstrct, a.moneda, a.forma_pago, 
	   a.plazo, a.zona, a.branch_code, a.bank_account_no, 
	   a.cmc, a.unidad, a.codigo_impuesto, a.agfacturacion, a.direccion, 
	   a.telefono, a.nomcontacto, a.telcontacto, a.email_contacto, 
	   a.dir_factura, a.ma_prefactura, a.tiempoprefac, a.tiempo_leg, 
	   a.tiempo_re_fact, a.diapago, a.for_facturacion, a.direccion_contacto, 
	   a.agencia_cobro, a.sec_standard, a.hc, a.rif, a.ciudad, 
	   a.ciudad_factura, a.pais, a.pais_envio, a.agimpresion, 
	   a.demora_exp, a.demora_imp, a.tipo_id, a.dapp, 
	   a.nit_enviado_fiducia, a.estado_gestion_cartera, a.nit_fiducia_actualizado, a.cargo_contacto, 
	   a.cliente_eca, a.id_ejecutivo, a.esoficial, a.tipo, 
	   a.nombre_representante, a.tel_representante, a.celular_representante, a.sector,
	   a.creation_user, a.user_update, a.cel_contacto, a.edificio, 
	   a.tipo_cliente, 
	   CASE WHEN c.tipo_iden = 'NIT' THEN
	        	 CASE WHEN POSITION('-' IN a.nit) != 0 AND a.digito_verificacion = '' THEN	
	        	 		   substring(a.nit, POSITION('-' in a.nit)+1, LENGTH(a.nit))
	        	 	  ELSE
	   			 		   a.digito_verificacion
	   			 END
	        ELSE 
	        a.digito_verificacion
	   END AS digito_verificacion,
	   a.email_representante, a.clasificacion, a.cedula_representante,
	   (select nombre from opav.ejecutivos c where c.id_ejecutivo=a.id_ejecutivo) as nombre_ejecutivo
FROM    cliente a
LEFT JOIN nit c ON (a.nit = c.cedula)
WHERE a.codcli='CL07503' and a.reg_status=''; --CL17161


SELECT CASE WHEN 'NIT' = 'NIT' THEN
	   			CASE WHEN POSITION('-' IN '0091213-1') != 0 THEN 
	   				substring('0091213-1', 1,POSITION('-' in '0091213-1')-1)
	   		ELSE
	   			'ok'
	   		END
	   	END;
	  
	   
SELECT * FROM CLIENTE WHERE codcli = 'CL09951'; --ILIKE '%-%';  --860091213-1
--SELECT * FROM CLIENTE WHERE digito_verificacion = '' LIMIT 100;

SELECT * FROM opav.subclientes_eca LIMIT 1;
            
      