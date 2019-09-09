package com.Stortacco.beans;

import java.util.Date;

public class Ventas {

    private Integer idventas;
    private String codigo;
    private Date fechaRegistro;
    private Date horaRegistro;
    private int total;
    private Integer idUsuario;

    public Ventas() {
    }

    public Ventas(Integer idventas) {
        this.idventas = idventas;
    }

    public Ventas(Integer idventas, String codigo, Date fechaRegistro, Date horaRegistro, int total) {
        this.idventas = idventas;
        this.codigo = codigo;
        this.fechaRegistro = fechaRegistro;
        this.horaRegistro = horaRegistro;
        this.total = total;
    }

    public Integer getIdventas() {
        return idventas;
    }

    public void setIdventas(Integer idventas) {
        this.idventas = idventas;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Date getHoraRegistro() {
        return horaRegistro;
    }

    public void setHoraRegistro(Date horaRegistro) {
        this.horaRegistro = horaRegistro;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idventas != null ? idventas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ventas)) {
            return false;
        }
        Ventas other = (Ventas) object;
        if ((this.idventas == null && other.idventas != null) || (this.idventas != null && !this.idventas.equals(other.idventas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Stortacco.beans.Ventas[ idventas=" + idventas + " ]";
    }
    
}
