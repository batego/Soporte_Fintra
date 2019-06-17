<div style="float:left">DETALLE PAGOS  - <% if(!listaConsolidados.isEmpty()){
    SeguimientoCarteraBeans titulo = (SeguimientoCarteraBeans) listaConsolidados.get(0);                                                      
%>  <%= titulo.getNombreCliente()%> <%}%> -  <%= Negocio%><input type="hidden" name="id_usuario" id="id_usuario" value="coco"/></div> 

   

//comentar
//    SeguimientoCarteraBeans titulo = (SeguimientoCarteraBeans) listaConsolidados.get(0);