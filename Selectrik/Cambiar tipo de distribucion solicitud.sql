select tipo_solicitud,tipodistribucion , * from opav.ofertas 
--update opav.ofertas set tipo_solicitud = 'Alcaldia_1', tipodistribucion = '38'
where id_solicitud in ('925827');

select * from opav.tipo_distribucion_eca 
--update opav.tipo_distribucion_eca  set porc_iva= 19
where tipo in ('38') and valor_agregado = 'N'
order by tipo;

select * from tablagen where table_type in ('TIPO_OFERT') and reg_status = ''
select * from tablagen where table_type in ('TIPO_DISTR') and reg_status = ''

'67'
'38'
'53'
'61'
'1'
'65'
'64'


select * from opav.acciones 
--update opav.acciones  set facturado = 'N'
where id_solicitud in ('922800','925133')

select tipo_solicitud,tipodistribucion , * from opav.ofertas 
--update opav.ofertas set tipo_solicitud = 'Alcaldia_1'--, tipodistribucion = '1'
where tipo_solicitud ilike '%ALCALDIA_1%' LIMIT 1000

