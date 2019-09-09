<%@page import="com.Stortacco.beans.Productos"%>
<%@page import="com.Stortacco.beans.Ventas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="Estilos/css/toastr.css">


    </head>

    <%@include file="header.jsp" %>

    <body onload="mueveReloj()" class="bodycont">

        <!--Bienvenida-->
        <div class="Bienvenido">
            <div class="bi">
                <p> Registrar Venta </p>
            </div>
        </div>

        <!-- Listamiento de ventas incompleta -->
        <div class="Venta">
            <section class="cuerpo">
                <div class="cuerpoNav">
                    <button type="button" onclick="window.location = 'Ventas'" class="btn">Mesas</button>
                </div>
                <div class="cajRegistrarVenta">
                    <form method="POST" id="formVenta" action="Venta">
                        <%  nombreU = "";
                            String numMesa = "";

                            if (se.getAttribute("Nombre") != null) {
                                nombreU = (String) se.getAttribute("Nombre");
                                numMesa = (String) request.getParameter("Mesa");
                            }%>
                        <div class="headerRegistrarVenta">
                            <div class="hUsuarioRegistrarVenta">
                                <label for="nomusuarioRV">Usuario:</label>
                                <input disabled value="<%= nombreU%>" type="text" class="form-control" id="nomusuarioRV" name="nomusuarioRV">
                            </div>
                            <div class="hFechaRegistrarVenta">
                                <label for="fechaRV">Fecha:</label>
                                <input disabled type="text" class="form-control" id="fechaRV" name="fechaRV">
                            </div>
                            <div class="hHoraRegistrarVenta">
                                <label for="horaRV">Hora:</label>
                                <input disabled type="text" class="form-control" id="horaRV" name="horaRV">
                            </div>
                            <div class="hMesaRegistrarVenta">
                                <label for="mesaRV">Mesa:</label>
                                <input disabled value="<%= numMesa%>" type="text" class="form-control" id="mesaRV" name="mesaRV">
                            </div>
                        </div>

                        <div class="aggRegistrarVenta">
                            <div>
                                <div class="aggNombreRegistrarVenta" >
                                    <label for="nombreRV">Nombre:</label>
                                    <select onchange="autocompletadoAggProducto()" class="form-control" name="nombreRV" id="nombreRV">
                                        <option value="">Seleccione</option>
                                        <% ArrayList<Productos> apr = (ArrayList) request.getAttribute("listaP");
                                            for (Productos pr : apr) {%>
                                        <option data-nombreprod="<%= pr.getNombre()%>" value="<%= pr.getCategoria()%>"><%= pr.getNombre()%></option>
                                        <% }%>
                                    </select>
                                </div>
                                <div id="aggProductoRegistrarVenta" class="aggProductoRegistrarVenta" >
                                    <label for="categoriaRV">Categoria:</label>
                                    <select class="form-control" name="categoriaRV" id="categoriaRV"></select>
                                </div>
                                <div class="aggButonRegistrarVenta">
                                    <button type="button" id="buttonRV" class="btn">Agregar Producto</button>
                                </div>
                            </div>

                        </div>
                        <div class="bodyRegistrarVenta">
                            <div class="bodyTableRegistrarVenta">
                                <table class="table-bordered table">
                                    <thead>
                                        <tr>

                                            <th>Nombre</th>
                                            <th>Categoria</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>

                                    <tbody id="tablaProductos">
                                        <tr id ="nohay">
                                            <td colspan="5" align="center">No hay Productos</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="bodyInfoRegistrarVenta">
                                <div class="bodyTotalRegistrarVenta">
                                    <label for="totalRV">Total:</label>
                                    <!--<span id="totalTodo">0</span>-->
                                    <input disabled type="text" class="form-control" id="totalRV" name="totalRV" >
                                </div>
                                <div class="bodyPagaRegistrarVenta">
                                    <label for="pagaRV">Paga:</label>
                                    <input type="text" class="form-control" onkeyup="formatPago(this.value)" id="pagaRV" name="pagaRV">
                                </div>
                                <div class="bodyCambioRegistrarVenta">
                                    <label for="cambioRV">Cambio:</label>
                                    <input disabled type="text" class="form-control" id="cambioRV" name="cambioRV">
                                </div>
                                <div class="bodyRegistrarRegistrarVenta">
                                    <button type="button" id="btnRV" class="btn">Registrar Venta</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>

        
        <script src="Estilos/js/regVentas.js"></script>
    </body>

</html>
