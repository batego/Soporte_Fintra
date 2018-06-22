-- Ticket# 3544
-- correr periodo
-- Buenos dias, Mediante el presente solicitamos nos caloboren corriendo de perido los siguientes comprobantes: 
-- CID00000073 Y CID00000073 a periodo de Mayo. Gracias


select * from con.COMPROBANTE where NUMDOC = 'CID00000073';					      	
select * from con.COMPRODET where NUMDOC = 'CID00000073';

select * from con.ingreso where num_ingreso = 'CID00000073';
select * from ing_fenalco where cod = 'CID00000073' limit 100
select * from con.factura where documento = 'CID00000073' limit 100
select * from fin.cxp_doc where documento = 'CID00000073' limit 100



-- update con.COMPROBANTE set CREATION_DATE = '2018-05-02 07:44:03.403996', periodo = '201805' where NUMDOC = 'CID00000073';
-- update con.comprodet set periodo = '201805', creation_date = '2018-05-02 07:44:03.403996' where NUMDOC = 'CID00000073';


-- update con.ingreso set periodo = '201704', fecha_contabilizacion = '22/04/17' where num_ingreso = 'NC038042' 

