ANULAR NOTA DE AJUSTE IA533147
Buenas tardes

Por favor anular esta nota de ajuste en el CORE FINTRA IA533147 ($20.000) y restablecer el saldo de la factura PM13980_1. Gracias.
--Operativo IA
;
CREATE TABLE tem.IA533147_cab AS;				
select * from con.ingreso where num_ingreso ='IA533147';-- vlr_ingreso: 13879239.00

CREATE TABLE tem.IA533147_det AS;
select * from con.ingreso_detalle where num_ingreso ='IA533147';

--Contable IA
CREATE TABLE tem.IA533147_comp AS;
select * from con.comprobante where numdoc='IA533147';
CREATE TABLE tem.IA533147_compdet AS;
select * from con.comprodet where numdoc='IA533147';


--Factura operativa
select * from con.factura where documento='PM13980_1';
select * from con.factura_detalle where documento='PM13980_1';

select * from con.comprobante where numdoc='PM13980_1';
select * from con.comprodet where numdoc='PM13980_1';