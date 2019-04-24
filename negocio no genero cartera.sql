select * from con.factura where negasoc = 'MC19044';
select * from con.factura_detalle where documento IN (select documento from con.factura where negasoc = 'MC19044');

SELECT * FROM ing_fenalco WHERE codneg = 'MC19044';


select * from fin.cxp_doc where documento_relacionado = 'MC19044';--9.960.000.00--EG68379
select * from fin.cxp_doc where documento_relacionado = 'MP16289';--491.400
SELECT * FROM egreso WHERE document_no = 'EG68379';--9.465.716 + 2884.00

select * from con.comprodet where numdoc IN (select documento from con.factura where negasoc = 'MC19044');


select * from egreso where document_no='EG68418';
select * from egresodet where document_no='EG68418';

