SELECT o.estado,c.nomcli, * FROM opav.ofertas o
INNER JOIN cliente c ON (o.id_cliente = c.codcli)
WHERE o.id_solicitud= '926617';

SELECT * FROM opav.acciones WHERE id_solicitud= '926617';
SELECT * FROM opav.sl_estados_etapas_ofertas;

SELECT * FROM cliente WHERE codcli = 'CS32621';--900210320 UNION TEMPORAL AFA-AIEC
SELECT * FROM cliente WHERE nit = '900843992'; --selectrick


SELECT * FROM con.factura WHERE documento = 'FPA00074'; 
SELECT * FROM con.factura_detalle WHERE documento = 'FPA00074'; 

SELECT * FROM CON.comprobante WHERE numdoc = 'FPA00074';
SELECT * FROM CON.comprodet WHERE numdoc = 'FPA00074';

