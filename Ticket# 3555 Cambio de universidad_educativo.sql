select * from negocios where cod_neg = 'FA38587' --17
--update negocios set nit_tercero = '8901045309' where cod_neg = 'FA38587' --17

select * from solicitud_aval    where numero_solicitud = '122030'; --universidad like '%CORPORACION UNIVERSITARIA DE LA COSTA%' limit 10 
--update solicitud_aval set afiliado = '8901045309'  where numero_solicitud = '122030';

--update solicitud_estudiante set universidad = 'CORPORACION UNIVERSITARIA DE LA COSTA' where numero_solicitud = '122030'; --universidad like '%CORPORACION UNIVERSITARIA DE LA COSTA%' limit 10 

select * from prov_convenio where nit_proveedor = '8000366521' and id_convenio = 17 
select * from 

select * from proveedor where payment_name like '%CORPORACION UNIVERSITARIA DE LA COSTA%'		--'8901045309' --'8000366521'

---- Aqui se cambia la universidad, en el campo afiliado se coloca el nit de la universidad.
select * from  apicredit.pre_solicitudes_creditos where numero_solicitud = 122030;
update  apicredit.pre_solicitudes_creditos set afiliado = '8901045309' where numero_solicitud = 122030;
