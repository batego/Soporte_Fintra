-- SOporte correccion T0 con error en el valor
-- el valor de los interese se calculan en base a la ultmia linea de la lista

select *,i.nombre_subcuenta
        from movimientos_captaciones m
        inner join inversionista i on(i.nit=m.nit and i.subcuenta=m.subcuenta)
        where m.dstrct= 'FINV' and m.nit =  '85465887' and m.subcuenta = '1' and estado in('','T')   and  replace (substring(fecha,0,8),'-','')::integer >= replace (substring(now(),0,8),'-','')::integer order by fecha asc,no_transaccion
        
    	CREATE TABLE tem.sr_jose AS; 
        SELECT *  from movimientos_captaciones WHERE nit = '7421827' ORDER BY creation_date;
        
        SELECT * FROM con.ingreso WHERE creation_date::date = '2019-04-29' AND nitcli = '7421827'; 
        SELECT * FROM con.ingreso_detalle WHERE num_ingreso ='IC354495';
     
       
       update movimientos_captaciones SET saldo_final = 279831509.33 WHERE nit = '7421827' AND no_transaccion = 'T09106';
       
      
      SELECT * FROM movimientos_captaciones
      WHERE nit = '7421827' AND no_transaccion = 'T09101'
       AND banco = 'CAJA TESORERIA' AND concepto_transaccion = 'Saldo Baterias' AND fecha ='2019-04-29 00:00:00';
       
       