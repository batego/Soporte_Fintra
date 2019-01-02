

select 
      cuenta, 
      periodo, 
      creation_date, 
      numdoc, 
      tipodoc, 
      (select nomcli from cliente where nit = tercero) as nombre,
      VALOR_DEBITO,
      VALOR_CREDITO
from COMPRODET 
where 
      TERCERO = '72185157'
order by periodo, numdoc;
