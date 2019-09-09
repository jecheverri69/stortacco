package com.Stortacco.controlador.CRUDProveedores;

import com.Stortacco.modelo.Conectadb;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String Nombre = request.getParameter("nom");
            String Telefono = request.getParameter("tel");
            String Email = request.getParameter("email");
            String Direccion = request.getParameter("dir");
            String TipoIdentificacion = request.getParameter("ti");
            String Nidentificacion = request.getParameter("ni");
            String Ncontacto = request.getParameter("ncon");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;

            ps = c.prepareStatement("INSERT INTO proveedores(Nombre,Telefono,Email,Direccion,Tipo_Identificacion,Numero_Identificacion,Nombre_Contacto,Habilitado) Values (?,?,?,?,?,?,?,?);");
            ps.setString(1, Nombre);
            ps.setString(2, Telefono);
            ps.setString(3, Email);
            ps.setString(4, Direccion);
            ps.setString(5, TipoIdentificacion);
            ps.setString(6, Nidentificacion);
            ps.setString(7, Ncontacto);
            ps.setString(8, "S");
            int res = ps.executeUpdate();

            if (res > 0) {

                RequestDispatcher rd = request.getRequestDispatcher("Proveedores?mensaje=SI");
                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Proveedores?mensaje=NO");
                rd.forward(request, response);

            }
            cdb.cierraConexion();
        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
            RequestDispatcher rd = request.getRequestDispatcher("Proveedores?mensaje=NBD");
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
