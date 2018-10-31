select dstrct,tipo_documento,documento,valor_saldo, clasificacion1,reg_status,codcli,* from con.factura where documento = 'NM14092_1';
update con.factura set codcli = '' where documento = 'NM14092_1';  FOMS13887-18   NM14240_1

select * from cliente where codcli = 'CL15431' 	nomcli like '%SUPERINT%' nit = '899999007' and  direccion like '%CL 5%' and nomcli like '%SUPERINT%' and nit = '899999007'		'SUPERINT DE NOTARIADO Y REGIST'
--'CL15431' -- '891000627'
Fintra--'CL41039'   -- '891000627'


select sum(valor_unitario) from con.factura_detalle where documento = 'NM14092_1';

select
      a.*,
      b.nomcli
    from
       (select 
	  a.ref1 as fom ,
	  substr(a.documento,1,7) as documento_maestro,
	  (substr(a.documento,9,3)::integer ) as cuota_primera,
	  0 as cuota_ultima,
	  (a.referencia_1) as solicitud,
	  (a.nit) as nit,
	  (a.codcli) as codcli,
	  (a.fecha_factura) as fecha_factura,
	  (a.valor_saldo) as valor_saldo
	from
	 con.factura a
	where
	 a.dstrct = 'FINV' and 
	 a.tipo_documento = 'FAC' and 
	 a.documento like 'NM%' and
	 a.valor_saldo > 0 and
	 a.clasificacion1 = '' and
	 a.reg_status != 'A' 
	group by
	 1,2,3,4,5,6,7,8,9,documento
	order by
	 a.ref1,
	 substr(a.documento,1,7),
	 substr(a.documento,9,3)::integer ) a,
       cliente b
     where
	 a.codcli = b.codcli
     order by
       a.fom      


--Query para Insertar los usuarios de selectrik en fintra
insert into cliente (
			estado, codcli, nomcli, notas, agduenia, base, texto_oc, nit, cedagente, rentabilidad, soportes_fac, fiduciaria, dstrct, moneda,
			forma_pago,plazo, zona, branch_code, bank_account_no, cmc, unidad, codigo_impuesto, agfacturacion, reg_status, creation_date,
			direccion, telefono, nomContacto, telContacto, email_Contacto, dir_Factura, ma_PreFactura, tiempoprefac, tiempo_leg, tiempo_Re_fact,
			diaPago, for_facturacion, direccion_contacto, agencia_cobro, hc, rif, ciudad, ciudad_factura, pais, pais_envio, creation_user
			)
SELECT t.*
FROM dblink('dbname=selectrik port=5432',
            'SELECT estado, codcli, nomcli, notas, agduenia, base, texto_oc, nit, cedagente, rentabilidad, soportes_fac, fiduciaria, dstrct, moneda,
			forma_pago,plazo, zona, branch_code, bank_account_no, cmc, unidad, codigo_impuesto, agfacturacion, reg_status, now(),
			direccion, telefono, nomContacto, telContacto, email_Contacto, dir_Factura, ma_PreFactura, tiempoprefac, tiempo_leg, tiempo_Re_fact,
			diaPago, for_facturacion, direccion_contacto, agencia_cobro, hc, rif, ciudad, ciudad_factura, pais, pais_envio, ''MCASTILLO'' FROM cliente WHERE codcli ilike ''CS%'' ' )
    AS t(estado varchar, codcli varchar, nomcli varchar, notas varchar, agduenia varchar, base varchar, texto_oc varchar, nit varchar,cedagente varchar, rentabilidad numeric, soportes_fac varchar, fiduciaria varchar, dstrct varchar, moneda varchar,
			forma_pago varchar,plazo numeric, zona varchar, branch_code varchar, bank_account_no varchar, cmc varchar, unidad varchar, codigo_impuesto varchar, agfacturacion varchar, reg_status varchar, creation_date date,
			direccion varchar, telefono varchar, nomContacto varchar, telContacto varchar, email_Contacto varchar, dir_Factura varchar, ma_PreFactura varchar, tiempoprefac varchar, tiempo_leg varchar, tiempo_Re_fact varchar,
			diaPago varchar, for_facturacion varchar, direccion_contacto varchar, agencia_cobro varchar, hc varchar, rif varchar, ciudad varchar, ciudad_factura varchar, pais varchar, pais_envio varchar, creation_user varchar) 
LEFT JOIN cliente c ON t.codcli = c.codcli
where c.codcli is null