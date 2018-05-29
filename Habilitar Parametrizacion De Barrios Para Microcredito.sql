SELECT nd.id, nombre, nd.id_nomenclatura
            FROM nomenclaturas_direccion nd
            INNER JOIN nomenclaturas n on n.id = nd.id_nomenclatura
            WHERE ciudad IN('MT') AND n.reg_status = ''
            --ORDER BY id;

SELECT * FROM nomenclaturas_direccion WHERE CIUDAD IN ('SI')
INSERT INTO nomenclaturas_direccion VALUES(7001,'','FINV',6,'SI','0099-01-01 00:00:00','',NOW(),'BTERRAZA');
INSERT INTO nomenclaturas_direccion VALUES(7002,'','FINV',13,'SI','0099-01-01 00:00:00','',NOW(),'BTERRAZA');
INSERT INTO nomenclaturas_direccion VALUES(7003,'','FINV',7,'SI','0099-01-01 00:00:00','',NOW(),'BTERRAZA');


5241;'';'FINV';6;'MT';'0099-01-01 00:00:00';'';'2017-04-04 09:19:20.345791';''
5239;'';'FINV';13;'MT';'0099-01-01 00:00:00';'';'2016-07-25 11:31:37.739079';'MCASTILLO'
5240;'';'FINV';7;'MT';'0099-01-01 00:00:00';'';'2016-07-25 11:31:37.739079';'MCASTILLO'


MONTERIA = MT
3181;'#';		10
3182;'Calle';		1
3183;'Carrera';		2
3184;'Diagonal';	4
3185;'Transversal';	8
3186;'Avenida';		11
3187;'Kilometro';	12
5241;'Lote';		6
5239;'Sector';		13
5240;'Manzana';		7


siNCELEJO = SI
4805;'#';		10
4806;'Calle';		1
4807;'Carrera';		2
4808;'Diagonal';	4
4809;'Transversal';	8
4810;'Avenida';		11
4811;'Kilometro';	12



habilitar parametrizacion de barrios para microcredito