package com.Stortacco.controlador.CRUDUsuarios;

import com.Stortacco.modelo.Conectadb;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String Id = request.getParameter("idusuarioo");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String fechanacimiento = request.getParameter("fechanaci");
            String tidentificacion = request.getParameter("tipoi");
            String nidentificacion = request.getParameter("numeroi");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            String rol = request.getParameter("rol1");
            String password = request.getParameter("contrasena");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;
            Date fe = new Date();
            DateFormat fef = new SimpleDateFormat("yyyy-MM-dd");

            ps = c.prepareStatement("UPDATE usuarios SET Password=?,Rol=? WHERE idusuarios=? ");
            ps.setString(1, password);
            ps.setString(2, rol);
            ps.setInt(3, Integer.parseInt(Id));

            int res = ps.executeUpdate();
            if (res > 0) {
                ps.close();
                ps = c.prepareStatement("UPDATE informacion_usuarios SET Fecha_Registro=?,Nombre=?,Apellidos=?,Fecha_Nacimiento=?,Tarjeta_Identificacion=?,Numero_Identificacion=?,Direccion=?,Telefono=? WHERE IdUsuario=?");
                ps.setString(1, fef.format(fe));
                ps.setString(2, nombre);
                ps.setString(3, apellido);
                ps.setString(4, fechanacimiento);
                ps.setString(5, tidentificacion);
                ps.setString(6, nidentificacion);
                ps.setString(7, direccion);
                ps.setString(8, telefono);
                ps.setInt(9, Integer.parseInt(Id));

                int res2 = ps.executeUpdate();
                if (res2 > 0) {
                    RequestDispatcher rd = request.getRequestDispatcher("Usuarios?mensaje=Y");
                    rd.forward(request, response);
                }

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Usuarios?mensaje=N");
                rd.forward(request, response);
            }

            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
            RequestDispatcher rd = request.getRequestDispatcher("Usuarios?mensaje=N");
            rd.forward(request, response);
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
