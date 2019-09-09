<%@page import="com.Stortacco.beans.Reservas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservas</title>

    </head>
    <%@include file="header.jsp" %>
    <body class="bodycont">


        <%String M = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("SI")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Registro exitoso!</strong> La reserva se a registrado.
        </div>
        <% } else if (M.equals("NO")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> No se pudo registrar!
        </div>
        <% } else if (M.equals("NBD")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> No se pudo registrar!
        </div>
        <%}%>
        <%}%>

        <!--Bienvenida-->
        <div class="Bienvenido">
            <div class="bi">  
                <p> Reservas </p>
            </div>
        </div>

        <!-- Listamiento de Reservas -->
        <div class="Reservas">
            <div>
                <section class="cuerpo">
                    <div class="cuerpoNav">
                        <button type="button" id="BtnListar" class="btn">Listar Reservas</button>
                        <button type="button" id="BtnRegistrar" class="btn">Registrar Reserva</button>
                    </div>
                    <article id="Registrar">
                        <form action="Reserva" method="post" class="p-4 bg-dark-opaque" >
                            <h4 class="mb-4 text-center" id="h4">Registrar Reserva</h4>

                            <div class="form-group" > <label for="fr">Fecha de Reserva</label>
                                <input  type="date" class="form-control"  id="fr" name="fr" required> </div>


                            <div class="form-group"> 
                                <label for="hr">Hora de Reserva</label>
                                <input type="time" class="form-control"  required  id="hr" name="hr"> 
                            </div>

                            <div class="form-group"> 
                                <label for="np">Numero de Personas</label>
                                <input type="text" class="form-control"  maxlength="11" pattern="[1-9.]+" id="np" name="np" required>
                            </div>



                            <div class="form-group"> 
                                <label for="nu">Nombre de Usuario</label>
                                <input type="text" class="form-control"  maxlength="11" pattern="[1-9.]+"  id="nu"  name="nu" required>
                            </div>

                            <div class="bot">
                                <button type="submit" class="btn Registrar" value="registrar"><b>Registrar</b></button>
                                <button type="button" class="btn Cancelar"><b>Cancelar</b></button>
                            </div>

                        </form>
                    </article>
                    <article id="Listar">
                        <%
                            ArrayList<Reservas> are = (ArrayList) request.getAttribute("lista");
                        %>
                        <table class="tablasListar table-bordered table">
                            <thead>
                                <tr>
                                    <th>Fecha Reserva</th>
                                    <th>Hora Reserva</th>
                                    <th>Número de Personas</th>
                                    <th>Usuario</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    for (Reservas re : are) {
                                %>
                                <tr>
                                    <td><%=re.getFechaReserva()%></td>
                                    <td><%=re.getHoraReserva()%></td>
                                    <td><%=re.getNumeroPersonas()%></td>
                                    <td><%=re.getIdUsuario()%></td>

                                    <td>   
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1" onclick="ReservasVer('<%=re.getIdreservas()%>')"><span class="fas fa-eye"></span></button>
                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal"><span class="fas fa-edit"></span></button>
                                        <button type="button" class="btn btn-danger" onClick="window.location = 'EReserva?idP=' +<%= re.getIdreservas()%>;"><span class="fas fa-trash-alt" ></span></button>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="modal fade" id="modal1" role="dialog">
                            <div class="modal-dialog modal-sm">


                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><span>Detalles Reservas </span><span class="title-bottom"><span class="title-bottom fas fa-eye"></span></span></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class=" modal-body">
                                        <div class="">
                                            <div>
                                                <div>
                                                    <p>idReservas:</p>
                                                    <p  id="idreser"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </article>
                </section>
            </div>
        </div>
    </body>
    <%@include file="footer.jsp" %>
</html>
