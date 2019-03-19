/* ANULAR INGRESO IC344267
   Buen dia 
   Por favor anular este ingreso en el CORE FINTRA IC344267 
   y restablecer el saldo de la factura PM13414_1 (13,879,239)
*/
CREATE TABLE tem.IC344267_cab AS				SELECT * FROM tem.IC344267_cab
select * from con.ingreso where num_ingreso ='IC344267';-- vlr_ingreso: 13879239.00

CREATE TABLE tem.IC344267_det as
select * from con.ingreso_detalle where num_ingreso ='IC344267';


select * from con.factura where documento='PM13414_1';
select * from con.factura_detalle where documento='PM13414_1';

select * from con.comprobante where numdoc='PM13414_1';
select * from con.comprodet where numdoc='PM13414_1';