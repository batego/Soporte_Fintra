select * from opav.ofertas where num_os = 'FOMS13064-17'
select prefacturar, * from opav.acciones where id_solicitud = '925849' AND REG_STATUS = 'A'
update opav.acciones set prefacturar = 'N', facturado = 'N' where id_solicitud = '925849' AND REG_STATUS != 'A'