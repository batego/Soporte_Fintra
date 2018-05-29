select * from con.ingreso where num_ingreso in ('IC289606')  --branch_code LIKE 'BANCOLOMBIA%' AND BANK_ACCOUNT_NO = 'CA'  LIMIT 10 -- BUSCAR LA LINEA DE NEGOCIO A Q PERTENECE
-- UPDATE  con.ingreso SET branch_code = 'BANCOLOMBIA', BANK_ACCOUNT_NO = 'CA' where num_ingreso in ('IC289606')
select * from con.ingreso_detalle  where num_ingreso = 'IC137173' 

select * from con.factura where transaccion = '11103032'




select * from con.comprobante where NUMDOC = 'IC289652' periodo = '201803' and cmc = 'CL'
select * from con.comprodet  where NUMDOC = 'IC289606' AND CUENTA = '11050533' periodo = '201803' and cmc = 'CL'
-- UPDATE  con.comprodet SET DETALLE ='BANCOLOMBIA CA' WHERE NUMDOC = 'IC289606' AND CUENTA = '11050533'



