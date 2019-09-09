<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language='java' contentType='text/html' isErrorPage='true' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="Estilos/css/contenido.css">
        <title>error 404</title>
    </head>
    <body>
        <hr class="custom m-0">
        <div class="container text-center my-5">
            <h1 class="display-1">404</h1>

            <p class="mb-1"><strong>Pagina no encontrada :(</strong></p>
            <p class="mb-5">La página solicitada no pudo ser encontrada.<%= exception.getLocalizedMessage()%></p>
            <a href="index.jsp" class="btn btnError">Retornar</a>
        </div>
    </body>
</html>
