CREATE TABLE tem.ing_IC258182 AS; 
SELECT * FROM con.ingreso WHERE num_ingreso = 'IC258182';
--delete FROM con.ingreso WHERE num_ingreso = 'IC258182';

CREATE TABLE tem.ingdet_IC258182 AS 
SELECT * FROM con.ingreso_detalle WHERE num_ingreso = 'IC258182';
--delete FROM con.ingreso_detalle WHERE num_ingreso = 'IC258182';

CREATE TABLE tem.comp_IC258182 AS 
SELECT * FROM con.comprobante WHERE numdoc = 'IC258182';
--delete FROM con.comprobante WHERE numdoc = 'IC258182';

CREATE TABLE tem.comdet_IC258182 AS 
SELECT * FROM con.comprodet WHERE numdoc = 'IC258182';
--delete FROM con.comprodet WHERE numdoc = 'IC258182';

