package com.Stortacco.beans;

public class Usuarios {

    private Integer idusuarios;
    private String email;
    private String password;
    private String rol;
    private String habilitado;

    public Usuarios() {
    }

    public Usuarios(Integer idusuarios) {
        this.idusuarios = idusuarios;
    }

    public Usuarios(Integer idusuarios, String email, String password, String rol, String habilitado) {
        this.idusuarios = idusuarios;
        this.email = email;
        this.password = password;
        this.rol = rol;
        this.habilitado = habilitado;
    }

    public Integer getIdusuarios() {
        return idusuarios;
    }

    public void setIdusuarios(Integer idusuarios) {
        this.idusuarios = idusuarios;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
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
        hash += (idusuarios != null ? idusuarios.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuarios)) {
            return false;
        }
        Usuarios other = (Usuarios) object;
        if ((this.idusuarios == null && other.idusuarios != null) || (this.idusuarios != null && !this.idusuarios.equals(other.idusuarios))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.Stortacco.beans.Usuarios[ idusuarios=" + idusuarios + " ]";
    }
    
}
