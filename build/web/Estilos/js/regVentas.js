$(document).ready(function () {
    document.getElementById("pagaRV").value = 0;
    document.getElementById("cambioRV").value = 0;
    document.getElementById("totalRV");
    autocompletadoAggProducto();
});
function formatNumber(numero) {
    var resultado = "";
    var nuevoNumero = numero.toString();
    for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) {
        resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 === 0) ? "." : "") + resultado;
    }
    return resultado;
}
function formatPago(numero) {
    var pago = "";
    var nuevoNumero = resetNumber(numero);
    for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) {
        pago = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 === 0) ? "." : "") + pago;
    }
    document.getElementById("pagaRV").value = pago;

}
function resetNumber(numero) {
    var resultado = numero.replace(/\./g, '');
    return resultado;
}
function autocompletadoAggProducto() {
    var select = document.getElementById("nombreRV");
    if (select.value !== "") {
        var cateProducto = select.value.split("æ");
        var templateHeader = `<select class="form-control" name="categoriaRV" id="categoriaRV">`;
        var templateBody = ``;
        document.getElementById("aggProductoRegistrarVenta").lastElementChild.remove();
        for (var i = 0; i < cateProducto.length; i++) {
            var infoCate = cateProducto[i].split("Æ");
            templateBody += `<option value="${infoCate[0] + "Æ" + infoCate[2]}">${infoCate[1]}</option>`;
        }
        document.getElementById("aggProductoRegistrarVenta").insertAdjacentHTML("beforeend", templateHeader + templateBody + `</select>`);
    } else {
        document.getElementById("aggProductoRegistrarVenta").lastElementChild.remove();
        document.getElementById("aggProductoRegistrarVenta").insertAdjacentHTML("beforeend", `<select class="form-control" name="categoriaRV" id="categoriaRV"><option value="">Elija un Producto</option></select>`);
    }
}
var nav4 = window.Event ? true : false;
function acceptNum(evt) {
    var key = nav4 ? evt.which : evt.keyCode;
    return (key >= 48 && key <= 57);
}

let ls = localStorage,
        input_nombre = document.getElementById("nombreRV"),
        input_categoria = document.getElementById("categoriaRV"),
        tablaProductos = document.getElementById("tablaProductos");
        buttonPagarRV = document.getElementById("btnRV");
        buttonAggProducto = document.getElementById("buttonRV");

class producto {
    constructor(codigo, nombre, categoria, precio, cantidad, subtotal) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.categoria = categoria;
        this.precio = precio;
        this.subtotal = subtotal;

        this.cantidad = cantidad;
    }
}

class productos {
    constructor(key) {
        this.key = key;
        if (!ls.getItem(this.key)) {
            ls.setItem(this.key, JSON.stringify([]));
        }
        this.addProduct = this.addProduct.bind(this);
        this.remove = this.remove.bind(this);
        this.modificarProducto = this.modificarProducto.bind(this);
        this.calcularTotal = this.calcularTotal.bind(this);
        this.agregarCambioDePago = this.agregarCambioDePago.bind(this);

    }
    addProduct(e) {
        e.preventDefault();
        input_categoria = document.getElementById("categoriaRV");
        input_nombre = document.getElementById("nombreRV");
        let valueNombre = input_nombre.options[input_nombre.selectedIndex].text;
        if (valueNombre !== "Seleccione" && input_categoria.options[0].textContent !== "Elija un Producto") {
            let infoCate = input_categoria.value.split("Æ");
            let valueCodigo = infoCate[0];
            let nombreCategoria = input_categoria.options[input_categoria.selectedIndex].text;
            let valuePrecio = infoCate[1];
            let valueCantidad = 1;
            const productoObject = new producto(valueCodigo, valueNombre, nombreCategoria, valuePrecio, valueCantidad);

            let productos = JSON.parse(ls.getItem(this.key));
            productos.push(productoObject);
            ls.setItem(this.key, JSON.stringify(productos));
            this.renderProducts(productoObject);
            this.calcularTotal()
            let nohay = document.getElementById("nohay")
            nohay.remove()
        } else if (input_categoria.options[0].textContent === "Elija un Producto" && valueNombre !== "Seleccione") {
            toastr.info("El producto ya ha sido seleccionado");
        } else if (valueNombre == "Seleccione") {
            toastr.info("Seleccione un Producto");
        }

    }
    remove(e) {
        input_nombre = document.getElementById("nombreRV");
        if (e.target.tagName === "BUTTON" && e.target.className === "btn btn-danger eliminar") {
            e.preventDefault();

            let productos = JSON.parse(ls.getItem(this.key)),
                    indice = productos.findIndex(producto => producto.codigo.toString() === e.target.dataset.codigo);


            productos.splice(indice, 1);
            ls.setItem(this.key, JSON.stringify(productos));

            let nombreCategoria = e.target.dataset.nombrecate;
            let precioCategoria = e.target.dataset.preciov;
            let codigoCategoria = e.target.dataset.codigo;
            let nombreProducto = document.getElementById(codigoCategoria + "NP").innerText;

            let indexOption = $("#nombreRV").children('option[data-nombreprod="' + nombreProducto + '"]').index();
            let optionProducto = input_nombre.options[indexOption];
            optionProducto.value += "æ" + codigoCategoria + "Æ" + nombreCategoria + "Æ" + precioCategoria;

            e.target.parentElement.parentElement.remove();

            if (productos.length == 0) {
                let nohay = ` <tr id ="nohay">
                                    <td colspan="5" align="center">No hay Productos</td>
                                </tr>`
                tablaProductos.innerHTML = nohay
                let renovar = `<select onchange="autocompletadoAggProducto()" class="form-control" name="nombreRV" id="nombreRV">
                                        <option value="">Seleccione</option>
                                        <% ArrayList<Productos> apr = (ArrayList) request.getAttribute("listaP");
                                            for (Productos pr : apr) {%>
                                        <option data-nombreprod="<%= pr.getNombre()%>" value="<%= pr.getCategoria()%>"><%= pr.getNombre()%></option>
                                        <% } %>
                                </select>`
                input_nombre.innerHTML = renovar


            }
        }
    }
    renderProducts(producto) {
        let templateTask = `
        <tr>
            <td id="${producto.codigo}NP">${producto.nombre}</td>
            <td>${producto.categoria}</td>
            <td>
                <button type="button" class="btn btn-warning decrementar" data-id="${producto.codigo}">-</button>
                <span id="${producto.codigo}Cant" data-cantidad="cantidad">${producto.cantidad}</span>
                <button type="button" class="btn btn-warning incrementar" data-id="${producto.codigo}">+</button>
            </td>
            <td class="precio">${formatNumber(producto.precio)}</td>
            <td>
                <button type="button" class="btn btn-danger eliminar" data-preciov="${producto.precio}" data-nombrecate="${producto.categoria}" data-codigo="${producto.codigo}"><span class="fas fa-trash-alt"></span> Remover</button>
            </td>
        </tr>
        `;

        tablaProductos.insertAdjacentHTML("beforeend", templateTask);

        input_nombre = document.getElementById("nombreRV");
        let indexOption = $("#nombreRV").children('option[data-nombreprod="' + producto.nombre + '"]').index();
        let optionProducto = input_nombre.options[indexOption];
        let detallesProductos = optionProducto.value.split("æ");
        optionProducto.value = "";
        for (var i = 0; i < detallesProductos.length; i++) {
            let infoDetallesProductos = detallesProductos[i].split("Æ");
            if (infoDetallesProductos[0] !== producto.codigo) {
                optionProducto.value += detallesProductos[i] + "æ";
            }
        }
        optionProducto.value = optionProducto.value.substring(0, optionProducto.value.length - 1);
        autocompletadoAggProducto();

    }
    modificarProducto(e) {
        if (e.target.tagName === "BUTTON" && e.target.className === "btn btn-warning incrementar") {
            let productos = JSON.parse(ls.getItem(this.key));
            let indice = productos.findIndex(p => p.codigo === e.target.dataset.id)
            console.log(indice)
            let idCategoria = productos[indice].codigo;
            const xhr = new XMLHttpRequest()
            xhr.open('POST', 'inventario', true)
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
            xhr.addEventListener('load', () => {
                const data = (xhr.responseText)
                if (productos[indice].cantidad < parseInt(data)) {
                    productos[indice].cantidad++;
                    ls.setItem(this.key, JSON.stringify(productos));
                    let spanCantidad = e.target.parentElement.querySelector("[data-cantidad]")
                    spanCantidad.textContent = productos[indice].cantidad
                    this.calcularTotal()
                }

            })
            xhr.send(`idCategoria=${idCategoria}`)




        } else if (e.target.tagName === "BUTTON" && e.target.className === "btn btn-warning decrementar") {
            let productos = JSON.parse(ls.getItem(this.key));
            let indice = productos.findIndex(p => p.codigo === e.target.dataset.id)
            if (productos[indice].cantidad > 1) {
                productos[indice].cantidad--;
                ls.setItem(this.key, JSON.stringify(productos));
                let spanCantidad = e.target.parentElement.querySelector("[data-cantidad]")
                spanCantidad.textContent = productos[indice].cantidad

            }

        }

    }
    calcularTotal(e) {
        let productos = JSON.parse(ls.getItem(this.key)),
                productosCantidades = productos.map(producto => producto.cantidad),
                productosPrecio = productos.map(producto => producto.precio)

        let total = 0;
        for (var i = 0; i < productosCantidades.length; i++) {
            total += productosCantidades[i] * productosPrecio[i];
        }
        let inputTotal = document.getElementById("totalRV").value = formatNumber(total);
    }
    agregarCambioDePago() {
        let totalRV = parseInt(resetNumber(document.getElementById("totalRV").value))
        let paga = (resetNumber(document.getElementById("pagaRV").value))

        if (paga != 0 && paga.toString().length < 9) {
            let cambio = parseInt(paga) - parseInt((totalRV));

            document.getElementById("cambioRV").value = formatNumber(cambio);
            $("#totalRV").removeAttr('disabled');
            let productosListosRV = ls.getItem(this.key);
            ls.removeItem("mesa"+document.getElementById('mesaRV').value);
            console.log("Generando...");
            $.post('Venta', { totalRV : document.getElementById("totalRV").value, productosListosRV }, function(response){
                if (response.includes("pdf")){
                    window.open("http://localhost:8084/Stortacco/Facturas/"+response, "Factura", "width=500, height=500");
                    window.location = "Ventas?mensaje=SI";
                } else {
                    alert(response);
                    window.location = "Ventas?mensaje=NO";
                }
            });
            console.log("Finalizo!");
        } else {
            toastr.info("Ingrese un valor válido")
        }
    }
    render() {
        let Arrayproductos = JSON.parse(ls.getItem(this.key));
        let nohay = document.getElementById("nohay")
        Arrayproductos.forEach(task => this.renderProducts(task));
        if (Arrayproductos.length) {
            nohay.remove()
        }
    }
    actions() {
        let buttonPagarRV = document.getElementById("btnRV");
        buttonPagarRV.addEventListener("click", this.agregarCambioDePago);
        let buttonAggProducto = document.getElementById("buttonRV");
        buttonAggProducto.addEventListener("click", this.addProduct);
        tablaProductos.addEventListener("click", this.remove);
        tablaProductos.addEventListener("click", this.modificarProducto);
        tablaProductos.addEventListener("click", this.calcularTotal);
    }

}
const productosObject = new productos("mesa" + document.getElementById("mesaRV").value);
productosObject.actions();

productosObject.render();
productosObject.calcularTotal();


