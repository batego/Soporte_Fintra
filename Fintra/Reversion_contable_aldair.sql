
create table tem.rev_contable_Ticket_4069_fac as		-- select * from tem.rev_contable_Ticket_4069_fac
select * from con.factura 
-- delete from con.factura 
where documento in (
'MI99900', 
'MI99577',
'MI99504', 
'MI99571', 
'MI99884', 
'MI99691', 
'MI99890', 
'MI99510', 
'MI99416', 
'MI99457', 
'MI99624',
'MI99597', 
'MI99580',
'MI99769',
'MI99465',
'MI99470', 
'MI99326') 



create table tem.rev_contable_Ticket_4069_fac_det as			--select * from tem.rev_contable_Ticket_4069_fac_det 
select * from con.factura_detalle 
-- delete from con.factura_detalle 
where documento in (
'MI99900', 
'MI99577',
'MI99504', 
'MI99571', 
'MI99884', 
'MI99691', 
'MI99890', 
'MI99510', 
'MI99416', 
'MI99457', 
'MI99624',
'MI99597', 
'MI99580',
'MI99769',
'MI99465',
'MI99470', 
'MI99326') 

create table tem.rev_contable_Ticket_4069_comprbante as			--select * from tem.rev_contable_Ticket_4069_comprbante
select * from con.comprobante
-- delete from  con.comprobante 
where numdoc in ('MI99900', 
'MI99577',
'MI99504', 
'MI99571', 
'MI99884', 
'MI99691', 
'MI99890', 
'MI99510', 
'MI99416', 
'MI99457', 
'MI99624',
'MI99597', 
'MI99580',
'MI99769',
'MI99465',
'MI99470', 
'MI99326') 


create table tem.rev_contable_Ticket_4069_comprodet as				--select * from tem.rev_contable_Ticket_4069_comprodet
select * from con.comprodet
-- delete from con.comprodet
where numdoc in ('MI99900', 
'MI99577',
'MI99504', 
'MI99571', 
'MI99884', 
'MI99691', 
'MI99890', 
'MI99510', 
'MI99416', 
'MI99457', 
'MI99624',
'MI99597', 
'MI99580',
'MI99769',
'MI99465',
'MI99470', 
'MI99326') 
