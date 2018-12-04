
SELECT (SELECT cuenta FROM con.cmc_doc where cmc =fac.cmc and tipodoc='FAC') as cuenta,
* FROM con.factura fac
WHERE fac.valor_saldo > 0
AND fac.tipo_documento='FAC'
AND fac.reg_status !='A'
AND fac.tipo_referencia_1='FCORR'
AND fac.referencia_1::date='2018-11-27'::date;


select * from con.factura where referencia_1 != '' and documento ilike 'PP%' limit 500;

select * from cliente where  nit ='8000700563';

select * from etes.transportadoras where id = 3;

