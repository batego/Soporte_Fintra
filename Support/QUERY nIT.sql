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
INNER JOIN nit c ON (a.nit = c.cedula)
WHERE a.codcli='CL16886' and a.reg_status='';

-- Consulta SQL_GET_CLIENTE -- Buscar cliente de electricaribe
SELECT  a.*, (select nombre from opav.ejecutivos c where c.id_ejecutivo=a.id_ejecutivo) as nombre_ejecutivo
FROM    cliente a
WHERE a.codcli=? and a.reg_status='';