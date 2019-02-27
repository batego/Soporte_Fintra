--PAGADURIAS DE LIBRANZA
--Buenas tardes,
--Favor agregar la pagaduria a la que corresponden los siguientes empleados:
--1143134976	CAMARGO VARGAS MANUEL JOSE
--72000208	CUELLO GUTIERREZ HAROLD 
--72178439	ECHEVERRIA VARELA MARCO ANTONIO
--Quedo atenta, gracias..

SELECT nit_fen, nit_tercero,cod_neg,* FROM negocios WHERE cod_neg in ('LB01336','LB01316','LB01326','LB01322',);--8901009858 --802022016
SELECT * FROM proveedor WHERE nit = '802022016';

SELECT cod_neg,* FROM solicitud_aval WHERE cod_neg in ('LB01336','LB01316','LB01326','LB01322');