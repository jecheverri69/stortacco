package com.Stortacco.modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conectadb {

    private String usuario;
    private String clave;
    private String url;
    private String host;
    private String db;
    private String driverClassName;
    private Connection conn = null;

    public Conectadb(String usuario, String clave, String url, String driverClassName) {
        this.usuario = usuario;
        this.clave = clave;
        this.url = url;
        this.driverClassName = driverClassName;
    }

    public Conectadb() {
        this.db = "stortacco";
        this.host = "jdbc:mysql://localhost:3306/";
        this.usuario = "jerson";
        this.clave = "jerson123";
        this.url = host + db + "?user=" + usuario + "&password=" + clave;
        this.driverClassName = "com.mysql.jdbc.Driver";

    }

    public String getClave() {
        return clave;
    }

    public String getUrl() {
        return url;
    }

    public String getUsuario() {
        return usuario;
    }

    public Connection getConn() {
        return conn;
    }

    public String getDriverClassName() {
        return driverClassName;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setUsuario(String usuario) throws SQLException {
        this.usuario = usuario;
    }

    public void setConn(Connection conn) {
        this.conn = conn;
    }

    public void setDriverClassName(String driverClassName) {
        this.driverClassName = driverClassName;
    }

    public Connection conectar() {
        try {
            Class.forName(this.driverClassName);
            this.conn = DriverManager.getConnection(this.url, this.usuario, this.clave);
            System.out.println(this.conn);

        } catch (Exception err) {
            System.out.println("Error " + err.getMessage());
        }
        return conn;

    }

    public void cierraConexion() throws SQLException {
        this.conn.close();
    }
}
