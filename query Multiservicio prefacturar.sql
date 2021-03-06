select
                      case
                        when c.referencia is null and d.referencia is not null then to_number(d.referencia,'99.99')::numeric(5,2)
                        when (c.referencia is not null AND periodo=1)       then 0.00::numeric(5,2)
                        when (c.referencia is not null AND periodo!=1)       then to_number(d.referencia,'99.99')::numeric(5,2)
                        else 00.00
                      end as porcentaje_formula,
                      a.*
                    from
                      (select
                          a.contratista,
                          a.id_solicitud,
                          a.parcial,
                          a.id_accion,
                          b.id_cliente,
                          c.nomcli as nombre,
                          c.direccion,
                          c.ciudad,
                          a.descripcion,
                          a.material + a.mano_obra + a.transporte as costo_contratista,
                          a.material,
                          a.mano_obra,
                          a.transporte as otros,
                          a.bonificacion ,
     a.fintra,
                          a.administracion,
                          a.imprevisto,
                          a.utilidad,
                          a.base_iva_contratista,
                          a.iva_contratista,
                          d.num_os,
                          a.iva_bonificacion,
                          b.periodo,
                          case
                            when
                               d.noesvaloragregado = 0 then 'SI'
                            else
                               'NO'
                          end as valor_agregado,
     case
       when
       d.noesvaloragregado = 0 then (select referencia::character varying  from tablagen where table_type = 'FACTORING' and table_code = 'PORCENTAJE')
                            else
      (select
          e.referencia::character varying
       from
          (select
      case
        when h.tipo_punto = 'PUNTOS' then h.clase_dtf
        else 'MAXIMA'::character varying(8)
      end as tipo_dtf,
      h.periodo
           from
      opav.subclientes_ofertas h
           where
      h.id_solicitud = a.id_solicitud and
      h.parcial = a.parcial limit 1 ) b,
           tablagen e
       where
          e.table_type = b.tipo_dtf and
          e.table_code = trim(to_char(b.periodo, '99')) )
                          end as porcentaje_factoring,
                          b.estudio_economico,
                          b.factura_cliente,
                          c.nit
                        from
                          opav.acciones a,
                          opav.subclientes_ofertas b,
                          cliente c,
                          opav.ofertas d
                        where
                          a.contratista = 'CC761' and
                          a.reg_status != 'A' and
                          a.estado = '110' and
                          a.prefacturar_contratista = 'N' and
                          a.prefactura_contratista = '' and
                          a.id_solicitud = b.id_solicitud and
                          a.parcial = b.parcial  and
                          --b.factura_cliente != '' and
                          d.id_solicitud = a.id_solicitud and
                          --b.id_cliente=d.id_cliente and
                          c.codcli = b.id_cliente                          
                        order by
                          a.id_accion
                     ) a
                     left outer join
                     tablagen c on (c.table_type = 'FORMULA' and c.table_code = a.estudio_economico || ' ' || a.contratista)
                     left outer join
                     tablagen d on (d.table_type = 'FORMULA' and d.table_code = a.estudio_economico );--
                     
                     
                     SELECT * FROM opav.subclientes_ofertas WHERE id_solicitud = '923443';
                     SELECT * FROM 