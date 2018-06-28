-- Buenos días,
-- 
-- la ss MERCADO PULIDO NOEMY DEL CARMEN cod de negocio FA38615
--  que es el actual con tasa de 2.2 y en donde se muetra el primer negocio que es FA32646 con tasa de 2.4 y le cobramos menos.
-- 
-- Deseo de su ayuda para saber porque siendo aun negocio de fenalco se le esta cobrando un vlor superior.


select cod_neg,tasa, vr_negocio, tot_pagado, valor_aval, vr_desembolso,  * from negocios where cod_neg in ('FA38615','FA32646')
select * from negocios where cod_neg in ('FA38615','FA32646')

select * from apicredit.pre_solicitudes_creditos where numero_solicitud = 120846 and identificacion = '32754318'
delete  from apicredit.pre_solicitudes_creditos where numero_solicitud = 120846 and identificacion = '32754318'

select * from solicitud_aval where numero_solicitud = 120846

