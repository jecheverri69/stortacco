<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/fontsicon/css/font-awesome.min.css"/>
        <title>Footer</title>
    </head>
    <body>
        <footer id="contact">

            <!-- Seccion uno -->
            <div class="finfo">
                <div class="fcontacto">
                    <div class="titulo">
                        <p><span class="icon-calendar"></span> Horario</p>
                    </div>
                    <div class="contenido">
                        <p>Miércoles: 6:00 p.m - 02:00 a.m.</p> 
                        <p>Jueves a Sábado: 4:00 p.m - 4:00 a.m.</p> 
                        <p>Domingo: 5:00 p.m - 2:00 p.m</p>
                    </div>	
                </div>

                <!--Seccion dos-->
                <div class="fsiguenos">
                    <div class="titulo">
                        <p><span class="fas fa-at"></span> Contacto</p>
                    </div>
                    <div class="contenido">
                        <p>Calle 63# 58B-03</p> 
                        <p>stortacco@gmail.com</p> 
                        <p>310 591 4340</p>
                    </div>
                </div>

                <!-- Seccion tres -->
                <div class="fubicacion">
                    <div class="titulo">
                        <p><span class="fas fa-location-arrow"></span> Ubicación</p>
                    </div>
                    <div class="contenido">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d5609.662009590814!2d-75.60876343686489!3d6.180247066643149!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e46823b07fa76e7%3A0xd858c9c2ddf4b118!2sSENA+de+Calatrava!5e0!3m2!1ses!2sco!4v1553296137276" width="400" height="200" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <!-- Seccion cuatro -->    
            <div class="frigths">
                <p class="h5">Sky Eagle 2019. || All rights reserved.</p>
            </div>	
        </footer>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

    <script src="Estilos/js/bootstrap.min.js"></script>
    <script src="Estilos/js/swiper.min.js"></script>
    <script src="Estilos/js/toastr.js"></script>

    <script src="Estilos/js/navSticky.js"></script>
    <script src="Estilos/js/ContenidoProyecto.js"></script>

    <script src="Estilos/js/datatables.js"></script>
    <script src="Estilos/js/dataTables.bootstrap4.min.js"></script>


    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 

    <script>
        $(document).ready(function () {
            $('.tablasListar').DataTable({
                "order": [[0, "desc"]],
                language: {
                    "sProcessing": "Procesando...",
                    "sLengthMenu": "Límite de registros por página: _MENU_",
                    "sZeroRecords": "No se encontraron resultados.",
                    "sEmptyTable": "Ningún dato disponible en esta tabla.",
                    "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                    "sInfoFiltered": "(Filtrado de un total de _MAX_ registros).",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "sInfoThousands": ",",
                    "sLoadingRecords": "Cargando...",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente."
                    }
                }
            });
        });
    </script>
</html>
