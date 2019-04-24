select negasoc from con.factura where documento IN ('CM13491');
select documento_rel,* from con.comprodet where numdoc ='IC295867'; 

SELECT * FROM CON.ingreso_detalle WHERE num_ingreso ='IC230014'; --AND nitcli = '33149094';
SELECT negasoc,* FROM CON.factura WHERE documento = 'FC0596110'; 

SELECT negasoc FROM con.factura WHERE documento IN (SELECT factura FROM CON.ingreso_detalle WHERE num_ingreso ='IC311146')
GROUP BY negasoc LIMIT 1

select * from con.comprobante where numdoc = 'CD16120097'; --grupo_transaccion ='10225091';
select * from con.comprodet where tipodoc = 'CDIAR' AND numdoc = 'CD16120097'; --AND grupo_transaccion ='10225091';
SELECT sp_uneg_negocio_name((select substring(detalle,1,7) AS negocio from con.comprodet WHERE grupo_transaccion ='10225091' GROUP BY negocio))


--Unidad de negocios
SELECT sp_uneg_negocio_name('FA38625');



