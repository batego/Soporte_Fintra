SELECT * FROM consultas WHERE descripcion ILIKE '%cuentas por elemento%';

SELECT 
cuenta 
FROM con.comprodet
WHERE substring (cuenta from 1 for 1) = 'I' 
and substring (cuenta from 10 for 14)::integer between '4209'::integer and '4209'::integer
GROUP BY 1;	 


SELECT cuenta,
periodo, 
creation_date AS Fecha,
valor_debito, 
valor_credito,
tercero, 
(SELECT payment_name FROM proveedor WHERE nit = compdt.tercero) as Tercero
FROM con.comprodet compdt 
WHERE substring (cuenta from 1 for 1) = 'I' and 
      periodo BETWEEN '201811' AND '201811' 
ORDER BY cuenta;
--LIMIT 100;


SELECT * FROM agencia;
SELECT * FROM con.comprobante LIMIT 200;
SELECT * FROM con.comprodet WHERE cuenta ILIKE 'I010%' LIMIT 100;

