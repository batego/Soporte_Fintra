
--CREATE TABLE indemn_MC08337 AS 
SELECT * FROM administrativo.control_indemnizacion_fianza WHERE negocio = 'MC08337';
--delete FROM administrativo.control_indemnizacion_fianza WHERE negocio = 'MC08337';
SELECT * FROM administrativo.historico_deducciones_fianza WHERE negocio = 'MC08337';

-- Tabla de bacup indemnizacion de negocio MC08337
--INSERT INTO administrativo.control_indemnizacion_fianza SELECT * FROM indemn_MC08337;
SELECT * FROM indemn_MC08337;

SELECT * FROM tem.facturas_indemnizar_fianza_micro WHERE negocio = 'MC08337';

-----------------------------------------------------------------------------------------
select * from con.foto_cartera where negasoc = 'MC08337';