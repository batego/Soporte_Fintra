 SELECT neg.*, 
            GET_NOMBC(cod_cli) AS NOMB,
            (SELECT COALESCE(sum(cuota_manejo),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as cuota_manejo,
            (SELECT COALESCE(round(sum(remesa)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_remesa,
            (SELECT COALESCE(round(sum(interes)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as interes_corriente, 
            (SELECT COALESCE(round(sum(cat)),0) FROM documentos_neg_aceptado  where cod_neg=neg.cod_neg) as vlr_cat  
            FROM negocios neg
            INNER JOIN convenios con ON con.id_convenio = neg.id_convenio AND con.tipo != 'Multiservicio'
            WHERE fecha_negocio <= '2019-01-31' -- AND estado_neg IN ('T')
            AND (CASE WHEN substring(cod_neg,1,2)='MC' THEN estado_neg IN ('T') ELSE estado_neg IN ('A','T') END )
            AND fecha_cont = '0099-01-01 00:00:00'
            AND dist='FINV'
            AND neg.cod_neg IN ('LB01357','LB01358','LB01359');
           
Credito = 1.8E7 
Debito = 2.964142944E7
           
SELECT * FROM con.factura WHERE negasoc = 'LB01357';    --29.641.426       
select cod_neg,vr_negocio,tot_pagado,vr_girado,* from negocios where cod_neg='LB01357';  --29.641.429.44         
           
-------------Negocio Ejemplo------------           
SELECT * FROM con.factura WHERE negasoc = 'LB01095';           

SELECT * FROM cliente WHERE nit = '1129539129';
           
select cod_neg,vr_negocio,tot_pagado,vr_girado,* from negocios where cod_neg='LB01095';--4291838.70
Cod_neg vr_egocio   tot_pagado  vr_girado   
LB01095	3000000.00	4291838.70	2667555.00

select * from con.comprobante where numdoc = 'LB01095';
Detalle				Tercero		debito		Credito
NEGOCIO No LB01095	1129539129	3000000.00	3000000.00

select * from con.comprodet where numdoc = 'LB01095';
Cuenta      Auxiliar    	Detalle
23050940	RD - 1129539129	PEREZ HENRIQUEZ LIBARDO LUIS
13050940	RD - 1129539129	PEREZ HENRIQUEZ LIBARDO LUIS

select * from fin.cxp_doc where documento_relacionado = 'LB01095';
SELECT * from con.comprobante WHERE numdoc IN ('FZL00443','LP0001205')