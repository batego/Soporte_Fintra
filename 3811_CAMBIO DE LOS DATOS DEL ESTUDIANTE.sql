select * from solicitud_aval where numero_solicitud = 123251		

create table tem_123251 as 
select * from solicitud_persona where numero_solicitud = 123251 

select * from tem_123251

-- update solicitud_persona 
-- set  segundo_apellido = 'POLANCO',
--      PRIMER_NOMBRE = 'LEONEL',
--      segundo_nombre = 'JULIAN',
--      NOMBRE = 'POLANCO BENAVIDES LEONEL JULIAN',
--      TIPO_ID = 'CED',
--      IDENTIFICACION = '8793064',
--      FECHA_EXPEDICION_ID = '1986-09-09 00:00:00',
--      FECHA_NACIMIENTO = '1967-11-22 00:00:00',
--      DIRECCION = 'CALLE 90 B # 6A SUR-31',
--      TELEFONO = '3286836',
--      CELULAR = '3106164956',
--      EMAIL = 'LEONELPOLANCO@FINTRA', 
--      GENERO = 'M'
--  where numero_solicitud = 123251 and identificacion = '8793064'        8793064


select * from solicitud_persona where IDENTIFICACION = '8793064'
select * from solicitud_estudiante  where numero_solicitud = 123251

select * from negocios where cod_neg = 'FE00091'

SELECT * FROM apicredit.pre_solicitudes_creditos where numero_solicitud = 123251
SELECT * FROM apicredit.solicitud_aval where numero_solicitud = 123251		