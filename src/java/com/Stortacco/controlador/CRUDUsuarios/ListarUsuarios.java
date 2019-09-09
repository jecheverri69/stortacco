package com.Stortacco.controlador.CRUDUsuarios;

import com.Stortacco.beans.InformacionUsuarios;
import com.Stortacco.modelo.Conectadb;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {

            ArrayList<InformacionUsuarios> lista = new ArrayList<>();

            Conectadb cdb = new Conectadb();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            PreparedStatement ps2;
            ResultSet rs;
            ResultSet rs2;

            ps = con.prepareStatement("SELECT * FROM informacion_usuarios WHERE Habilitado=?;");
            ps.setString(1, "S");
            rs = ps.executeQuery();

            while (rs.next()) {
                InformacionUsuarios ius = new InformacionUsuarios();

                ius.setIdinformacionusuarios(rs.getInt("idinformacionusuarios"));
                ius.setFechaRegistro(rs.getDate("Fecha_Registro"));
                ius.setNombre(rs.getString("Nombre"));
                ius.setApellidos(rs.getString("Apellidos"));
                ius.setFechaNacimiento(rs.getDate("Fecha_Nacimiento"));
                ius.setTarjetaIdentificacion(rs.getString("Tarjeta_Identificacion"));
                ius.setNumeroIdentificacion(rs.getString("Numero_Identificacion"));
                ius.setDireccion(rs.getString("Direccion"));
                ius.setTelefono(rs.getString("Telefono"));

                try {
                    ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idusuarios=?;");
                    ps2.setInt(1, rs.getInt("idUsuario"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        ius.setIdUsuario(rs2.getInt("idusuarios"));
                        ius.setEmail(rs2.getString("Email"));
                        ius.setPassword(rs2.getString("Password"));
                        ius.setRol(rs2.getString("Rol"));
                        ps2.close();
                        rs2.close();
                    } else {
                        request.getRequestDispatcher("Usuarios?mensaje=np").forward(request, response);
                        ps.close();
                        rs.close();
                    }
                } catch (SQLException sql) {
                    sql.printStackTrace();
                }
                lista.add(ius);
            }

            request.setAttribute("lista", lista);
            RequestDispatcher rd = request.getRequestDispatcher("listarUsuarios.jsp");
            rd.forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            sql.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
