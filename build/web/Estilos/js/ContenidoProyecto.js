/* global scrollBarLocation */

function verFactura(idVenta){
    window.open("http://localhost:8084/Stortacco/Facturas/"+idVenta+".pdf", "Factura", "width=500, height=500");
}

$(document).ready(function () {
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
    $('.cuerpo article').hide();
    if (sPage === "Ventas"){
        $('.cuerpo .cuerpoNav #BtnRegistrar').hide();
        $('.cuerpo article#Registrar').show();
        let ls = localStorage;
        let productos;
        let numeroDeMesas = $('.cuerpo article#Registrar button').length;
        for (var i = 1; i <= numeroDeMesas; i++) {
            productos = JSON.parse(ls.getItem("mesa"+i));
            if (productos === null || productos.length < 1){
                $(".cuerpo article#Registrar button:nth-child("+i+")").html("Mesa "+i);
            } else {
                $(".cuerpo article#Registrar button:nth-child("+i+")").html('Mesa '+i+'<span class="aparte">Venta Pendiente</span>');
            }
        }
    } else {
        $('.cuerpo .cuerpoNav #BtnListar').hide();
        $('.cuerpo article#Listar').show();
    }
    
    var inpb = document.getElementById("inputbienvenido");
    if (inpb !=null){
        inpb= inpb.value;
        if(inpb==="S"){
        $("#bienvendio").modal("toggle");
    }
    }

    
    $('.cuerpo .cuerpoNav #BtnListar').click(function () {
        $('.cuerpo .cuerpoNav #BtnListar').hide();
        $('.cuerpo .cuerpoNav #BtnRegistrar').show();
        $('.cuerpo article#Listar').show();
        $('.cuerpo article#Registrar').hide();
    });
    $('.cuerpo .cuerpoNav #BtnRegistrar').click(function () {
        $('.cuerpo .cuerpoNav #BtnRegistrar').hide();
        $('.cuerpo .cuerpoNav #BtnListar').show();
        $('.cuerpo article#Listar').hide();
        $('.cuerpo article#Registrar').show();
    });
});

function ProductosVer(idProductos,
       
        idProveedor,
        des,) {

    var arreglo = des.split("?");
    var cadenaCategorias = "";
    for (var i = 0; i < arreglo.length; i++) {
        var arregloInfo = arreglo[i].split("¥");
        cadenaCategorias += "Categoría: "+arregloInfo[1]+"<br>"+"Cantidad: "+arregloInfo[2]+"<br>"+"Fecha de Ingreso: "+arregloInfo[3]+"<br>"+"Precio de Compra: "+arregloInfo[4]+"<br>"+"Precio de Venta: "+arregloInfo[5]+"<br><br>";            
    }
    cadenaCategorias = cadenaCategorias.substring(0,cadenaCategorias.length-8);
    document.getElementById('categoria').innerHTML = cadenaCategorias;
        
    document.getElementById('idProductos').innerText = idProductos;
  
    document.getElementById('idprovee').innerText = idProveedor;
    document.getElementById('idprovee').innerText = idProveedor;

}
function ProductosActualizar(idProductos,
        NombreP,
        idProveedor,
        des) {

    
    
    document.getElementById('idproductos').value = idProductos;
    document.getElementById('nombre').value = NombreP;
 
    document.getElementById('proveedor').value = idProveedor;

}

function ProveedoresVer(idProveedores,
        DireccionPr,
        TipoiPr,
        NumeroiPr) {

    document.getElementById('idProvee').innerText = idProveedores;
    document.getElementById('Dire').innerText = DireccionPr;
    document.getElementById('Tipoi').innerText = TipoiPr;
    document.getElementById('Numeroi').innerText = NumeroiPr;


}

function ProveedoresActualizar(idprove,
        NombrePr,
        TelefonoPr,
        EmailPr,
        DireccionPr,
        TipoiPr,
        NumeroiPr,
        NombreContactoPr) {

   
    document.getElementById('idproveedor').value = idprove;
    document.getElementById('nombres').value = NombrePr;
    document.getElementById('telefono').value = TelefonoPr;
    document.getElementById('email1').value = EmailPr;
    document.getElementById('direccion').value = DireccionPr;
    document.getElementById('tipoi').value = TipoiPr;
    document.getElementById('numeroi').value = NumeroiPr;
    document.getElementById('nombrecon').value = NombreContactoPr;
    


}
        
function ReservasVer(idReservas) {

    document.getElementById('idreser').innerText = idReservas;



}

function UsuariosVer(idUsuarios,
        FechaRus,
        FechaNus,
        Direccion,
        Telefono) {

    document.getElementById('idUsu').innerText = idUsuarios;
    document.getElementById('fechar').innerText = FechaRus;
    document.getElementById('fechan').innerText = FechaNus;
    document.getElementById('dire').innerText = Direccion;
    document.getElementById('tele').innerText = Telefono;


}
function UsuariosActualizar(idUsuarios,
        Passwordus,
        Rolus,
        Nombreus,
        Apellidous,
        FechaNus,
        Tipoius,
        Numeroius,
        Direccionus,
        Telefonous) {

    document.getElementById('idusuarioo').value = idUsuarios;
    document.getElementById('contrasena').value = Passwordus;
    document.getElementById('rol1').value = Rolus;
    document.getElementById('nombre').value = Nombreus;
    document.getElementById('apellido').value = Apellidous;
    document.getElementById('fechanaci').value = FechaNus;
    document.getElementById('tipoi').value = Tipoius;
    document.getElementById('numeroi').value = Numeroius;
    document.getElementById('direccion').value = Direccionus;
    document.getElementById('telefono').value = Telefonous;


}

/*-----contenido de Descubre Mas------*/


function mueveReloj() {
    // Antes de iniciar, se debe poner la propiedad: onload="mueveReloj()" en la etiqueta
    // <body> donde se va a poner el reloj

    // Como dice la variable, todo lo del momento actual de la fecha
    var momentoActual = new Date();

    // Se guarda en las variables la hora y fechas actuales con los metodos de
    // JQuery (Al mes se le suma una, porque empieza desde 0 como un arreglo y se debe mostrar
    // desde el mes número 1)
    // Para la fecha, tiene la estructura de MySQL (Año, mes, día)
    var horaImprimible = momentoActual.getHours() + ":" + momentoActual.getMinutes() + ":" + momentoActual.getSeconds();
    var fechaImprimible =  momentoActual.getDate() + "/" + (momentoActual.getMonth()+1) + "/" + momentoActual.getFullYear();

    // Imprimo la hora y fecha en los INPUTS
    document.getElementById("horaRV").value = horaImprimible;
    document.getElementById("fechaRV").value = fechaImprimible;

    // Vuelvo a llamar este metodo cada segundo repetitivamente
    setTimeout("mueveReloj()", 1000);
}


/*Animacion de la pagina*/

$(document).ready(function() {
   
    var scrollEnlace = $('.scroll');
    //
    
    scrollEnlace.click(function(e){
        e.preventDefault();
        $('body, html').animate({
          scrollTop: $(this.hash).offset().top  
        }, 1000 );
    });
    
    $(window).scroll(function() {
        var scroll = $(this).scrollTop();
        
        scrollEnlace.each(function() {
           var seccion = $(this.hash).offset().top;
           
           if (seccion < scrollBarLocation ) {
               $(this).parent().addClass('active');
               $(this).parent().siblings().removeClass('active');
           }
        });
    });
});