select vr_negocio, nro_docs,* from negocios where cod_neg='FE01599';
select * from con.factura where negasoc='FE01599' ORDER BY documento;
select * from con.factura_detalle where documento IN (select documento from con.factura where negasoc='FE01599');

SELECT * FROM con.factura_detalle where documento = 'FG2533302' order by descripcion

select valor_unitario from con.factura_detalle where documento = 'FG2533302' and descripcion = 'INTERESES';
