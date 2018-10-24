SELECT * FROM apicredit.pre_solicitudes_creditos  where numero_solicitud='121702';

--ELIMINAR TODA LA INFORMACION COMERCIAL.
DELETE from solicitud_persona where numero_solicitud='121702';
DELETE from solicitud_estudiante where numero_solicitud='121702';
DELETE from solicitud_actividad_economica  where numero_solicitud='121702';
DELETE from solicitud_referencias where numero_solicitud='121702';
DELETE from solicitud_documentos where numero_solicitud='121702';
DELETE from solicitud_aval  where numero_solicitud='121702';
DELETE from solicitud_bienes  where numero_solicitud='121702';
DELETE from solicitud_cuentas  where numero_solicitud='121702';
DELETE from solicitud_vehiculo where numero_solicitud='121702';
DELETE from solicitud_finanzas  where numero_solicitud='121702';
DELETE from solicitud_hijos  where numero_solicitud='121702';
DELETE from solicitud_transacciones where numero_solicitud='121702';
DELETE from solicitud_negocio where numero_solicitud='121702';
DELETE from solicitud_aval  where numero_solicitud='121702';
DELETE FROM solicitud_laboral where numero_solicitud='121702';
DELETE FROM apicredit.pre_liquidacion_creditos where numero_solicitud='121702';
DELETE FROM recoleccion_documentos where numero_solicitud='121702';




UPDATE apicredit.pre_solicitudes_creditos set  ETAPA=0 where numero_solicitud='134809';
SELECT * FROM apicredit.tab_informacion_solicitante WHERE numero_solicitud ='134809';



