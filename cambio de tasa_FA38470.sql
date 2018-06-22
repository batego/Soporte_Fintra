-- Ticket# 3602
-- ERROR EN TASA
-- Muy buenos días. Intentando reliquidar un crédito el sistema no me lo permite por el cambio de tasa. 
-- Por favor hacer los correctivos ya que en este tiempo las reliquidaciones son muy comunes y se necesita dar al cliente rapidez en su crédito. 
-- Muchas gracias por su diligencia y apoyo !!!

update negocios set  tasa = '2.238'  where cod_neg in ('FA38470')

select tasa, * from negocios where cod_neg = 'FA38470'