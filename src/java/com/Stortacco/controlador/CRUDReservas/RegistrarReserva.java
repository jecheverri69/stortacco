package com.Stortacco.controlador.CRUDReservas;

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

public class RegistrarReserva extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {

            String FechaReserva = request.getParameter("fr");
            String HoraReserva = request.getParameter("hr");
            String NumeroPersonas = request.getParameter("np");
            String idUsuario = request.getParameter("nu");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;

            ps = c.prepareStatement("INSERT INTO reservas(Fecha_Reserva,Hora_Reserva,Numero_personas,idUsuario,Habilitado) Values (?,?,?,?,?);");
            ps.setString(1, FechaReserva);
            ps.setString(2, HoraReserva);
            ps.setString(3, NumeroPersonas);
            ps.setInt(4, Integer.parseInt(idUsuario));
            ps.setString(5, "S");

            int res = ps.executeUpdate();

            if (res > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("Reservas?mensaje=SI");
                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Reservas?mensaje=NO");
                rd.forward(request, response);

            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
            RequestDispatcher rd = request.getRequestDispatcher("Reservas?mensaje=NBD");
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
