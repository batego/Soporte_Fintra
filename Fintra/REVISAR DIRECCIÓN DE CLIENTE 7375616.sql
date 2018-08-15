SELECT * FROM cliente WHERE nit = 7375616;
UPDATE cliente SET DIRECCION = 'Calle 120 # 18-06 BARRIO LA PRADERA', CIUDAD = 'BQ' WHERE nit = 7375616;
select direccion, barrio, * from solicitud_persona WHERE identificacion = 7375616 and tipo = 'S'  ;
update solicitud_persona set  direccion = 'CARRERA 29 # 82F-05', barrio = 'VILLA DEL ROSARIO' WHERE identificacion = 10006429 and tipo = 'S';

SELECT * FROM NIT WHERE CEDULA = '7375616' 
UPDATE NIT SET BARRIO = 'LA PRADERA', CODCIU = 'BQ', CODDPTO = 'ATL', DIRECCION = 'Calle 120 # 18-06' WHERE CEDULA = '7375616' 


'Calle 120 # 18-06'	'LA PRADERA'


SELECT * FROM barrio WHERE nombre ILIKE '%rosario%';
