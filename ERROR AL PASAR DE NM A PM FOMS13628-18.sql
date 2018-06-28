select dstrct,tipo_documento,documento,valor_saldo, clasificacion1,reg_status,codcli,* from con.factura where documento = 'NM13988_1';

select * from cliente where codcli ilike '%CS32564%' 	nomcli like '%SUPERINT%' nit = '899999007' and  direccion like '%CL 5%' and nomcli like '%SUPERINT%' and nit = '899999007'		'SUPERINT DE NOTARIADO Y REGIST'

select * from nit where cedula = '899999007'


select sum(valor_unitario) from con.factura_detalle where documento = 'NM13988_1';

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
