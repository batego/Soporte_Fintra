--INFORME WEBVIEW CLIENTES 1RA CUOTA
--Buenas tardes
--Solicito su colaboración con la creación de un reporte WebView 
--en el cual se relacionen todos los negocios a los cuales se les genere
--su primera cuota a cancelar en un período (mes) a seleccionar. 
--
--Las columnas a presentar son las siguientes: 
--Unidad de Negocio (Microcrédito, Educativo, etc), 
--No. Negocio, 
--Nit Cliente, 
--Nombre Cliente
SELECT * from consultas LIMIT 1;

SELECT n.id_convenio,
	   c.nombre,
	   n.cod_neg, 
       n.cod_cli, 
       get_nombc(n.cod_cli),
       fac.documento,
       fac.fecha_vencimiento, 
       fac.num_doc_fen as Cuota, 
       fac.valor_factura, 
       fac.valor_abono, 
       fac.valor_saldo
FROM NEGOCIOS N
INNER JOIN CON.FACTURA FAC ON (FAC.negasoc = N.cod_neg)
INNER JOIN convenios c ON (c.id_convenio = n.id_convenio)
WHERE 
	N.estado_neg = 'T' AND
	n.actividad = 'DES' AND 
	FAC.num_doc_fen = '1' AND 
	FAC.valor_abono < fac.valor_factura AND 
	to_char(FAC.fecha_vencimiento, 'YYYYMM') = ?
	;
	
	
	
select num_doc_fen, negasoc, valor_factura, valor_abono, valor_saldo, * 
from con.factura 
where negasoc = 'MC15663' 
ORDER BY documento;	

select id_convenio, cod_neg,* from negocios where estado_neg='T' AND cod_neg ILIKE 'MC%' LIMIT 100;