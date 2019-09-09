<%@page import="com.Stortacco.beans.InformacionUsuarios"%>
<%@page import="com.Stortacco.beans.Usuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/css/registrar.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <title>Invitados</title>

        <%@include file="header.jsp" %>
    </head>
    <body class="body2">

        <%String M = request.getParameter("mensaje");
            if (M != null) {%>

        <% if (M.equals("SI")) { %>
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Registro exitoso!</strong> El usuario se a registrado.
        </div>
        <% } else if (M.equals("NO")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> No se pudo registrar
        </div>
        <% } else if (M.equals("NBD")) { %>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong>Error!</strong> No se pudo registrar!
            <% } else if (M.equals("NULL")) { %>
            <div class="alert alert-warning alert-dismissible">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                <strong>Error!</strong> No se pudo registrar , No eres mayor de edad!
            </div>
            <%}%>
            <%}%>



            <!-- ventana de registrar -->
            <div class="py-5" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-3"> </div>
                        <div class="col-lg-6 p-3 animate-in-down">
                            <form class="p-4 bg-dark-opaque" action="Usuario" method="POST" id="Registrar">
                                <h4 class="mb-4 text-center" id="h4">Bienvenido Stortacco</h4>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Nombres</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese su nombre" maxlength="60" name="nom" required>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Apellidos</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese sus apellidos" maxlength="60" name="ape" required>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Fecha Nacimiento</span>
                                    </div>
                                    <input type="date" class="form-control" placeholder="Ingrese su fecha de nacimiento" maxlength="60" name="fn">
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text t">C.C</label>
                                    </div>
                                    <select class="custom-select" id="ti" name="ti">
                                        <option value="CC">Cedula de ciudadania</option>
                                        <option value="CE">Cedula de extranejeria</option>
                                        <option value="NIT">Nit</option>
                                        <option value="O">Otra </option>
                                    </select>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Número de identificación</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese su numero de identificacion" maxlength="30" name="ni" required>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Dirección</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese su dirección" maxlength="60" name="dir" required>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Telefono</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Ingrese su telefono" maxlength="40" name="tel">
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t" >Email</span>
                                    </div>
                                    <input type="email" class="form-control" placeholder="Ingrese su Email" maxlength="40" name="email" required>
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text t">Contrasña*</span>
                                    </div>
                                    <input type="password" class="form-control" placeholder="Ingrese una contraseña"  maxlength="40" name="contra" id="contra" required>
                                </div>



                                <div>	
                                    <button type="submit" class="btn" id="btnSS" value="registrar"><b>Registrarse</b></button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
    </body>  

    <%@include file="footer.jsp" %>

</html>