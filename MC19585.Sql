SELECT * FROM documentos_neg_aceptado WHERE cod_neg = 'LB01381' ;

SELECT * FROM negocios_trazabilidad WHERE cod_neg = 'MC19585';
INSERT INTO public.negocios_trazabilidad
(reg_status, dstrct, numero_solicitud, actividad, usuario, fecha, cod_neg, comentarios, concepto, causal, comentario_stby)
VALUES('', 'FINV', 151632, 'ANA', 'HSALINAS', '2019-05-06 11:41:57.560', 'MC19585', EN ETAPA ANÁLISIS
Capacidad de pago/NO cuota Fintra $22.092
Se confirman datos / se toma balance suministrado por el tt en el momento de la llamada / sin trayectoria financiera tipo 5 / tt no registra capacidad de pago / de acuerdo a experiencia financiera y capacidad de pago/ rechazado
, 'RECHAZAD', '10', );
