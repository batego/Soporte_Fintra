select * from apicredit.usuarios_portal 

-Modificar usuario credi100 --

--1 Consultamos por los datos que nos entreguen ya sea cc o nombre de la persona para verificar los datos erroneos
select * from usuarios where nit = '914979221081980'


select * from apicredit.usuarios_portal where  idusuario IN ('LLUNA'),'KCOMAS','RROMERO','EMARTINEZ','MBAYONA','RDELASSALAS','MMARTINEZ')

email = 'metropolitanocc.paraiso@gmail.com'
update apicredit.usuarios_portal SET claveencr ='cABRHtDTbnw=' where idusuario = 'MALDANA'


--2 tenemos el select de validacion y el update para los cambios, primero se hace el update luego el select para confirmar los campos

select * from apicredit.usuarios_portal 
--update apicredit.usuarios_portal set claveencr = 'cABRHtDTbnw=', email = 'jabimadariaga@hotmail.com', idusuario ='jabimadariaga@hotmail.com', reg_status = ''
where identificacion = '22591035'

--Crear usuario credi100

--1 se solicitan los datos (nombre,cedula) y realizamos el insert'
INSERT INTO apicredit.usuarios_portal ( reg_status, 
					dstrct, 
					nombre,
					fecha_nacimiento,
					fecha_expedicion, 
					tipo_identificacion, 
					identificacion,
					email, 
					idusuario, 
					claveencr, 
					fecha_ultimo_ingreso, 
					empresa_ultimo_ingreso,
					ult_fecha_renovo_clave,
					num_dias_para_renovar_clave,
					cambioclavelogin,
					token_api,
					codigo_activacion,
					tipo_usuario, 
					creation_date)
				VALUES 
					('', 
					'FINV', 
					'Loly Luz Ovalle Perez', 
					'0099-01-01', 
					'0099-01-01', 
					'CED', 
					'1129532160', 
					'loly.2886@hotmail.com', 
					'LOVALLE', 
					'cABRHtDTbnw=', 
					'0099-01-01', 
					'',
					'0099-01-01 00:00:00',
					 0, 
					 true, 
					 '', 
					 '', 
					 'E', 
					 NOW());
-- 
-- 	update apicredit.usuarios_portal set idusuario = 'KTHERAN', PRIMER_NOMBRE = 'Kevin', PRIMER_APELLIDO = 'Theran' WHERE identificacion = '1143146752'
-- 	SELECT * FROM apicredit.usuarios_portal WHERE identificacion = '1143146752'

SELECT * FROM apicredit.usuarios_portal WHERE email = 'loly.2886@hotmail.com' 
update apicredit.usuarios_portal set reg_status = '', claveencr = 'cABRHtDTbnw=' WHERE IDENTIFICACION = '1047231959' 


1140874886	María Alejandra Peñaloza Castaño	malepenaloza@gmail.com	--OK mpenalozac 1234
1129532160	Loly Luz Ovalle Perez	 loly.2886@hotmail.com			--OK LOVALLE 1234
ya esta 32785545	Suleima del Carmen Anillo Herrera	sullyc10@hotmail.com --OK SANILLO 1234
ya esta 1048209987	Carlos Alberto Mejia Bolivar	 carlosmejia124@hotmail.com --OK CBOLIVAR 1234
ya esta 1047231959	Luisa Fernanda Tesillo Mendoza 	 luisatesillom1@gmail.com --OK ltesillom clave 1234