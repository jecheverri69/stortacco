package com.Stortacco.beans;

import java.util.Date;

public class DetallesProductos {

    private Integer iddetallesproductos;
    private String categoria;
    private Date fechaIngreso;
    private int cantidad;
    private int precioCompra;
    private int precioVenta;
    private String habilitado;
    private Integer idProducto;

    public DetallesProductos() {
    }

    public DetallesProductos(Integer iddetallesproductos) {
        this.iddetallesproductos = iddetallesproductos;
    }

    public DetallesProductos(Integer iddetallesproductos, String categoria, Date fechaIngreso, int cantidad, int precioCompra, int precioVenta, String habilitado) {
        this.iddetallesproductos = iddetallesproductos;
        this.categoria = categoria;
        this.fechaIngreso = fechaIngreso;
        this.cantidad = cantidad;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
        this.habilitado = habilitado;
    }

    public Integer getIddetallesproductos() {
        return iddetallesproductos;
    }

    public void setIddetallesproductos(Integer iddetallesproductos) {
        this.iddetallesproductos = iddetallesproductos;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(int precioCompra) {
        this.precioCompra = precioCompra;
    }

    public int getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(int precioVenta) {
        this.precioVenta = precioVenta;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    public Integer getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Integer idProducto) {
        this.idProducto = idProducto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddetallesproductos != null ? iddetallesproductos.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallesProductos)) {
            return false;
        }
        DetallesProductos other = (DetallesProductos) object;
        if ((this.iddetallesproductos == null && other.iddetallesproductos != null) || (this.iddetallesproductos != null && !this.iddetallesproductos.equals(other.iddetallesproductos))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Stortacco.beans.DetallesProductos[ iddetallesproductos=" + iddetallesproductos + " ]";
    }
    
}
