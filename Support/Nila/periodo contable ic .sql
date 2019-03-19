SELECT periodo, creation_date, fecha_contabilizacion, * from con.ingreso 
where num_ingreso IN ('IC344401','IC344402','IC344403','IC344404','NC_CXPIC336400');

SELECT periodo, creation_date, fecha_contabilizacion, * from con.ingreso_detalle 
where num_ingreso IN ('IC344404');--,'IC344402','IC344403','IC344404','');

select periodo,creation_date, fechadoc,* from con.comprobante 
where numdoc IN ('IC344401','IC344402','IC344403','IC344404','');

select creation_date, periodo,* from con.comprodet 
where numdoc IN ('IC344401','IC344402','IC344403','IC344404','');


select creation_date, periodo,* from fin.cxp_doc where documento='NC_CXPIC336400';
select * from fin.cxp_items_doc where documento='NC_CXPIC336400';


select * from con.comprobante where numdoc='NC_CXPIC336400';