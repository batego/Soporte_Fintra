SELECT 
	sp.identificacion, sp.nombre, sa.numero_solicitud,sa.valor_solicitado,
	c.nombre as nom_convenio,c.nit_tercero, c.factura_tercero, c.id_convenio, sa.plazo, sa.plazo_pr_cuota,
	sa.tipo_negocio, sa.cod_sector, sa.cod_subsector, s.nombre as sector, sb.nombre as subsector,sa.cod_subsector,  pc.id_prov_convenio, sa.fianza
FROM 
			solicitud_aval 		sa 
	INNER JOIN 	convenios 		c ON c.id_convenio=sa.id_convenio
	INNER JOIN 	prov_convenio 		pc ON ( c.id_convenio = pc.id_convenio and pc.reg_status!='A' and pc.nit_proveedor=sa.afiliado)
	INNER JOIN 	solicitud_persona 	sp ON sa.numero_solicitud=sp.numero_solicitud 
	INNER JOIN 	sector 			s ON (sa.cod_sector=s.cod_sector and s.cod_sector=pc.cod_sector )
	INNER JOIN 	subsector 		sb ON (sa.cod_subsector=sb.cod_subsector and sa.cod_sector=sb.cod_sector and sb.cod_subsector = pc.cod_subsector and sb.cod_subsector = pc.cod_subsector )
	INNER JOIN 	convenios_cxc 		cc ON (cc.id_convenio=c.id_convenio and sa.tipo_negocio=cc.titulo_valor)
WHERE 	
	sp.tipo='S' 
	and sa.afiliado='9001144394' 
	and ((estado_sol='P' and cod_neg is null) or estado_sol='Q') 



select id_convenio, afiliado, numero_solicitud,cod_sector,tipo_negocio,*
from solicitud_aval	
WHERE cod_neg = 'FE00041' --and afiliado='8901016819'			-- id_convenio: 58  --afiliado'9001144394' --solicitud: 122804

select cod_sector,* from prov_convenio where id_convenio = 58 and reg_status!='A' and nit_proveedor = '9001144394'
select tipo, * from solicitud_persona where numero_solicitud = 122804 
SELECT * FROM sector WHERE  cod_sector = 'M80' and cod_sector='CS2'
SELECT * FROM convenios_cxc cc WHERE Id_convenio = '58' and titulo_valor = '03'




    select distinct pc.nit_proveedor, p.payment_name
    from usuario_prov_convenio 	upc
    join prov_convenio 		pc on upc.id_prov_convenio = pc.id_prov_convenio
    join proveedor 		p  on p.nit = pc.nit_proveedor
    where 
	upc.reg_status != 'A'
	and p.reg_status != 'A'
	and p.afiliado='S'
	and upc.idusuario = 'LTESILLO'

select cod_sector, cod_subsector from negocios where cod_neg= 'FE00041' 	--'M80';'50'

select cod_sector, cod_subsector from solicitud_aval WHERE cod_neg = 'FE00041'  --'CS2';'102'

-- update solicitud_aval set cod_sector = 'CS2', COD_SUBSECTOR = '102'
-- WHERE cod_neg = 'FE00041' 