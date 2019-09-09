<%@page import="com.Stortacco.beans.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
    </head>
    <%@include file="header.jsp" %>
    <body class="bodycont">


        <%String M = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("SI")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Registro exitoso!</strong> El proveedor se a registrado.
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

        <%String Mensaje = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("Y")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>El proveedor se a eliminado!</strong> 
        </div>
        <% } else if (M.equals("NO")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>No se pudo eliminar el proveedor!</strong> 
        </div>
        <% } else if (M.equals("NBD")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>No se encontro el proveedor en la base de datos!</strong> 
        </div>
        <%}%>
        <%}%>


        <!--Bienvenida-->
        <div class="Bienvenido">
            <div class="bi">  
                <p> Proveedores </p>
            </div>
        </div>

        <!-- Listamiento de proveedores -->
        <div class="Proveedor">
            <div>
                <section class="cuerpo">
                    <div class="cuerpoNav">
                        <button type="button" id="BtnListar" class="btn">Listar Proveedores</button>
                        <button type="button" id="BtnRegistrar" class="btn">Registrar Proveedor</button>
                    </div>
                    <article id="Registrar">
                        <form action="Proveedor" method="post" class="p-4 bg-dark-opaque" >
                            <h4 class="mb-4 text-center" id="h4">Registrar Proveedor</h4>

                            <div class="form-group" > 
                                <label for="nom">Nombres</label>
                                <input  type="text" class="form-control" placeholder="Ingrese el nombre" maxlength="45"  id="nom" name="nom" required> </div>


                            <div class="form-group"> 
                                <label for="tel">Telefono</label>
                                <input type="text" class="form-control" placeholder="Ingrese el telefono" maxlength="45"  id="tel" name="tel" required> 
                            </div>

                            <div class="form-group"> 
                                <label for="email">E-mail</label>
                                <input type="email" class="form-control" placeholder="Ingrese el E-mail" maxlength="45"  id="email" name="email" required> 
                            </div>


                            <div class="form-group"> 
                                <label for="dir">Dirección:</label>
                                <input type="text" class="form-control" placeholder="Ingrese la dirección" maxlength="45" id="dir" name="dir" > 
                            </div>

                            <div class="form-group"> 
                                <label for="ti">Tipo de identificacion</label>
                                <select class="form-control" id="ti" name="ti">

                                    <option value="NIT">Nit</option>
                                    <option value="O">Otra </option>
                                </select>
                            </div>

                            <div class="form-group"> 
                                <label for="ni">Número de identificación:</label> 	   	
                                <input type="text" class="form-control" placeholder="Ingrese el numero" maxlength="45"  id="ni" name="ni" required=""> 
                            </div>

                            <div class="form-group"> 
                                <label for="ncon">Nombre de Contacto</label>
                                <input type="text" class="form-control"  maxlength="45"  id="nc" name="ncon" required> 
                            </div>


                            <div class="bot">
                                <button type="submit" class="btn Registrar" value="registrar"><b>Registrar</b></button>
                                <button type="button" class="btn Cancelar"><b>Cancelar</b></button>
                            </div>

                        </form>
                    </article>
                    <article id="Listar">
                        <%
                            ArrayList<Proveedores> apr = (ArrayList) request.getAttribute("lista");
                        %>
                        <table class="tablasListar table-bordered table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Telefono</th>
                                    <th>Email</th>
                                    <th>Nombre Contacto</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    for (Proveedores pr : apr) {
                                %>
                                <tr>
                                    <td><%=pr.getNombre()%></td>
                                    <td><%=pr.getTelefono()%></td>
                                    <td><%=pr.getEmail()%></td>
                                    <td><%=pr.getNombreContacto()%></td>
                                    <td>
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal1" onclick="ProveedoresVer('<%=pr.getIdproveedores()%>', '<%= pr.getDireccion()%>', '<%= pr.getTipoIdentificacion()%>', '<%= pr.getNumeroIdentificacion()%>')"><span class="fas fa-eye"></span></button>
                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modal2" onclick="ProveedoresActualizar('<%=pr.getIdproveedores()%>', '<%=pr.getNombre()%>', '<%=pr.getTelefono()%>', '<%=pr.getEmail()%>', '<%= pr.getDireccion()%>', '<%= pr.getTipoIdentificacion()%>', '<%= pr.getNumeroIdentificacion()%>', '<%=pr.getNombreContacto()%>')"><span class="fas fa-edit"></span></button>
                                        <button type="button" class="btn btn-danger" onClick="window.location = 'EProveedor?idP=' +<%= pr.getIdproveedores()%>;"><span class="fas fa-trash-alt"></span></button>
                                    </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="modal fade" id="modal1" role="dialog">
                            <div class="modal-dialog modal-sm">


                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title"><span>Detalles  </span><span class="title-bottom"><span class="title-bottom fas fa-eye"></span></span></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="">
                                            <div>
                                                <div>
                                                    <p>idProveedores:</p>
                                                    <p  id="idProvee"></p>
                                                </div>
                                                <div>
                                                    <p>Direccion:</p>
                                                    <p  id="Dire"></p>
                                                </div>
                                            </div>
                                            <hr>
                                            <div>
                                                <div>
                                                    <p>Tipo Identificacion:</p>
                                                    <p id="Tipoi"></p>
                                                </div>
                                                <div>
                                                    <p>Numero Identificacion:</p>
                                                    <p  id="Numeroi"></p>
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
                                        <h4 class="modal-title"><span>Editar Proveedor</span><span class="title-bottom"><span class="fas fa-edit"></span></span></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="AProveedor" method="post">
                                            <div class="form-group" style="visibility:hidden; position:absolute; top:0;"> 
                                                <label>idProveedores</label>
                                                <input  type="text" class="form-control"   id="idproveedor" name="idproveedor" >
                                            </div>
                                            <div class="form-group" > 
                                                <label for="nombres">Nombres</label>
                                                <input  type="text" class="form-control"  maxlength="45"  id="nombres" name="nombres" required>
                                            </div>


                                            <div class="form-group"> 
                                                <label for="telefono">Telefono</label>
                                                <input type="text" class="form-control"  maxlength="45"  id="telefono" name="telefono" required> 
                                            </div>

                                            <div class="form-group"> 
                                                <label for="email1">E-mail</label>
                                                <input type="email" class="form-control"  maxlength="45"  id="email1" name="email1" required> 
                                            </div>


                                            <div class="form-group"> 
                                                <label for="direccion">Dirección:</label>
                                                <input type="text" class="form-control"  maxlength="45" id="direccion" name="direccion" > 
                                            </div>

                                            <div class="form-group"> 
                                                <label for="tipoi">Tipo de identificacion</label>
                                                <select class="form-control" id="tipoi" name="tipoi">

                                                    <option value="NIT">Nit</option>
                                                    <option value="O">Otra </option>
                                                </select>
                                            </div>

                                            <div class="form-group"> 
                                                <label for="numeroi">Número de identificación:</label> 	   	
                                                <input type="text" class="form-control"  maxlength="45"  id="numeroi" name="numeroi" required=""> 
                                            </div>

                                            <div class="form-group"> 
                                                <label for="nombrecon">Nombre de Contacto</label>
                                                <input type="text" class="form-control"  maxlength="45"  id="nombrecon" name="nombrecon" required> 
                                            </div>


                                            <div>
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
        <%@include file="footer.jsp" %>
    </body>

</html>
