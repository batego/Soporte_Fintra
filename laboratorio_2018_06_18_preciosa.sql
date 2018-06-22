create table tem.btg_123786_preciosa as
delete FROM apicredit.pre_solicitudes_creditos  where numero_solicitud='123786';
select * from solicitud_aval where numero_solicitud = '123786'
--ELIMINAR TODA LA INFORMACION COMERCIAL.
DELETE from solicitud_persona where numero_solicitud='123786';
DELETE from solicitud_estudiante where numero_solicitud='123786';
DELETE from solicitud_actividad_economica  where numero_solicitud='123786';
DELETE from solicitud_referencias where numero_solicitud='123786';
DELETE from solicitud_documentos where numero_solicitud='123786';
DELETE from solicitud_aval  where numero_solicitud='123786';
DELETE from solicitud_bienes  where numero_solicitud='123786';
DELETE from solicitud_cuentas  where numero_solicitud='123786';
DELETE from solicitud_vehiculo where numero_solicitud='123786';
DELETE from solicitud_finanzas  where numero_solicitud='123786';
DELETE from solicitud_hijos  where numero_solicitud='123786';
DELETE from solicitud_transacciones where numero_solicitud='123786';
DELETE from solicitud_negocio where numero_solicitud='123786';
DELETE from solicitud_aval  where numero_solicitud='123786';
DELETE FROM solicitud_laboral where numero_solicitud='123786';
DELETE FROM apicredit.pre_liquidacion_creditos where numero_solicitud='123786';
DELETE FROM recoleccion_documentos where numero_solicitud='123786';

SELECT cod_neg,* FROM negocios  where cod_cli  ='31526679'
select * from documentos_neg_aceptado  where cod_neg   ='FE00123'
UPDATE apicredit.pre_solicitudes_creditos set  ETAPA=0 where numero_solicitud='123786';

delete from negocios where cod_neg  ='FE00169';
delete from documentos_neg_aceptado where cod_neg ='FE00169';

select * from negocios where cod_neg ='FE00169'


select barrio,* from apicredit.tab_informacion_solicitante where  numero_solicitud='123786';
select barrio,* from apicredit.tab_informacion_estudiante where  numero_solicitud='123786';

update apicredit.tab_informacion_estudiante set trabaja='S' WHERE numero_solicitud='123786';


select * from solicitud_persona where identificacion = '22703868'


