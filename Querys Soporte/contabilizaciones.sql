select * 
from fin.orden_servicio 
where tipo_operacion = 'AEF' 
and replace(substring(creation_date,1,7),'-','')::numeric > 201406
limit 100

select * from egreso where document_no = 'TR184629_4'
select * from fin.cxp_doc where documento = '7186465'

----------------------------- Contabilizacion CXP --------------------------

SELECT get_nombp('900320000')
('5353511','900011832','802003363')
'40276147','79417227','52205923','80541955','1121825661','23274245'
select get_nombp('8901049641')
SELECT  payment_name,*
  FROM proveedor
  WHERE nit ilike '79694771';
'71376119'
insert into proveedor (nit, payment_name)
SELECT  cedula, nombre ,*
  FROM nit
  WHERE cedula ilike '79694771';
'900466202'
'15423415'

update nit set cedula = '890801339' where cedula = '8908013398'

SELECT
    facturas.*, 
    cmc.sigla_comprobante,   
    cmc.cuenta,
    cmc.dbcr,
    get_nombp(facturas.tercero) as proveedor,
    facturas.tercero as nitter,
     ctas.nombre_largo as descrip
FROM (
   SELECT
	  a.dstrct,
	  a.tipo_documento       as tipo_doc,
	  a.proveedor            as tercero,
	  a.documento            as numdoc,
	  a.base,
	  a.handle_code          as  hc,
	  a.moneda ,
	  a.fecha_documento
    FROM      fin.cxp_doc        a
    WHERE     a.dstrct                      = 'FINV'
       AND    a.fecha_documento             <= now()::Date
       AND    a.fecha_contabilizacion       = '0099-01-01 00:00:00'
       AND    a.reg_status                  = ''
) facturas
LEFT JOIN  con.tipo_docto  tdoc ON (  tdoc.dstrct =  facturas.dstrct AND tdoc.codigo_interno  =  facturas.tipo_doc )
LEFT JOIN  con.cmc_doc     cmc  ON (  cmc.dstrct = tdoc.dstrct AND cmc.tipodoc = tdoc.codigo AND cmc.cmc = facturas.hc )
LEFT JOIN  con.cuentas	   ctas	ON ( cmc.cuenta=ctas.cuenta ) --where fecha_documento = '2017-05-03'
where facturas.tercero in ('7645132')

select * from con.cmc_doc where cmc in ('OP','FI')
select * from con.cuentas where cuenta = '13301503'
select handle_code from fin.cxp_doc where
--update fin.cxp_doc set handle_code = 'OT' where
 documento in ('41791599934')

 select * from fin.cxp_items_doc  
 --update fin.cxp_items_doc set codigo_cuenta ='G010120065174' 
 where documento = 'TP00010' and codigo_cuenta = ''
 select * from fin.cxp_items_doc  where documento ilike 'TP%'
select * from fin.cxp_items_doc where descripcion ilike 'DESCUENTO ESTUDIO DE CREDITO%'
'9004976282','16457950','19490872','71756546'

------- detalle impuesto ----
SELECT  cod_cuenta_contable
                FROM    tipo_de_impuesto
                WHERE
                        dstrct            =  ?
                  AND   codigo_impuesto   =  ?                  
                  
                  AND   reg_status        = ''                
                  AND   fecha_vigencia    =  ? || '-12-31'  and   descripcion not like '%CONSORCIO'       
                  AND   (      tipo_impuesto  != 'RICA'  
                          OR ( tipo_impuesto   = 'RICA' AND  agencia =  ? )
                        )
                        
               LIMIT 1

select * from con.cuentas where cuenta = '13809505'
select * from con.cmc_doc where cmc ='AT'
---------------------- Contabilizacion Egresos ---------------------
SELECT	e.document_no,
	e.branch_code,
	e.bank_account_no,
	e.vlr,
	e.currency,
	e.fecha_contabilizacion,
	e.nit,
	e.base,
	b.codigo_cuenta,
	e.comision,
	e.cuatroxmil,
	payment_name, e.creation_date
from	egreso e
	left join banco b on (b.branch_code=e.branch_code and b.bank_account_no=e.bank_account_no)
where 	to_char(e.creation_date,'YYYY-MM-DD') <= to_date(now(),'YYYY-MM-DD')
	and e.fecha_contabilizacion='0099-01-01 00:00:00'
	and e.contabilizable!='N'
	--and e.nit in (?)
	--and payment_name = ''
order by e.document_no

 2.8057275E7
 2.80572746E7
update egreso set contabilizable = 'N' where document_no = 'BC2384'


select * from egreso 
--update egreso set payment_name='MAURICIO NIETO AVILA'
where document_no = 'TR204148_2'
select * from egresodet   where document_no = 'TR204012_6'
select * from proveedor 
--update proveedor set payment_name='MAURICIO NIETO AVILA'
where nit = '79694771'

---------------------------egreso detalle --------------

select * from con.cmc_doc where cmc = 'RI'

SELECT      eg.periodo,
	    e.cuenta,
	    e.auxiliar,
	    e.document_no,
	    e.branch_code,
	    e.bank_account_no,
	    e.vlr AS vlr,cxp.documento as cxp,
	    COALESCE(cxp.vlr_saldo,0) AS vlr_fact,
	    COALESCE(cxp.vlr_saldo_me,0) AS vlr_neto_me,
	    CASE
	    WHEN  cxp.vlr_neto- cxp.vlr_total_abonos !=  cxp.vlr_saldo THEN true
	    ELSE false
	    END AS errorSaldo,
	    COALESCE(cxp.moneda,'') AS moneda_fact,
	    e.currency,
	    Eg.nit,
	    pr.cmc,
	    pr.hc,
	    cxp.handle_code AS cmcfac,
	    CASE
	    WHEN pr.nit is null THEN false
	    ELSE true
	    END AS tiene_provee,
	    CASE
	    WHEN e.cuenta != ''	THEN e.cuenta
	    ELSE cmc.cuenta
	    END AS cuentaprov,
	    e.cuenta,
	    cmc.cuenta,
	     e.concept_code,
	    t.concept_desc,
	    e.bASe,
	    e.documento,
	    e.oc,
	    COALESCE(e.tipo_pago,'A') AS tipo_pago,
	    e.description,
	    e.tipo_documento,
	    get_nombp(eg.nit) AS nomb,
	    CASE
	    WHEN (e.vlr > 0) THEN 'D'                            
	    ELSE 'C'
	    END AS dbcr,
	    cxp.documento       AS documento_rel,
	    cxp.tipo_documento  AS tipodocRel
    FROM
	    egresodet e
    INNER JOIN
	    egreso eg ON (eg.dstrct= e.dstrct AND eg.branch_code =e.branch_code   AND eg.bank_account_no=e.bank_account_no AND eg.document_no =e.document_no)
    LEFT JOIN
	    proveedor pr ON (pr.dstrct = e.dstrct AND pr.nit=Eg.nit)
    LEFT JOIN
	    tblcon t ON (t.dstrct=pr.dstrct AND t.concept_code = e.concept_code)
    LEFT JOIN
	    fin.cxp_doc cxp ON (cxp.dstrct=e.dstrct AND cxp.proveedor=eg.nit_proveedor AND  cxp.tipo_documento=e.tipo_documento AND cxp.documento=e.documento)
    LEFT JOIN
	    negocios p ON (p.cod_neg = e.oc)
    LEFT JOIN
	    con.cmc_doc cmc ON (cmc.dstrct=e.dstrct AND cmc.tipodoc ='EGR'  AND cmc.cmc=cxp.handle_code AND cmc.reg_status!='A')
    WHERE
	    --cmc.cuenta = ''
	    --e.branch_code           = 'CAJA FINTRA'
	    e.bank_account_no   = 'CC'
	    and e.document_no       in ('BC14683')
	    and 
	    eg.periodo = ''

    ORDER BY
	    e.document_no

select * from egreso
--update con.comprodet  set creation_user = 'SDEARCO'
where document_no in ('BC14683')

select * from con.comprodet 
--update con.comprodet set  creation_user = 'SDEARCO'
where numdoc ='BC14683' and grupo_transaccion = 11077051
	    select * from con.cmc_doc where cmc IN ('PF')
	    select cmc,hc, * from proveedor where nit in ('72266691')
	    select * from fin.cxp_doc where handle_code = 'NP'-- cheque = 'BC12934'
	    select * from fin.cxp_doc where cheque in ('BC12934','BC12853')
	    select * from con.cmc_doc where cmc = 'NP'
	    select * from con.cuentas where cuenta = '23150501'
	    select * from egresodet where document_no in ('BC12934','BC14683')
	    select * from fin.cxp_doc 
		--update fin.cxp_doc  set vlr_neto = 232317917.00, vlr_neto_me = 232317917.00, vlr_saldo = 0, vlr_saldo_me = 0
	    where documento = '397'--111999904.76

	    select * from egresodet
		--update egresodet set vlr= 111999905, vlr_for = 111999905
	    where document_no = 'BC14683' and bank_account_no   = 'CC'
---ERROR DE HC

select handle_code,* from fin.cxp_doc 
--update fin.cxp_doc set handle_code = 'OT'
where cheque = 'BC7474'
'CXP00000027002'
----------------lista detalles ----------
 SELECT
    e.cuenta,
    e.auxiliar,
    e.document_no,
    e.branch_code,
    e.bank_account_no,
    e.vlr AS vlr,
    COALESCE(cxp.vlr_saldo,0) AS vlr_fact,
    COALESCE(cxp.vlr_saldo_me,0) AS vlr_neto_me,
    CASE
    WHEN  cxp.vlr_neto- cxp.vlr_total_abonos !=  cxp.vlr_saldo THEN true
    ELSE false
    END AS errorSaldo,
    COALESCE(cxp.moneda,'') AS moneda_fact,
    e.currency,
    Eg.nit,
    pr.cmc,
    pr.hc,
    cxp.handle_code AS cmcfac,
    CASE
    WHEN pr.nit is null THEN false
    ELSE true
    END AS tiene_provee,
    CASE
    WHEN e.cuenta != ''	THEN e.cuenta
    ELSE cmc.cuenta
    END AS cuentaprov,
    e.concept_code,
    t.concept_desc,
    e.bASe,
    e.documento,
    e.oc,
    COALESCE(e.tipo_pago,'A') AS tipo_pago,
    e.description,
    e.tipo_documento,
    get_nombp(eg.nit) AS nomb,
    CASE
    WHEN (e.vlr > 0) THEN 'D'                            
    ELSE 'C'
    END AS dbcr,
    cxp.documento       AS documento_rel,
    cxp.tipo_documento  AS tipodocRel

FROM
    egresodet e
INNER JOIN
    egreso eg ON (eg.dstrct= e.dstrct AND eg.branch_code =e.branch_code   AND eg.bank_account_no=e.bank_account_no AND eg.document_no =e.document_no)
LEFT JOIN
    proveedor pr ON (pr.dstrct = e.dstrct AND pr.nit=Eg.nit)
LEFT JOIN
    tblcon t ON (t.dstrct=pr.dstrct AND t.concept_code = e.concept_code)
LEFT JOIN
    fin.cxp_doc cxp ON (cxp.dstrct=e.dstrct AND cxp.proveedor=eg.nit_proveedor AND  cxp.tipo_documento=e.tipo_documento AND cxp.documento=e.documento)
LEFT JOIN
    negocios p ON (p.cod_neg = e.oc)
LEFT JOIN
    con.cmc_doc cmc ON (cmc.dstrct=e.dstrct AND cmc.tipodoc ='EGR'  AND cmc.cmc=cxp.handle_code AND cmc.reg_status!='A')
WHERE
    --e.branch_code           = ?
    --AND e.bank_account_no   = ?
     e.document_no       in ('BC12934')
     AND eg.periodo = ''
ORDER BY
    e.document_no

select * from fin.cxp_doc where cheque = 'AG277320'
------------------------CXC -------------------------------
select codigo_cuenta_contable,* from con.factura_detalle where documento ilike 'PM%' limit 5
select * from con.factura where documento = 'NM12810_1' limit 5
select * from proveedor where nit = '802002875'
select cmc,* from con.factura 
--update con.factura set cmc = 'II' 
where documento in ('R0034399')
select * from con.factura_detalle  where documento in ('R0000030')
select * from con.cuentas where cuenta = '13802902'
--update con.factura set cmc = 'PA' where documento in ('R0000026')

select cmc from con.factura where documento ilike 'PM1285%'
select cmc, * from con.factura where descripcion ilike 'CUOTAS INICIALES%'
select * from cliente where nit = '802002875'
select get_nombc('802002875')

SELECT
    facturas.*, 
    cmc.sigla_comprobante,   
    cmc.cuenta,
    (select codigo_cuenta_contable from con.factura_detalle where documento = facturas.numdoc limit 1) as cc_contable,
    cmc.dbcr,
    get_nombc(facturas.tercero) as nomb_cli
FROM (
   SELECT a.creation_user,
	  a.dstrct   ,
	  a.tipo_documento       as tipo_doc,
	  a.nit                  as tercero,
	  a.documento            as numdoc,
	  a.descripcion,
	  a.base,
	  a.codcli,
	  a.cmc                  as  hc,
	  a.moneda ,
	  a.fecha_factura ,             
	  substr( a.fecha_vencimiento,1,4 ) ||  substr( a.fecha_vencimiento,6,2 )  as periodo,
	  a.valor_factura as debe
    FROM      con.factura        a
    WHERE     a.dstrct                      =  'FINV'
       AND    a.fecha_factura               <=  now()::Date
       AND    a.fecha_contabilizacion       = '0099-01-01 00:00:00'
       AND    a.reg_status                  = ''
) facturas
LEFT JOIN  con.tipo_docto  tdoc ON ( tdoc.dstrct = facturas.dstrct AND tdoc.codigo_interno = facturas.tipo_doc )
LEFT JOIN  con.cmc_doc     cmc  ON ( cmc.dstrct = tdoc.dstrct AND cmc.tipodoc = tdoc.codigo AND cmc.cmc = facturas.hc )

select nit, digito_verificacion, nomcli from cliente
--update cliente set nit ='802024450', digito_verificacion= '4'--, nomcli = 'ESTACION DE SERVICIO ZETA GAS S.A.S'
where codcli ='CL22198'
select * from cliente where nit ilike '802024450%'
select * from cliente where codcli = 'CL18162'

select * from con.factura where codcli ='CL22198'
--update con.factura set cmc = 'IG'
where descripcion ilike 'COBRO DE INCAPACIDAD%'
select * from con.cmc_doc where cmc = 'IN'

select * from con.cmc_doc order by cuenta--where cuenta = '13050702'
select * from tablagen where table_code = 'FH'

select * from cliente where nit ='800141644'

--------------CONTABILIZACION INGRESOS

SELECT a.*,                        
                       c.cmc           as cmc_cliente,
                       b.codigo_cuenta as cuenta_banco,
                       d.cuenta        as cuenta_cliente,
                       c.nomcli         as nomb
                  FROM con.ingreso a
                       LEFT JOIN banco       b ON (b.dstrct = a.dstrct AND b.branch_code = a.branch_code AND b.bank_account_no = a.bank_account_no)
		       LEFT JOIN cliente     c ON (c.codcli = a.codcli)
		       LEFT JOIN con.cmc_doc d 
				ON (d.tipodoc = a.tipo_documento 
				   AND d.cmc = c.cmc )
                 WHERE a.fecha_contabilizacion = '0099-01-01 00:00:00' AND a.reg_status != 'A' AND a.creation_date <= TO_CHAR(now(),'YYYY-MM-DD 00:00:00')
                    AND a.tipo_documento='ING'
                    AND a.num_ingreso NOT IN (
                        SELECT i.num_ingreso 
                        FROM con.ingreso i 
                        WHERE (i.vlr_ingreso !=(SELECT COALESCE(SUM(d.valor_ingreso),0) FROM con.ingreso_detalle d WHERE d.num_ingreso=i.num_ingreso AND reg_status!='A')                                
                                )
                                AND (NOT(i.fecha_contabilizacion='0099-01-01 00:00:00' AND i.reg_status ='A'))	                                 
                    )
                 ORDER BY a.tipo_documento, a.num_ingreso


select * from con.ingreso where num_ingreso in ('IC247340','IA523289')

--------------------contabilizacion negocios 


SELECT neg.*, 
            GET_NOMBC(cod_cli) AS NOMB,
            (SELECT COALESCE(sum(cuota_manejo),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as cuota_manejo,
            (SELECT COALESCE(round(sum(remesa)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_remesa,
            (SELECT COALESCE(round(sum(interes)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as interes_corriente, 
            (SELECT COALESCE(round(sum(cat)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_cat  
            FROM negocios neg
            INNER JOIN convenios con ON con.id_convenio = neg.id_convenio AND con.tipo != 'Multiservicio'
            WHERE fecha_negocio <= '2017-08-02' -- AND estado_neg IN ('T')
            AND (CASE WHEN substring(cod_neg,1,2)='MC' THEN estado_neg IN ('T') ELSE estado_neg IN ('A','T') END )
            AND fecha_cont = '0099-01-01 00:00:00'
            AND dist='FINV' 






SELECT a.*,                        
                       c.cmc           as cmc_cliente,
                       b.codigo_cuenta as cuenta_banco,
                       d.cuenta        as cuenta_cliente,
                       c.nomcli         as nomb
                  FROM con.ingreso a
                       LEFT JOIN banco       b ON (b.dstrct = a.dstrct AND b.branch_code = a.branch_code AND b.bank_account_no = a.bank_account_no)
		       LEFT JOIN cliente     c ON (c.codcli = a.codcli)
		       LEFT JOIN con.cmc_doc d 
				ON (d.tipodoc = a.tipo_documento 
				   AND d.cmc = CASE WHEN a.tipo_documento IN ('ICA','ICR')  THEN a.cmc ELSE c.cmc END)
                 WHERE  a.fecha_contabilizacion = '0099-01-01 00:00:00' AND a.reg_status != 'A' AND a.creation_date <= TO_CHAR(now(),'YYYY-MM-DD 00:00:00')
                    AND a.tipo_documento IN ('ICA','ICR')
                    AND a.num_ingreso NOT IN (
                        SELECT i.num_ingreso 
                        FROM con.ingreso i 
                        WHERE (i.vlr_ingreso !=(SELECT COALESCE(SUM(d.valor_ingreso),0) FROM con.ingreso_detalle d WHERE d.num_ingreso=i.num_ingreso AND reg_status!='A')                                
                                )
                                AND (NOT(i.fecha_contabilizacion='0099-01-01 00:00:00' AND i.reg_status ='A'))	                                
                    )
                 ORDER BY a.tipo_documento, a.num_ingreso




















