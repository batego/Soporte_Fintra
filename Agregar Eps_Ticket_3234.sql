-- CREACION EPS EN PROMETHEUS 
-- Ticket# 3234

--Verificamos si esta creado como proveedor
select * from proveedor where nit = 804002105
select * from proveedor LIMIT 100

--Hacemos el insert en esta tabla
select * from administrativo.entidades_salud  limit 100
--select * from administrativo.entidades_salud  WHERE DESCRIPCION LIKE 'COMPARTA%'


--Actualizamos el tipo de proveedor a EPs
-- update proveedor set tipo_proveedor = '2' where nit = 804002105

--COnsultamos los tipos de proveedores
SELECT * FROM administrativo.tipo_proveedor LIMIT 100

--fintra
--selectrik
--provintegral
cobranza



insert into proveedor values ('','FINV','804002105','','EPS S COMPARTA','COLPATRIA','OF PPAL 01 TR','OP','2017-06-29 09:14:59.650804','KHURTADO','2017-06-29 09:18:31.931968','KHURTADO','NIT','Bancolombia','111','CA','111111','XX00','PJ','N','N','S','S','S','01',0,'COL','111111','1111111','01','01','T','804002105','N','0099-01-01 00:00:00','','N','',0.0000000000,'t','t',1.2000000000,'Mensual',1450.00,0.0000000000,'S','N','N','','','','2')