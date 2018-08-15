--Backup CXP Cabecera
select * from tem.lb01094_mcamila_cab
union all
select * from fin.cxp_doc limit 20;

--Backup CXP Detalle
select * from tem.lb01094_mcamila_det
union all
select * from fin.cxp_items_doc limit 20;

--Backup Factura Cabecera
select * from con.factura  --where negasoc='LB01094';
union all
select * from TEM.BTG_LB01094_FAC limit 20;


--Contable
select * from con.comprobante  where numdoc = 'LB01094'
union all
select * from TEM.LB01094_COMP limit 20;

--COntable Detalle 
select * from con.comprodet limit 10;
select * from TEM.LB01094_COMPDET;


end;