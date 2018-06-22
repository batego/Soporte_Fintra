select * from nit where cedula = '8784004'
select * from cliente where nit = '8784004' limit 10
select * from usuarios where nit = '8784004'

select * from administrativo.rel_jefatura_usuario where id_usuario like '%MCERTAIN%'
INSERT INTO administrativo.rel_jefatura_usuario VALUES(20,'','FINV',38,'JMONTERO','N',now(),'BTERRAZA',now(),'',5);
SELECT * FROM administrativo.rel_jefatura_usuario where id_proceso_interno = '38' and id_usuario = 'JMONTERO' 

select * from proceso_interno where id = '38'

 SELECT 
               *
            FROM administrativo.rel_jefatura_usuario r 
           
            INNER JOIN proceso_interno p ON (p.id = r.id_proceso_interno)
            INNER JOIN cia c ON (c.id = r.id_empresa)
            WHERE id_proceso_interno IN (SELECT id_proceso_interno FROM administrativo.rel_jefatura_usuario WHERE id_usuario = 'JMONTERO' )
            AND jefatura = 'S'



SELECT 
                idusuario
                --,p.descripcion
                --,c.description
                ,jefatura
            FROM administrativo.rel_jefatura_usuario r 
            INNER JOIN usuario_view_dblink u ON (u.idusuario = r.id_usuario)
            INNER JOIN proceso_interno p ON (p.id = r.id_proceso_interno)
            INNER JOIN cia c ON (c.id = r.id_empresa)
            WHERE id_proceso_interno IN (SELECT id_proceso_interno FROM administrativo.rel_jefatura_usuario WHERE id_usuario = 'JMONTERO' )
            AND jefatura = 'S'

select * from proceso_interno where id = '38' 
INSERT INTO proceso_interno VALUES(38,'',13,'PROCESO','DESARROLLO DE SOFTWARE','FINV',now(),'',now(),'','')
            
select * from usuario_view_dblink
--INNER JOIN usuarios u ON (u.idusuario = r.id_usuario)


select * from pasivo_vacacional