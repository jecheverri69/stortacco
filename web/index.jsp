<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stortacco</title>
    </head>
    <%@include file="header.jsp" %>

    <body class="bodycont">

        <!-- Index Invitado -->    
        <%
            rol = "invitado";

            if (se.getAttribute("Rol") == null || se.getAttribute("Rol").equals("invitado")) {
                rol = "invitado";
            } else {
                rol = (String) se.getAttribute("Rol");
                idU = (int) se.getAttribute("idUsuarios");
            }
            if (rol.equals("invitado") || rol == null) {

        %>


        <!--carrusel de Bienvenida-->
        <!--SeccionUno-->
        <div id="top"></div>    
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicadores -->
            <ul class="carousel-indicators" id="top">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!--  -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-flex" src="Estilos/imagenes/FotoCincoCarruselCliente.jpg" alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated rotateIn">
                        ¡Bienvenido!
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-flex" src="Estilos/imagenes/Licores.jpg" alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated bounce">
                        ¡Conoce más!
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-flex" src="Estilos/imagenes/FotoUnoCarruselUsuario.jpg" alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated shake">
                        ¡Ven y Registrate en nuestro bar!
                    </div>
                </div>
            </div>

            <!-- Controles -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <!-- Seccion de Cervezas -->
        <!--SeccionDos-->
        <section class="section-b" id="carta">

            <div class="contPrincipal">
                <div class="row">
                    <div class="col-md-12">

                        <div class="row">
                            <!-- carta Uno -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-a">
                                    <div class="title-section-b">
                                        ¡ Hora de diversión !
                                    </div>
                                </div>
                            </div>

                            <!-- carta Dos -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-b">
                                    <a class="b-seccion animated shake" href="MenuLicores.jsp"> Conoce Más... </a>
                                </div>
                                <div class="title-section-v animated shake">
                                    ¡ Disfruta aqui y ahora !
                                </div>
                            </div>

                            <!-- carta Tres -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-aa">
                                    <div class="title-section-b">
                                        ¡ Los Mejores Momentos !
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!--Sección Descubra Más-->
        <!--SeccionTres-->
        <div class="cont" id="Dmas">
            <div class="row">
                <div class="col-md-12">
                    <div class="baseUno animated bounceInUp">
                        <div class="section-s-titulo">
                            Slogan
                        </div>
                        <div class="section-s-contenido">       
                            La razón de ser es que nuestro 
                            clientes se sientan satisfechos y 
                            nuestras puertas no tengan limites.
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="contdos">
            <div class="row">
                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-6 text-center justify-content-center">
                            <div class="baseDos animated bounceInDown">
                                <div class="section-ss-titulo">
                                    Nuestra Misión
                                </div>
                                <div class="section-ss-contenido">
                                    El bar de STORTACCO esta interesado en
                                    brindar una buena atención al cliente, 
                                    de ser un sitio atractivo y único con 
                                    sus horarios extendidos,

                                    prometiendo a nuestros clientes tener un lugar
                                    alegre y de entrenamiento, acompañada de buenos 
                                    productos y de alta calidad, variación de géneros
                                    de música y de su placentero gusto, para que así 
                                    deseen regresar a nuestro bar, para así contribuir 
                                    con nuestro crecimiento día a día.
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 text-center justify-content-center">
                            <div class="baseDos animated bounceInDown">
                                <div class="section-ss-titulo">
                                    Nuestra Visión
                                </div>
                                <div class="section-ss-contenido">
                                    Nuestra visión es ser grandes lideres 
                                    y reconocidos como el mejor bar de 
                                    Antioquia y mas largo plazo en todo 
                                    el país, demostrar nuestro gran 
                                    plan de trabajo e innovación a nivel 
                                    nacional y a mercados internacionales, 
                                    conservando siempre nuestras grandes 
                                    fortalezas como bar y así mejorar cada 
                                    día mas en la forma de captación y ser 
                                    prioridad para nuestros clientes, 
                                    para así planificar un crecimiento 
                                    firme y persistente. 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Index Usuario logeado -->    
        <%  } else if (rol.equals("cliente")) {
        %>

        <!--carrusel de Bienvenida-->
        <!--Seccion Uno-->
        <input type="text" id="inputbienvenido" style="position:absolute; visibility: hidden; top: 0;" value="<%= request.getParameter("bienvenido") != null ? "S" : "N"%>">
        <!--carrusel de Bienvenida-->
        <!--SeccionUno-->
        <div id="top"></div>    
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicadores -->
            <ul class="carousel-indicators" id="top">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!--  -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-flex" src="Estilos/imagenes/FotoCuatroCarruselCliente.jpg" alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated rotateIn">
                        ¡Bienvenido <%=nombreU%>!
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-flex" src="Estilos/imagenes/FotoTresCarruselCliente.jpg   " alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated bounce">
                        ¡ Hoy es el día !
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-flex" src="Estilos/imagenes/FotoDosCarruselUsuario.jpg" alt="usuario invitado-imagenes de ayuda educativa">
                    <div class="letra animated shake">
                        ¡Disfruta lo mejor!
                    </div>
                </div>
            </div>

            <!-- Controles -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>

        <!-- Seccion de Cervezas -->
        <!--SeccionDos-->
        <section class="section-b" id="carta">

            <div class="contPrincipal">
                <div class="row">
                    <div class="col-md-12">

                        <div class="row">
                            <!-- carta Uno -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-a">
                                    <div class="title-section-b">
                                        ¡ Hora de diversion !
                                    </div>
                                </div>
                            </div>

                            <!-- carta Dos -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-b">
                                    <a class="b-seccion animated shake" href="MenuLicores.jsp"> Conoce Más... </a>
                                </div>
                                <div class="title-section-v animated shake">
                                    ¡ Disfruta las mejores Momentos !
                                </div>
                            </div>

                            <!-- carta Tres -->
                            <div class="col-md-4 text-center justify-content-center">
                                <div class="section-b-carta-aa">
                                    <div class="title-section-b">
                                        ¡ Los Mejores Momentos !
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




        <!---Sección Descubra Más-->
        <!--Seccion Tres-->
        <div class="contdos">
            <div class="row">
                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-6  text-center justify-content-center">
                            <div class="conuno">
                                <div class="D-titulo">
                                    Slogan...
                                </div>
                                <div class="D-contenido">
                                    es: La razón de ser 
                                    es que nuestro clientes se sientan satisfechos y 
                                    nuestras puertas no tengan limites.
                                </div>
                            </div>
                        </div>
                        <div class="figura-con col-md-6 text-center justify-content-center">
                            <div class="figuraUno animated shake">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="contdos">
            <div class="row">
                <div class="col-md-12">

                    <div class="row">
                        <div class="figura-con  col-md-6 text-center justify-content-center">
                            <div class="figuraDos animated shake">

                            </div>
                        </div>
                        <div class="col-md-6 text-center justify-content-center">
                            <div class="condos">
                                <div class="D-titulo">
                                    Nuestra Misión
                                </div>
                                <div class="D-contenido">
                                    El bar de STORTACCO esta interesado en
                                    brindar una buena atención al cliente, 
                                    de ser un sitio atractivo y único con 
                                    sus horarios extendidos,

                                    prometiendo a nuestros clientes tener un lugar
                                    alegre y de entrenamiento, acompañada de buenos 
                                    productos y de alta calidad, variación de géneros
                                    de música y de su placentero gusto, para que así 
                                    deseen regresar a nuestro bar, para así contribuir 
                                    con nuestro crecimiento día a día.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="contdos">
            <div class="row">
                <div class="col-md-12">

                    <div class="row">
                        <div class="col-md-6 text-center justify-content-center">
                            <div class="contres">
                                <div class="D-titulo">
                                    Nuestra Visión
                                </div>
                                <div class="D-contenido">
                                    Nuestra visión es ser grandes lideres 
                                    y reconocidos como el mejor bar de 
                                    Antioquia y mas largo plazo en todo 
                                    el país, demostrar nuestro gran 
                                    plan de trabajo e innovación a nivel 
                                    nacional y a mercados internacionales, 
                                    conservando siempre nuestras grandes 
                                    fortalezas como bar y así mejorar cada 
                                    día mas en la forma de captación y ser 
                                    prioridad para nuestros clientes, 
                                    para así planificar un crecimiento 
                                    firme y persistente. 
                                </div>
                            </div>
                        </div>
                        <div class="figura-con col-md-6 text-center justify-content-center">
                            <div class="figuraTres animated shake">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="bienvendio" role="dialog">
            <div class="modal-dialog modal-sm modal-dialog-centered">


                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="text-align: center"><span>STORTACCO</span></h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div>
                            <div>
                                <div>
                                    <p style="text-align: justify;">USTED ACABA DE REGISTRARSE EN STORTACCO, BIENVENIDO! </p>
                                    <img src="Estilos/imagenes/logoModificado.ico" width="100%" >
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Index Administrador -->    
        <%  } else if (rol.equals("administrador")) {
        %>

        <div class="Bienvenido-Admin">
            <div class="Admin">
                <p>Bienvenido Administrador</p>
            </div>
        </div>

        <div class="row">

            <div class="col-xl-8 col-lg-7">

                <!-- Area Chart -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Rendimientos</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="myArea"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>

                <!-- Bar Chart -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Regularidades</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-bar">
                            <canvas id="myBar"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>

            </div>

            <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Ganancias</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="chart-pie pt-4">
                            <canvas id="myPie"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>

        <!-- Index Gerente -->
        <%
        } else if (rol.equals("gerente")) {
        %>

        <div class="Bienvenido-Admin">
            <div class="Admin">
                <p>Bienvenido Gerente</p>
            </div>
        </div>  

        <div class="row">

            <div class="col-xl-8 col-lg-7">

                <!-- Area Chart -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Rendimientos</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-area">
                            <canvas id="myArea"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>

                <!-- Bar Chart -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Regularidades</h6>
                    </div>
                    <div class="card-body">
                        <div class="chart-bar">
                            <canvas id="myBar"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>

            </div>

            <!-- Donut Chart -->
            <div class="col-xl-4 col-lg-5">
                <div class="card shadow mb-4">
                    <!-- Card Header - Dropdown -->
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-dark">Ganancias</h6>
                    </div>
                    <!-- Card Body -->
                    <div class="card-body">
                        <div class="chart-pie pt-4">
                            <canvas id="myPie"></canvas>
                        </div>
                        <hr>
                    </div>
                </div>
            </div>
        </div>

        <% }%>
        <!-- files de javaScript -->
        <script src="Estilos/js/Chart.js"></script>
        <script src="Estilos/js/chart-pie-demo.js" ></script>
        <script src="Estilos/js/chart-bar-demo.js" ></script>
        <script src="Estilos/js/chart-area-demo.js"></script>
    </body>

    <%@include file="footer.jsp" %>
</html>
