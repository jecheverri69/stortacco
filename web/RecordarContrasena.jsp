<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Estilos/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Stortacco</title>
    </head>
    <body>
        <h1>Bienvenido</h1>

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-2">¿Olvido su contraseña?</h1>
                                            <p class="mb-4">¡Simplemente ingrese su dirección de correo electrónico a continuación y le enviaremos un enlace para restablecer su contraseña.!</p>
                                        </div>
                                        <form class="user">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Ingrese su email...">
                                            </div>
                                            <a href="#" class="btn btn-primary btn-user btn-block">
                                                Restablecer la contraseña   
                                            </a>
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="RegistrarUsuario.jsp">¡Crea un nueva cuenta!</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="acceder.jsp">¿Ya tienes una cuenta? ¡Accede!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

    </body>
</html>
