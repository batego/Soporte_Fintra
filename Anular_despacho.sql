select * from opav.sl_despacho_ocs where cod_ocs = 'OC00869-1'
select * from opav.sl_despacho_detalle where id_despacho = (select id from opav.sl_despacho_ocs where cod_ocs = 'OC00869-1')