SELECT periodo, 
       creation_date, 
       fecha_contabilizacion,
       fecha_factura,
	   * 
FROM con.factura 
WHERE documento IN ('R0036726','R0036727','R0036728','R0036729','R0036730','R0036731','R0036732','R0036733','R0036734','R0036735','R0036736');


SELECT creation_date,
	   * 
FROM con.factura_detalle 
WHERE documento IN ('R0036726','R0036727','R0036728','R0036729','R0036730','R0036731','R0036732','R0036733','R0036734','R0036735','R0036736');




SELECT periodo, creation_date,* FROM con.comprobante WHERE numdoc IN ('R0036726','R0036727','R0036728','R0036729','R0036730','R0036731','R0036732','R0036733','R0036734','R0036735','R0036736');
SELECT periodo, creation_date,* FROM con.comprodet WHERE numdoc IN ('R0036726','R0036727','R0036728','R0036729','R0036730','R0036731','R0036732','R0036733','R0036734','R0036735','R0036736'); 
