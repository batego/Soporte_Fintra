select * from nomenclaturas WHERE ID IN (select ID_NOMENCLATURA from nomenclaturas_direccion WHERE CIUDAD = 'BQ')			-- id: 13

select * from nomenclaturas WHERE ID IN (select ID_NOMENCLATURA from nomenclaturas_direccion WHERE CIUDAD IN (select CODCIU from ciudad where CODDPT = 'MAG'))			-- id: 13

CREATE TABLE tem.nom_dir_kn as 			--select * from tem.nom_dir_kn
select * from nomenclaturas_direccion WHERE CIUDAD IN (select CODCIU from ciudad where CODDPT = 'MAG') and ciudad = 'KN'


-- UPDATE nomenclaturas_direccion SET REG_STATUS = '' WHERE CIUDAD IN (select CODCIU from ciudad where CODDPT = 'MAG') and ciudad = 'KN'

select * from ciudad where CODDPT = 'MAG' nomciu ilike '%ARACATA%'
select * from ciudad where CODCIU in (select ciudad from nomenclaturas_direccion WHERE CIUDAD IN (select CODCIU from ciudad where CODDPT = 'MAG')) order by nomciu
-- update ciudad set nomciu = 'CIENAGA' where CODCIU = 'CI70'



SELECT * FROM SOLICITUD_PERSONA  WHERE CIUDAD = 'KN'