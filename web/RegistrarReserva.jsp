<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registra tu reserva</title>

        <%@include file="header.jsp" %>
    </head>
    <body>
        <div class="container-reservation">
            <div class="col-md-12">
                <div class="row">
                </div>
            </div>
            <div class="r-i">
                Reservas Stortacco
            </div>
            <div class="divider"></div>
        </div>

        <section class="col-md-12 r-c">


            <form action="" method="POST" class="r-form">
                <div>
                    <h2 class="r-title-a">Informacion para hacer tu reserva. </h2>
                    <p class="r-title">Bienvenido a Stortacco</p>
                    <p class="r-title">Reserva fácilmente completando el siguiente formulario, en algunos instantes te
                        estaremos
                        confirmando tu reserva</p>
                </div>
                <div class="a">
                    <div class="col-md-12">


                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark" >Hora de la reserva</span>
                            </div>
                            <input type="time" class="form-control" placeholder="Ingrese su nombre" maxlength="60" id="Hreserva" name="Hreserva" required>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark" >Fecha de la reserva</span>
                            </div>
                            <input type="date" class="form-control" placeholder="Ingrese su nombre" id="Freserva" name="Freserva" required>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text text-dark" >Número de personas</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Ingrese su nombre" maxlength="60" id="Nper" name="Nper" required>
                        </div>



                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text text-dark">Mesas</label>
                            </div>
                            <select class="custom-select" id="Mesas" name="Mesas">
                                <option value="m1">Mesa 1</option>
                                <option value="m2">Mesa 2</option>
                                <option value="m3">Mesa 3</option>
                                <option value="m4">Mesa 4</option>
                                <option value="m5">Mesa 5</option>
                                <option value="m6">Mesa 6</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="mt-4 text-center">
                    <a href="" class="btn btn-dark col-md-6">Enviar</a>
                </div>
            </form>
        </section>
    </body>
</html>
