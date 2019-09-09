<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil</title>
    </head>
    <%@include file="header.jsp" %>
    <body class="bodycont">


        <div class="container-fluid contentper d-flex align-items-center">
            <div class="row">
                <div class="col-md-8">

                    <div class="cardUno">
                        <div class="card-head">
                            <h5 class="title">Perfil</h5>
                        </div>

                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Bar </label>
                                                <input aria-describedby="addon right addon left" type="text" placeholder="Stortacco" disabled="disable" class="form-control"/>
                                            </div>
                                        </div>
                                    </div>
                                    <!---->
                                    <div class="col-md-6">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Correo </label>
                                                <input aria-describedby="addon right addon left" type="text" value="<%= se.getAttribute("Email")%>" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <!---->

                                    <!---->
                                    <div class="col-md-4">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Nombres </label>
                                                <input aria-describedby="addon right addon left" type="text"
                                                       value="<%= se.getAttribute("Nombre")%>"  class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <!---->
                                    <div class="col-md-4">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Apellidos </label>
                                                <input aria-describedby="addon right addon left" type="text"
                                                       value="<%= se.getAttribute("Apellidos")%>" class="form-control" />
                                            </div>
                                        </div>
                                    </div>


                                    <!---->
                                    <div class="col-md-4">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Dirección </label>
                                                <input aria-describedby="addon right addon left" type="text"
                                                       value="<%= se.getAttribute("Direccion")%>"  class="form-control" />
                                            </div>
                                        </div>
                                    </div>


                                    <!---->
                                    <div class="col-md-6">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Numero de Identificación </label>
                                                <input aria-describedby="addon right addon left" type="text" disabled="disable"
                                                       value="<%= se.getAttribute("Numero_Identificacion")%>"  class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group has-label">
                                            <div class="mb-0">
                                                <label class="text-dark"> Teléfono </label>
                                                <input aria-describedby="addon right addon left" type="text"
                                                       value="<%= se.getAttribute("Telefono")%>" class="form-control" />
                                            </div>
                                        </div>
                                    </div>

                                    <!---->
                                    <div class="col-md-12">
                                        <button type="submit" class=" btn btn-dark align-items-center per py-2 "> Actualizar </button>
                                    </div>

                                </div>

                            </form>
                        </div>

                        <!-- Parte dos-->
                    </div>
                </div>

                <div class="col-md-4">

                    <!-- Cuerpo-->
                    <div class="card card-user">
                        <!-- Contenido-->
                        <div class="card-body">
                            <p class="card-text"></p>
                            <div class="autor">
                                <div class="block block-uno"></div>
                                <div class="block block-dos"></div>
                                <div class="block block-tres"></div>
                                <div class="block block-cuatro"></div>
                                <img src="Estilos/imagenes/avatarDos.jpg" alt="avatar" class="avatar" />
                                <h5 class="title text-dark"> <%=nombreU%> </h5>
                                <hr class="h">
                                <p class="description text-dark"> <%=rol%> </p>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>

    </body>
    <%@include file="footer.jsp" %>
</html>
