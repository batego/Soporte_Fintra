select 
                negocio
                ,cedula
                ,nombre_cliente
                ,cuota
                ,fecha_vencimiento
                , now()::date - fecha_vencimiento as dias_vencido_hoy
                ,vencimiento_mayor
                ,dias_vencidos
                ,status
                ,sum(valor_asignado) as valor_asignado
                ,sum(debido_cobrar) as debido_cobrar
                ,sum(interes_mora) as interes_mora
                ,sum(gasto_cobranza) as gasto_cobranza
            from sp_detallecarteraxsancion('201811','31','FE01599') as coco(negocio varchar, cedula varchar, nombre_cliente varchar, cuota varchar, documento varchar, fecha_vencimiento date, dias_vencidos numeric, vencimiento_mayor varchar, status varchar, valor_asignado numeric, debido_cobrar numeric, interes_mora numeric,gasto_cobranza numeric )  
                group by 
                negocio
                ,cedula
                ,nombre_cliente
                ,cuota
                ,fecha_vencimiento
                ,vencimiento_mayor
                ,status 
                ,dias_vencidos           
                order by cuota::NUMERIC;