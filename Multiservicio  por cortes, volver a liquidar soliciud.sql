/*
 * Se elimino del detalle operativo y contable la accion indicada en el ticket 9046171
 * se volvio a coloar en el modulo de liquiacion de solicitudes para volver a facturar la accion.
 */
prefact= n
estado 100
subclientes_ofertas : facturas_clientes = '';

SELECT * from opav.ofertas where num_os = 'FOMS14136-19';
select prefacturar, facturado,parcial,factura_cliente,* from opav.acciones where id_solicitud = '927792' AND id_accion = '9046171';
--update opav.acciones set prefacturar = 'N', facturado = 'N' where id_solicitud = '925849' AND REG_STATUS != 'A'
select factura_cliente, last_update,* from opav.subclientes_ofertas where id_solicitud ='927792';--NM14616

--NM14561

--FOMS14136-19
opav.subclientes_ofertas:  NM14603


SELECT * FROM con.factura WHERE ref1 = 'FOMS14136-19' AND documento = 'NM14624_1';

--UPDATE con.factura SET valor_factura = 32136351.6, valor_saldo = 32136351.6,  valor_facturame = 32136351.6 , valor_saldome = 32136351.6
--WHERE ref1 = 'FOMS13626-18' AND documento = 'NM14624_1';

5.236.000
create TABLE tem.NM14616_1_det  AS;
select * from con.factura where documento='NM14625_1';
create TABLE tem.NM14616_1  AS;			--tem.NM14584_1_detfac
SELECT * FROM con.factura_detalle WHERE referencia_1 = '9046171';

create table tem.NM14616_1_cmp AS; 				--tem.NM14584_1_dett AS;
SELECT * FROM con.comprodet WHERE referencia_1 ='9046171';

create table tem.NM14616_1_cmpdt AS; 	
select * from con.comprobante where numdoc='NM14616_1';