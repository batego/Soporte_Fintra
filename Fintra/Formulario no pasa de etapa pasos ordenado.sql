--1.Validar si esta dupplicada la informacion en el tab de informacion_personal
--2.Si esta duplicado eliminar uno de los registros
--3.validar en las tablas originales la informacion que se alcanzo a guardar para eliminarla con los querys que te paso manuel
--3.cambiar la etapa de la pre-solicitud a etapa=0
 
select etapa,* from apicredit.pre_solicitudes_creditos  where numero_solicitud=145830
select * from apicredit.tab_informacion_solicitante  where numero_solicitud=145830
select cod_neg,* from solicitud_aval  where  numero_solicitud=145830;
update apicredit.pre_solicitudes_creditos set etapa='0' where numero_solicitud=145830;


--ELIMINAR TODA LA INFORMACION COMERCIAL.
DELETE FROM apicredit.pre_liquidacion_creditos where numero_solicitud='145830';
DELETE from solicitud_persona where numero_solicitud='145830';
DELETE from solicitud_estudiante where numero_solicitud='145830';
DELETE from solicitud_actividad_economica  where numero_solicitud='145830';
DELETE from solicitud_referencias where numero_solicitud='145830';
DELETE from solicitud_documentos where numero_solicitud='145830';
DELETE from solicitud_bienes  where numero_solicitud='145830';
DELETE from solicitud_cuentas  where numero_solicitud='145830';
DELETE from solicitud_vehiculo where numero_solicitud='145830';
DELETE from solicitud_finanzas  where numero_solicitud='145830';
DELETE from solicitud_hijos  where numero_solicitud='145830';
DELETE from solicitud_transacciones where numero_solicitud='145830';
DELETE from solicitud_negocio where numero_solicitud='145830';
DELETE FROM solicitud_laboral where numero_solicitud='145830';
DELETE FROM recoleccion_documentos where numero_solicitud='145830';
DELETE from solicitud_aval  where numero_solicitud='145830';

select etapa,* from apicredit.pre_solicitudes_creditos  where numero_solicitud=145830