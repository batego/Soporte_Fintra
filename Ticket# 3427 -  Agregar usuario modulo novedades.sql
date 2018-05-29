select * from opciones_menu_modulos where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%Gestion%' AND usuario ilike '%dvale%';
select * from opciones_menu_modulos where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%Registro%' AND usuario ilike ?;
select * from opciones_menu_modulos where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%VistoBueno%' AND usuario ilike ?;

-- update  opciones_menu_modulos set usuario= usuario||','||'CURUETA' where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%Gestion%' 
-- update  opciones_menu_modulos set usuario= usuario||','||'CURUETA' where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%Registro%' 
-- update  opciones_menu_modulos set usuario= usuario||','||'CURUETA' where modulo='Recursos Humanos' AND reg_status='' AND ruta ilike '%VistoBueno%' 