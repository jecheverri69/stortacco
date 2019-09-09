package com.Stortacco.controlador.CRUDProveedores;

import com.Stortacco.beans.Proveedores;
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

public class ListarProveedores extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {

            ArrayList<Proveedores> lista = new ArrayList<>();

            Conectadb cdb = new Conectadb();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;

            ps = con.prepareStatement("SELECT * FROM proveedores where Habilitado=?;");
            ps.setString(1, "S");
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedores pr = new Proveedores();
                pr.setIdproveedores(rs.getInt("idproveedores"));
                pr.setNombre(rs.getString("Nombre"));
                pr.setTelefono(rs.getString("Telefono"));
                pr.setEmail(rs.getString("Email"));
                pr.setDireccion(rs.getString("Direccion"));
                pr.setTipoIdentificacion(rs.getString("Tipo_Identificacion"));
                pr.setNumeroIdentificacion(rs.getString("Numero_Identificacion"));
                pr.setNombreContacto(rs.getString("Nombre_Contacto"));

                lista.add(pr);
            }
            request.setAttribute("lista", lista);
            RequestDispatcher rd = request.getRequestDispatcher("listarProveedores.jsp");
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
