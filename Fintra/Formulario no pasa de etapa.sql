-- Formulario no pasa de etapa 2
-- Esto se presenta cuando el sistema por alguna razon duplica los registros en las tablas presentes en el docuemento

select * from solicitud_persona where numero_solicitud = '126808' --and secuencia = '54691'
-- delete from solicitud_persona where numero_solicitud = '126808' and secuencia = '54691'

select * from apicredit.tab_cons_solicitud_persona where numero_solicitud = '126808'
-- delete from apicredit.tab_informacion_solicitante where numero_solicitud = '126808' and id = 6108

