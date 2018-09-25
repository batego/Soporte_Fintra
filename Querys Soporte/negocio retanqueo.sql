---nro_docs::numeric*.70 as cumple_cuotas
--- CONSULTA PARA VERIFICAR EL ESTADO DE UN CLIENTE: POR ESTADO DE NEGOCIOS, CUOTAS, ETC. SI RETORNA TRUE SI CUMPLE CON LOS PARAMETROS.
select a.*, capital >= vr_negocio*.70 as cumple_valor, (nro_docs::integer - docpagos::integer) <= 3 as cumple_cuotas from (
SELECT 
	 round(ng.vr_negocio) as vr_negocio,
	 ng.nro_docs,
	 fac.negasoc,
	 round(SUM(fac.valor_factura-(SELECT seguro FROM documentos_neg_aceptado  where cod_neg=fac.negasoc limit 1))) as capital,
	 (SELECT case when  ( now() :: date  > min(fecha_vencimiento) :: date  ) then 'N' else 'S' end as aldia
		FROM con.factura as f where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.fecha_ultimo_pago ='0099-01-01' AND f.reg_status !='A' ) as aldia,
	 (Select case when MAX(f.fecha_vencimiento) is null then now()::date else MAX(f.fecha_vencimiento) end FROM con.factura as f 
	 where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.valor_saldo > 0) as fecha_pc,
	 count(0) as docPagos
                 

            FROM con.factura as fac 
            INNER JOIN negocios as ng on (ng.cod_neg=negasoc)
            WHERE
                 negasoc = (SELECT sa.cod_neg FROM solicitud_persona AS sp  
                 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
                 WHERE sp.identificacion='51843710' and sa.id_convenio in ('10','11','12','13') and sa.estado_sol in ('T') and sp.tipo='S'
                 and sp.creation_date = (SELECT max(creation_date) FROM solicitud_persona where identificacion=sp.identificacion AND reg_status!='A' )
                 group by sa.cod_neg) and fac.documento like 'MC%' AND fac.fecha_ultimo_pago !='0099-01-01' AND  fac.valor_saldo = 0 AND fac.reg_status !='A'

            GROUP BY 
                 ng.vr_negocio,
                 ng.nro_docs,
                 fac.negasoc
) a 

(SELECT max(creation_date) FROM solicitud_persona where identificacion='51843710' AND reg_status!='A' )

select creation_date, numero_solicitud FROM solicitud_persona where identificacion=8532181
((SELECT sum(valor_abono) FROM con.factura  where negasoc='MC05580' and documento ilike 'MC%')-((SELECT sum(valor_abono) FROM con.factura  where negasoc='MC06429' and documento ilike 'MC%')))
select * from con.factura where negasoc = 'MC05580' and documento ilike 'MC%' order by fecha_vencimiento
select * from negocios where cod_neg= 'MC05580'
select * from solicitud_aval where cod_neg= 'MC05580'
select * from solicitud_persona where numero_solicitud= '59944'
SELECT seguro FROM documentos_neg_aceptado  where cod_neg= 'MC05580'

-- CONSULTA ESTADO DE NEGOCIOS POR IDENTIFICACION -------------

--se consulta los negocios de x identificacion 

select sp.reg_status, sp.numero_solicitud, sp.creation_date, tipo, nombre, sa.cod_neg, estado_sol, estado_neg
from solicitud_persona sp
inner join solicitud_aval sa ON sa.numero_solicitud = sp.numero_solicitud
left join negocios neg ON neg.cod_neg = sa.cod_neg
--update solicitud_persona set reg_status='A'
where identificacion='1129515622'and numero_solicitud in (89805,107774)

select * from negocios
--update negocios set estado_neg = 'D'
where cod_neg = 'MC11274'

update solicitud_aval set estado_sol = 'R' WHERE numero_solicitud in (97633)
--update solicitud_aval set estado_sol='R'
where  numero_solicitud in (97900)

select * from solicitud_aval where numero_solicitud = 97633
Select *--case when MAX(f.fecha_vencimiento) is null then now()::date else MAX(f.fecha_vencimiento) end 
FROM con.factura as f 
where f.negasoc IN ('MC07919') and f.documento like 'MC%' AND f.valor_saldo > 0

SELECT *--case when  ( now() :: date  > min(fecha_vencimiento) :: date  ) then 'N' else 'S' end as aldia
		FROM con.factura as f where f.negasoc='MC04606' and f.documento like 'MC%' AND f.fecha_ultimo_pago ='0099-01-01' AND f.reg_status !='A' 




		---------------------ORIGINAL RETANQUEO
		 <statement name="SQL_VERIFICA_RENOVACION" db="fintra">
        <desc>
           Verificar Renovacion
        </desc>
        <sql>

            SELECT 
                 round(ng.vr_negocio) as vr_negocio,
                 ng.nro_docs,
                 fac.negasoc,
                 round(SUM(fac.valor_factura-(SELECT seguro FROM documentos_neg_aceptado  where cod_neg=fac.negasoc limit 1))) as capital,
                 (SELECT case when  ( now() :: date  > min(fecha_vencimiento) :: date  ) then 'N' else 'S' end as aldia
            FROM con.factura as f where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.fecha_ultimo_pago ='0099-01-01' AND f.reg_status !='A' ) as aldia,
                 (Select case when MAX(f.fecha_vencimiento) is null then now()::date else MAX(f.fecha_vencimiento) end FROM con.factura as f 
                 where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.valor_saldo > 0) as fecha_pc,
                 count(0) as docPagos 

            FROM con.factura as fac 
            INNER JOIN negocios as ng on (ng.cod_neg=negasoc)
            WHERE
                 negasoc = (SELECT sa.cod_neg FROM solicitud_persona AS sp  
                 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
                 WHERE sp.identificacion='32652830' and sa.id_convenio in ('10','11','12','13') and sa.estado_sol in ('T') and sp.tipo='S'
                 and sp.creation_date = (SELECT max(creation_date) FROM solicitud_persona where identificacion=sp.identificacion AND reg_status!='A')
                 group by sa.cod_neg) and fac.documento like 'MC%' AND fac.fecha_ultimo_pago !='0099-01-01' AND  fac.valor_saldo = 0 AND fac.reg_status !='A'

            GROUP BY 
                 ng.vr_negocio,
                 ng.nro_docs,
                 fac.negasoc
        </sql>
    </statement>



    ------MODIFICADO
SELECT case when
     ((nro_docs <= 14) and (docpagos >= nro_docs::numeric*.70)) || (((nro_docs-docpagos) <= 4) and (nro_docs >= 15)) then 'cumple' else 'no' end
     from
    (SELECT 
                 round(ng.vr_negocio) as vr_negocio,min(fecha_vencimiento), cod_cli,
                 ng.nro_docs,
                 fac.negasoc,
                 round(SUM(fac.valor_factura-(SELECT seguro FROM documentos_neg_aceptado  where cod_neg=fac.negasoc limit 1))) as capital,
                 (SELECT case when  ( now() :: date  > min(fecha_vencimiento) :: date  ) then 'N' else 'S' end as aldia                 
            FROM con.factura as f where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.fecha_ultimo_pago ='0099-01-01' AND f.reg_status !='A' ) as aldia,
                 (Select case when MAX(f.fecha_vencimiento) is null then now()::date else MAX(f.fecha_vencimiento) end FROM con.factura as f 
                 where f.negasoc=fac.negasoc and f.documento like 'MC%' AND f.valor_saldo > 0) as fecha_pc,
                 count(0) as docPagos
            FROM con.factura as fac 
            INNER JOIN negocios as ng on (ng.cod_neg=negasoc)
            WHERE
                 negasoc = (SELECT sa.cod_neg FROM solicitud_persona AS sp  
			 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
			 WHERE sp.identificacion=ng.cod_cli and sa.id_convenio in ('10','11','12','13','43','46','47','48','49','52','54','55') and sa.estado_sol in ('T') and sp.tipo='S'
			and sp.creation_date = (SELECT max(creation_date) FROM solicitud_persona where identificacion=sp.identificacion AND reg_status!='A' )
			group by sa.cod_neg) AND ng.cod_cli ='72341863'
		AND fac.documento like 'MC%'  AND  fac.valor_saldo = 0  AND fac.fecha_ultimo_pago !='0099-01-01' AND fac.reg_status !='A'
		AND (select count(0) from negocios n 
			inner join solicitud_aval sa on sa.cod_neg=n.cod_neg
			inner join solicitud_persona sp2 on sp2.numero_solicitud=sa.numero_solicitud
			where sp2.tipo='C' and sp2.identificacion =ng.cod_cli  and n.estado_neg = 'T' AND sp2.reg_status!='A' 
			and (select sum(valor_saldo) from con.factura where negasoc = sa.cod_neg and fecha_vencimiento < now()) != 0) <= 1 
                AND (select count(0) from con.factura where negasoc in 
			(select cod_neg from solicitud_aval where numero_solicitud in (select numero_solicitud from solicitud_persona where identificacion=ng.cod_cli and tipo='C' and reg_status!='A'))
			and valor_saldo !=0 and fecha_vencimiento < now()) = 0 
            GROUP BY 
                 ng.vr_negocio,
                 ng.nro_docs,
                 fac.negasoc,
                 ng.cod_cli) a


select * from con.factura where negasoc = 'MC07975' and num_doc_fen in (11,12)  order by documento

---VALIDACION CUANDO EL ULTIMO NEGOCIO ESTE RECHAZADO. DEBE BUSCAR EL ULTIMO TRANSFERIDO
                 SELECT max(sp.creation_date) FROM solicitud_persona  sp
                 inner join solicitud_aval sa on sa.numero_solicitud=sp.numero_solicitud
                 where identificacion='72341863' and estado_sol = 'T' AND sp.reg_status!='A'  
select * from solicitud_aval 
--update solicitud_aval set reg_Status = ''
where cod_neg= 'MC11295'
numero_solicitud = 116778
select * from solicitud_persona 
--update solicitud_persona set reg_Status = 'A'
where identificacion = '72341863' AND reg_Status = '' AND numero_solicitud =78055

select * from solicitud_aval where numero_solicitud in (78055,53398)

'MC04999'
'MC07003'


select * from administrativo.preaprobados_fintra_credit  where cedula_deudor = '72341863'
select count(0) from con.factura where negasoc in 
			(select cod_neg from solicitud_aval where numero_solicitud in (select numero_solicitud from solicitud_persona where identificacion='72341863' and tipo='C' and reg_status!='A'))
			and valor_saldo !=0 and fecha_vencimiento < now()


select count(0) from negocios n 
			inner join solicitud_aval sa on sa.cod_neg=n.cod_neg
			inner join solicitud_persona sp2 on sp2.numero_solicitud=sa.numero_solicitud
			where sp2.tipo='C' and sp2.identificacion ='72341863'  and n.estado_neg = 'T' AND sp2.reg_status!='A' 
			and (select sum(valor_saldo) from con.factura where negasoc = sa.cod_neg and fecha_vencimiento < now()) != 0


SELECT sa.cod_neg FROM solicitud_persona AS sp  
			 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
			 WHERE sp.identificacion='72341863' and sa.id_convenio in ('10','11','12','13') --and sa.estado_sol in ('T') and sp.tipo='S'
			and sp.creation_date = (SELECT max(creation_date) FROM solicitud_persona where identificacion='72341863' AND reg_status!='A' )
			group by sa.cod_neg

SELECT sa.cod_neg FROM solicitud_persona AS sp  
                 INNER JOIN  solicitud_aval AS sa on (sa.numero_solicitud=sp.numero_solicitud)
                 WHERE sp.identificacion='72341863' and sa.id_convenio in ('10','11','12','13') and sa.estado_sol in ('T') and sp.tipo='S'
                 and sp.creation_date = (SELECT max(creation_date) FROM solicitud_persona where identificacion='72341863' AND reg_status!='A' and tipo='S')
                 group by sa.cod_neg

select * from negocios where nro_docs::integer <6 and id_convenio in ('10','11','12','13','43','46','47','48',)
select * from convenios order by id_convenio 
cod_neg = 'MC07947'
			select valor_saldo from con.factura where negasoc = 'MC07751' and fecha_vencimiento < now()