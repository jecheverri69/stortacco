<%@page import="com.Stortacco.beans.Ventas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ventas</title>
    </head>
    <%@include file="header.jsp" %>
    <body class="bodycont">

        <%String M = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("SI")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Registro exitoso!</strong> La venta se a registrado.
        </div>
        <% } else if (M.equals("NO")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> No se pudo registrar!
        </div>
        <%}%>
        <%}%>

        <!--Bienvenida-->
        <div class="Bienvenido">
            <div class="bi">  
                <p> Ventas </p>
            </div>
        </div>

        <!-- Listamiento de ventas incompleta -->
        <div class="Ventas">
            <section class="cuerpo">
                <div class="cuerpoNav">
                    <button type="button" id="BtnRegistrar" class="btn">Registrar Venta</button>
                    <button type="button" id="BtnListar" class="btn">Listar Venta</button>
                </div>
                <article class="botones-mesas" id="Registrar">
                    <button type="button" onclick="window.location = 'LRVentas?Mesa=1'" class="btn Registrar">Mesa 1</button>
                    <button type="button" onclick="window.location = 'LRVentas?Mesa=2'" class="btn Registrar">Mesa 2</button>
                    <button type="button" onclick="window.location = 'LRVentas?Mesa=3'" class="btn Registrar">Mesa 3</button>
                    <button type="button" onclick="window.location = 'LRVentas?Mesa=4'" class="btn Registrar">Mesa 4</button>
                    <button type="button" onclick="window.location = 'LRVentas?Mesa=5'" class="btn Registrar">Mesa 5</button>
                </article>
                <article id="Listar">
                    <%
                        ArrayList<Ventas> avt = (ArrayList) request.getAttribute("lista");
                    %>
                    <table class="tablasListar table-bordered table">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Usuario</th>
                                <th>Total</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                for (Ventas av : avt) {
                            %>
                            <tr>
                                <td><%=av.getFechaRegistro()%></td>
                                <td><%=av.getHoraRegistro()%></td>
                                <td><%=av.getIdUsuario()%></td>
                                <td><%=av.getTotal()%></td>

                                <td>
                                    <!-- <button type="button" class="btn btn-info"><span class="fas fa-eye"></span></button>
                                     <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal1"><span class="fas fa-edit"></span></button>
                                     <button type="button" class="btn btn-danger" onClick="window.location = 'EVenta?idP=' +<%= av.getIdventas()%>;"><span class="fas fa-trash-alt"></span></button>-->
                                    <button type="button" class="btn btn-dark" onClick="verFactura(<%= av.getIdventas()%>)"><span class="fas fa-file-upload"></span></button>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </article>
            </section>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
