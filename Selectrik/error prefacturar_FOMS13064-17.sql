ERROR PREFACTURA CONTRATISTA
Buenos dias

Por favor su colaboracion con este caso , la prefactura correspondiente al Multiservicio FOMS13064-17 no aparece en el sistema

CREATE TABLE tem.id_sol_925849 AS;
SELECT * FROM opav.acciones WHERE id_solicitud = '925849'; --AND contratista = 'CC761';

SELECT * FROM opav.ofertas WHERE  num_os = 'FOMS13064-17';
SELECT * FROM cliente WHERE codcli = 'CS31958'; --890900608

SELECT * FROM con.factura WHERE ref1 = 'FOMS13064-17'; --890900608

SELECT * FROM con.comprobante WHERE numdoc in ('R0035698','R0035699','R0035700');
SELECT * FROM con.comprodet WHERE numdoc in ('R0035698','R0035699','R0035700');
