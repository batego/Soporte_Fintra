CREATE TABLE tem.ingr_IA484189 AS;		SELECT * FROM tem.ingr_IA484189;
SELECT periodo, fecha_contabilizacion,* FROM con.ingreso WHERE num_ingreso = 'IA484189';

CREATE TABLE tem.ingrdt_IA484189 AS;
SELECT fecha_contabilizacion, periodo,* FROM con.ingreso_detalle WHERE num_ingreso = 'IA484189';


SELECT * FROM con.comprobante WHERE numdoc = 'IA484189';
SELECT * FROM con.comprodet WHERE numdoc = 'IA484189';

