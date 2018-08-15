select estado_sol from solicitud_aval where cod_neg = 'LB01225'
select estado_neg, actividad from negocios where cod_neg = 'LB01225'			--'V';'STBY'


---------------------------------------------------------------------------------------------------------------

select estado_sol, numero_solicitud, * from solicitud_aval where cod_neg in ('MC15365','MC15361','MC15350')				--'V';'STBY'
update  solicitud_aval  set estado_sol = 'P' where cod_neg in ('MC15365','MC15361','MC15350')			--'V';'STBY'

select estado_neg, actividad from negocios where cod_neg = 'FE01676'						--'V';'STBY'
update negocios set estado_neg = 'P' , actividad = 'RAD' where cod_neg in ('MC15365','MC15361','MC15350')	--'V';'STBY'



SELECT ESTADO_SOL, numero_solicitud FROM SOLICITUD_AVAL WHERE cod_neg = 'MC15350'
SELECT * FROM SOLICITUD_persona WHERE numero_solicitud = '128954'
update SOLICITUD_persona set reg_status = '' WHERE numero_solicitud = '128954'

referenciacion 


MC15365
MC15361
MC15350

select * from solicitud_persona where identificacion = '8713676'
select * from cliente where nit = '8713676'
UPDATE cliente set nomcli = 'FRANCO CORTINA FREDDY CRISTOBAL' where nit = '8713676'

update solicitud_persona set identificacion = '1143259759' where identificacion = '1143259758'


