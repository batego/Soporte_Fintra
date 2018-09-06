SELECT direccion, identificacion FROM solicitud_persona 
WHERE numero_solicitud IN (SELECT numero_solicitud FROM solicitud_aval WHERE cod_neg IN ('MC10670'))  AND tipo = 'S';
'MC09632', -- 'Calle 13A # 7-82'
'MC08405', -- 'Carrera 17A # 18-33'
'MC10071', -- 'Calle 15 # 7A-21'
'MC08186', -- 'Calle 13A # 7A-74'
'MC08709', -- 'Carrera 10 # 10-16'
'MC08187', -- 'Calle 14 # 7-65'
'MC10670'))


select NEGOCIO, direccion, fecha_a_pagar from con.compromiso_pago_cartera WHERE negocio IN ('MC10670') 
AND barrio = 'LA PLAYA' AND fecha_a_pagar = '2018-08-31';
/*
update con.compromiso_pago_cartera set direccion = 'Calle 12 Carrera 12-65' WHERE negocio IN ('MC10670') 
AND barrio = 'LA PLAYA' AND fecha_a_pagar = '2018-08-31';
*/

