
SELECT * FROM solicitud_obligaciones_comprar WHERE numero_solicitud IN (SELECT numero_solicitud from solicitud_aval WHERE cod_neg = 'MC16104');

