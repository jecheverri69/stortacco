package com.Stortacco.beans;

public class Proveedores {

    private Integer idproveedores;
    private String nombre;
    private String telefono;
    private String email;
    private String direccion;
    private String tipoIdentificacion;
    private String numeroIdentificacion;
    private String nombreContacto;
    private String habilitado;

    public Proveedores() {
    }

    public Proveedores(Integer idproveedores) {
        this.idproveedores = idproveedores;
    }

    public Proveedores(Integer idproveedores, String nombre, String telefono, String email, String direccion, String tipoIdentificacion, String numeroIdentificacion, String nombreContacto, String habilitado) {
        this.idproveedores = idproveedores;
        this.nombre = nombre;
        this.telefono = telefono;
        this.email = email;
        this.direccion = direccion;
        this.tipoIdentificacion = tipoIdentificacion;
        this.numeroIdentificacion = numeroIdentificacion;
        this.nombreContacto = nombreContacto;
        this.habilitado = habilitado;
    }

    public Integer getIdproveedores() {
        return idproveedores;
    }

    public void setIdproveedores(Integer idproveedores) {
        this.idproveedores = idproveedores;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTipoIdentificacion() {
        return tipoIdentificacion;
    }

    public void setTipoIdentificacion(String tipoIdentificacion) {
        this.tipoIdentificacion = tipoIdentificacion;
    }

    public String getNumeroIdentificacion() {
        return numeroIdentificacion;
    }

    public void setNumeroIdentificacion(String numeroIdentificacion) {
        this.numeroIdentificacion = numeroIdentificacion;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getHabilitado() {
        return habilitado;
    }

    public void setHabilitado(String habilitado) {
        this.habilitado = habilitado;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idproveedores != null ? idproveedores.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proveedores)) {
            return false;
        }
        Proveedores other = (Proveedores) object;
        if ((this.idproveedores == null && other.idproveedores != null) || (this.idproveedores != null && !this.idproveedores.equals(other.idproveedores))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Stortacco.beans.Proveedores[ idproveedores=" + idproveedores + " ]";
    }
    
}
