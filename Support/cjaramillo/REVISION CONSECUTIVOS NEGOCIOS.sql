-- 1. incrementar el prefijo cuando se realice la asignacion a un nuevo negocio
select last_number,* from series where prefix = 'FE';--last_number: 4966
-- 2. Tablas a modificar el consecutivo nuevo.
/*
negocios
solicitud_aval
con.factura
ing_fenalco
rel_negocios_reestructuracion

--Negocios a Cambiarle el consecutivo

FE01142	FB05884 -- Enviado por carolina -- FE04966
FE00770	FB05886 -- Enviado por carolina -- FE04970
FE02297	FB05887 -- encontrados          -- FE04972	
FE00399	FB05888 -- encontrados			-- FE04973
FE00747	FB05889 -- encontrados			-- FE04974
FE00283	FB05890 -- encontrados			-- FE04975
FE00503	FB05885 -- encontrados			-- FE04976
*/

--Contable
select * from con.comprobante where numdoc = 'FE04976'; 					-- numdoc
select * from con.comprodet where numdoc = 'FE04976';    					-- nudoc, documento_interno, documento_rel
select * from con.comprodet where documento_rel ='FE04976';					-- documento_rel
--Operativo
select * from negocios where cod_neg IN ('FB05885','FE04976'); 				    -- se Crea primero una copia del registro viejo con el cod del negocio nuevo
select * from solicitud_aval where cod_neg = 'FE04976';						-- se actualiza el campo del negocio con el nuevo codigo
select negasoc,* from con.factura where negasoc = 'FE04976'; 				-- se actualiza campo negasoc
select codneg,* from ing_fenalco where codneg = 'FE04976';   				-- se actualiza el campo codneg
select * from rel_negocios_reestructuracion where negocio_base = 'FE00503';	-- buscar por el negocio base y actualizar en el campo negocio_reestructuracion el nuevo neg
--select * from negocios_trazabilidad where cod_neg ='FE00503';

select * from documentos_neg_aceptado where cod_neg ='FB05884';		-- Liquidacion

select last_number,* from series where prefix = 'FE';-- 04976

--LAST consecutive
SELECT  max(substring(cod_neg,3)) FROM negocios WHERE cod_neg ILIKE 'FE%' LIMIT 10; 
--select * from negocios where cod_neg='FE04966';

--Web View Caro movimiento_terceros
select * from consultas where descripcion='movimiento_terceros';

