 SELECT * FROM sector WHERE reg_status!='A';
 SELECT * FROM subsector WHERE reg_status!='A';
 
 
 
 SELECT s.cod_sector, s.nombre, ss.cod_subsector, ss.nombre 
 FROM sector s
 INNER JOIN subsector ss ON (ss.cod_sector = s.cod_sector)
 WHERE s.reg_status != 'A'
 ORDER BY s.nombre, ss.cod_subsector;