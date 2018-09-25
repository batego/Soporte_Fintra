--create table tem.cm_Abril2018 as
select * from con.comprodet 
--update con.comprodet set cuenta = '16252160'
where numdoc in (select cod from ing_fenalco where codneg in (select negocio from administrativo.control_endosofiducia group by negocio) and periodo = '201804') 
and valor_credito != 0 and tipodoc = 'CM' and cuenta != '16252160'

--select * from tem.cm_Abril2018
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--select * from tem.marzo2018_1

--create table tem.marzo2018_1 as
select * from con.comprodet 
--update con.comprodet set cuenta = '16252160'
where numdoc in (
	select cod from ing_fenalco where codneg in (
		select lopez.relacionado from (
			select
				documento as factura,
				fra.nit AS nit_cliente,
				get_nombc(fra.nit) AS nombre_cliente,
				CASE when reg_status='A' then 'Anulada' else CASE WHEN valor_saldo=0 THEN 'Cancelada' ELSE 'Pendiente' END END as estado,
				CASE WHEN tipo_ref1='MS' THEN 'MULTISERVICIO' ELSE 'CREDITO' END AS tipo_cartera,
				CASE WHEN tipo_ref1='MS' THEN ref1 ELSE negasoc END AS relacionado,
				fecha_factura,
				fecha_vencimiento,
				valor_factura,
				valor_saldo,
				(select con.nombre from negocios n inner join convenios con on con.id_convenio=n.id_convenio where cod_neg = negasoc) as convenio,
				(select sum(fd.valor_unitario)
			from con.factura  f 
			inner join con.factura_detalle fd on ( fd.dstrct=f.dstrct and fd.tipo_documento=f.tipo_documento  and fd.documento = f.documento ) 
			where fd.concepto = '227' and substring(f.documento,1,2) in ('PM','RM') and f.documento=fra.documento) as Intereses
			from con.factura fra
			where fecha_vencimiento::date between '2018-04-01'::date and '2018-04-30'::date
			and cmc = 'CL'
		) lopez
	)	
)
and periodo = '201804' and valor_credito != 0 and tipodoc = 'CM' and cuenta != '16252160' 





