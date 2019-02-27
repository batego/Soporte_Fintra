--Actualizar el registro con table_code = 'DESISTIDO' EN EL CAMPO REFERENCIA Y AGREGARLE UNA 'F'
SELECT *
            FROM tablagen
            WHERE table_type = 'CONCEPNEG' AND referencia like '%F%' AND reg_status = '' 
            ORDER BY table_code;
            
        