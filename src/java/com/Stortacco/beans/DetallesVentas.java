package com.Stortacco.beans;

public class DetallesVentas {

    private Integer iddetallesventas;
    private String cantidad;
    private DetallesProductos idProducto;
    private Ventas idVenta;

    public DetallesVentas() {
    }

    public DetallesVentas(Integer iddetallesventas) {
        this.iddetallesventas = iddetallesventas;
    }

    public DetallesVentas(Integer iddetallesventas, String cantidad) {
        this.iddetallesventas = iddetallesventas;
        this.cantidad = cantidad;
    }

    public Integer getIddetallesventas() {
        return iddetallesventas;
    }

    public void setIddetallesventas(Integer iddetallesventas) {
        this.iddetallesventas = iddetallesventas;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public DetallesProductos getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(DetallesProductos idProducto) {
        this.idProducto = idProducto;
    }

    public Ventas getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Ventas idVenta) {
        this.idVenta = idVenta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iddetallesventas != null ? iddetallesventas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DetallesVentas)) {
            return false;
        }
        DetallesVentas other = (DetallesVentas) object;
        if ((this.iddetallesventas == null && other.iddetallesventas != null) || (this.iddetallesventas != null && !this.iddetallesventas.equals(other.iddetallesventas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Stortacco.beans.DetallesVentas[ iddetallesventas=" + iddetallesventas + " ]";
    }
    
}
