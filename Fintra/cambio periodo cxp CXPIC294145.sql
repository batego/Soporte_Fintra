select periodo, fecha_contabilizacion* from fin.cxp_doc where documento = 'CXPIC294145'
-- update fin.cxp_doc set periodo = '201805', fecha_contabilizacion = '2018-05-01 07:51:31.407329'  where documento = 'CXPIC294145'

select * from fin.cxp_items_doc where documento = 'CXPIC294145'

select * from con.comprobante where numdoc ='CXPIC294145'
-- update con.comprobante set periodo = '201805', creation_date = '2018-05-01 07:51:31.407329', fechadoc = '2018-05-01'   where numdoc ='CXPIC294145'		

--periodo :'201807' creation_date: '2018-08-01 07:51:31.407329'

select * from con.comprodet where numdoc ='CXPIC294145'
-- update  con.comprodet set periodo = '201805' , creation_date = '2018-05-01 07:51:31.407329' where numdoc ='CXPIC294145'		
--periodo: '201807'	creation_date: '2018-08-01 07:51:31.407329'	