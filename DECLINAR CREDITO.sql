-- Ticket# 3849
-- DECLINAR CREDITO
-- Buenas Noches
-- 
-- favor declinar solicitud de credito, se necesita volver a ingresar pero el sistema no deja porque ya tiene una solicitud ingresada..
-- 
-- 123329 
-- 
-- 1001897674



SELECT * FROM SOLICITUD_PERSONA WHERE NUMERO_SOLICITUD = '123329' 
-- SELECT * FROM cliente where nit = '1001897674'
select * from solicitud_aval WHERE NUMERO_SOLICITUD = '123329' limit 100

create table tem_btg_del_educ_123329 as			--select * from tem_btg_del_educ_123329
select * from apicredit.pre_solicitudes_creditos where NUMERO_SOLICITUD = '123329' and identificacion = '1001897674' limit 100
-- update apicredit.pre_solicitudes_creditos set creation_user = 'LTESILLOM' where numero_solicitud = 123329 AND IDENTIFICACION = '1001897674'


delete from apicredit.pre_solicitudes_creditos where NUMERO_SOLICITUD = '123329' and identificacion = '1001897674'
