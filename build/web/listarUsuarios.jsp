<%@page import="com.Stortacco.beans.InformacionUsuarios"%>
<%@page import="com.Stortacco.beans.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <%@include file="header.jsp" %>
    <body class="bodycont">

        <%String M = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("Y")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Usuario Eliminado!</strong> 
        </div>
        <% } else if (M.equals("N")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>No se pudo eliminar el Usuario!</strong> 
        </div>
        <% } else if (M.equals("NBD")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> 
        </div>
        <% } else if (M.equals("NULL")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> 
        </div>
        <%}%>
        <%}%>

        <!--Bienvenida-->
        <div class="Bienvenido">
            <div class="bi">  
                <p> Usuarios </p>
            </div>
        </div>

        <!-- Listamiento de Usuarios -->
        <div class="Usuarios">
            <div>
                <section class="cuerpo">
                    <div class="cuerpoNav">
                        <button type="button" id="BtnListar" class="btn">Listar Usuarios</button>
                        <button type="button" id="BtnRegistrar" class="btn">Registrar Usuario</button>
                    </div>
                    <article id="Registrar">
                        <form action="Usuario" method="post" class="p-4 bg-dark-opaque" >
                            <h4 class="mb-4 text-center" id="h4">Bienvenido Stortacco</h4>

                            <div class="form-group" > <label for="nom">Nombres</label>
                                <input  type="text" class="form-control" placeholder="Ingrese su nombre" maxlength="50"  id="nom" name="nom" required> </div>


                            <div class="form-group"> <label for="ape">Apellidos</label>
                                <input type="text" class="form-control" placeholder="Ingrese sus apellidos" maxlength="60"  id="ape" name="ape"> </div>


                            <div class="form-group"> <label for="fn">Fecha de Nacimiento</label>
                                <input type="date" class="form-control"   id="fn" name="fn"> </div>


                            <div class="form-group"> 
                                <label for="ti">Tipo de identificacion</label>
                                <select class="form-control" id="ti" name="ti">
                                    <option value="CC">Cedula de ciudadania</option>
                                    <option value="CE">Cedula de extranejeria</option>
                                    <option value="NIT">Nit</option>
                                    <option value="O">Otra </option>
                                </select>
                            </div>

                            <div class="form-group"> 
                                <label for="ni">Número de identificación:</label> 	   	
                                <input type="text" class="form-control" placeholder="Ingrese el numero" maxlength="45" id="ni" name="ni"> 
                            </div>


                            <div class="form-group"> 
                                <label for="dir">Dirección:</label>
                                <input type="text" class="form-control" placeholder="Ingrese su dirección" maxlength="40" id="dir" name="dir"> 
                            </div>


                            <div class="form-group"> 
                                <label for="tel">Telefono</label>
                                <input type="text" class="form-control" placeholder="Ingrese su telefono" maxlength="30"  id="tel" name="tel"> 
                            </div>

                            <div class="form-group"> 
                                <label for="email">E-mail</label>
                                <input type="text" class="form-control" placeholder="Ingrese su E-mail" maxlength="45"  id="email" name="email"> 
                            </div>

                            <div class="form-group"> 
                                <label for="contra">Contraseña</label>
                                <input type="password" class="form-control"  maxlength="45"  id="contra" name="contra"> 
                            </div>

                            <div class="form-group"> 
                                <label for="rol">Rol</label>
                                <select class="form-control" id="rol" name="rol" required>
                                    <option value="gerente">Gerente</option>
                                    <option value="cliente">Cliente</option>

                                </select>
                            </div>



                            <div class="bot">
                                <button type="submit" class="btn Registrar" value="registrar"><b>Registrarse</b></button>
                                <button type="button" class="btn Cancelar"><b>Cancelar</b></button>
                            </div>

                        </form>
                    </article>
                    <article id="Listar">
                        <%
                            ArrayList<InformacionUsuarios> aius = (ArrayList) request.getAttribute("lista");

                        %>
                        <table class="tablasListar table-bordered table">
                            <thead>
                                <tr>

                                    <th>Nombre</th>
                                    <th>Apelllido</th>
                                    <th>Identificacion</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Acciones</th>



                                </tr>
                            </thead>

                            <tbody>
                                <%  for (InformacionUsuarios ius : aius) {
                                %>
                                <tr>

                                    <td><%=ius.getNombre()%></td>
                                    <td><%=ius.getApellidos()%></td>
                                    <td><%=ius.getNumeroIdentificacion()%></td>
                                    <td><%=ius.getEmail()%></td>
                                    <td><%=ius.getRol()%></td>
                                    <td>
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1" onclick="UsuariosVer('<%=ius.getIdUsuario()%>', '<%= ius.getFechaRegistro()%>', '<%= ius.getFechaNacimiento()%>', '<%= ius.getDireccion()%>', '<%= ius.getTelefono()%>')"><span class="fas fa-eye"></span></button>
                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal2" onclick="UsuariosActualizar('<%=ius.getIdUsuario()%>', '<%=ius.getPassword()%>', '<%=ius.getRol()%>', '<%=ius.getNombre()%>', '<%=ius.getApellidos()%>', '<%=ius.getFechaNacimiento()%>', '<%=ius.getTarjetaIdentificacion()%>', '<%=ius.getNumeroIdentificacion()%>', '<%= ius.getDireccion()%>', '<%= ius.getTelefono()%>')"><span class="fas fa-edit"></span></button>
                                        <button type="button" class="btn btn-danger" onClick="window.location = 'EUsuario?idP=<%= ius.getIdUsuario()%>'"><span class="fas fa-trash-alt" ></span></button>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="modal fade" id="modal1" role="dialog">
                            <div class="modal-dialog modal-sm">


                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><span>Detalles Usuarios </span><span class="title-bottom"><span class="fas fa-eye"></span></span></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class=" modal-body">
                                        <div class="">
                                            <div>
                                                <div>
                                                    <p>idUsuarios:</p>
                                                    <p  id="idUsu"></p>
                                                </div>
                                                <div>
                                                    <p>Fecha de Registro:</p>
                                                    <p  id="fechar"></p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div>
                                                <div>
                                                    <p>Fecha de Nacimiento:</p>
                                                    <p id="fechan"></p>
                                                </div>
                                                <div>
                                                    <p>Direccion:</p>
                                                    <p  id="dire"></p>
                                                </div>
                                                <div>
                                                    <p>Telefono:</p>
                                                    <p  id="tele"></p>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="modal2" role="dialog">
                            <div class="modal-dialog modal-sm">


                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><span>Editar Usuario</span><span class="title-bottom"><span class="fas fa-edit"></span></span></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="AUsuario" method="post">
                                            <div class="form-group" style="visibility:hidden; position:absolute; top:0;"> 
                                                <label>idUsuarios</label>
                                                <input  type="text" class="form-control"   id="idusuarioo" name="idusuarioo" >
                                            </div>



                                            <div class="form-group" > <label for="nombre">Nombres</label>
                                                <input  type="text" class="form-control"  maxlength="50"  id="nombre" name="nombre" required> 
                                            </div>


                                            <div class="form-group"> <label for="apellido">Apellidos</label>
                                                <input type="text" class="form-control"  maxlength="60"  id="apellido" name="apellido"> 
                                            </div>


                                            <div class="form-group"> <label for="fechan">Fecha de Nacimiento</label>
                                                <input type="date" class="form-control"   id="fechanaci" name="fechanaci"> 
                                            </div>


                                            <div class="form-group"> 
                                                <label for="tipoi">Tipo de identificacion</label>
                                                <select class="form-control" id="tipoi" name="tipoi">
                                                    <option value="CC">Cedula de ciudadania</option>
                                                    <option value="CE">Cedula de extranejeria</option>
                                                    <option value="NIT">Nit</option>
                                                    <option value="O">Otra </option>
                                                </select>
                                            </div>

                                            <div class="form-group"> 
                                                <label for="numeroi">Número de identificación:</label> 	   	
                                                <input type="text" class="form-control"  maxlength="45" id="numeroi" name="numeroi"> 
                                            </div>


                                            <div class="form-group"> 
                                                <label for="direccion">Dirección:</label>
                                                <input type="text" class="form-control" maxlength="40" id="direccion" name="direccion"> 
                                            </div>


                                            <div class="form-group"> 
                                                <label for="telefono">Telefono</label>
                                                <input type="text" class="form-control"  maxlength="30"  id="telefono" name="telefono"> 
                                            </div>



                                            <div class="form-group"> 
                                                <label for="contrasena">Contraseña</label>
                                                <input type="password" class="form-control"  maxlength="45"  id="contrasena" name="contrasena"> 
                                            </div>

                                            <div class="form-group"> 
                                                <label for="rol1">Rol</label>
                                                <select class="form-control" id="rol1" name="rol1" required>
                                                    <option value="gerente">Gerente</option>
                                                    <option value="cliente">Cliente</option>

                                                </select>
                                            </div>



                                            <div class="footer">
                                                <button type="submit" class="btn Registrar" ><b>Actualizar</b></button>
                                                <button type="button" class="btn Cancelar"><b>Cancelar</b></button>
                                            </div>
                                        </form>
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
