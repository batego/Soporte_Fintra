-- Buenas tardes
-- 
-- La factura FG2270600 presentaba al corte de Abr-30-2017 saldo contable y operativo por 
-- $40.965. Al corte de May-31-2017 el saldo contable es de $40.965 y el operativo es de $125.216. 
-- Solicito su colaboración en validar el incremento en el saldo operativo ya que al revisar, no se encuentran evidencias que soporten dicho aumento


select * from negocios where cod_neg = 'FA35842'

create table tem.fac_FG2270600 as
select * from con.factura where documento = 'FG2270600'; 

update con.factura set valor_saldo = '40965' where documento = 'FG2270600'; 


select * from con.comprobante where numdoc = 'FG2270600'

SELECT * FROM fin.cxp_doc where documento = 'FG2270600'

select * from con.ingreso where 


