Reactivar creditos rechazados por el sistema
Buen dia
por favor reactivar estos créditos que me aparecen rechazados por administración, 
donde los anteriormente estaban en estado avalados y se encontraban en stanby los creditos son l0s siguientes
FE00355 22545523   elizabet manjarez
FE00341 1234095041 miguel morales 

select estado_neg, actividad,* from negocios where cod_neg = 'FE00341'		--'P';'ANA'
-- update negocios set estado_neg = 'V', actividad = 'DEC' where cod_neg = 'FE00341'

SELECT * FROM SOLICITUD_AVAL WHERE COD_NEG = 'FE00341' 
-- UPDATE SOLICITUD_AVAL SET ESTADO_SOL = 'V' WHERE COD_NEG = 'FE00341' 

--v, Dec

