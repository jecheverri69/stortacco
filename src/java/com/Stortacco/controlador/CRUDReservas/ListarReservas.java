package com.Stortacco.controlador.CRUDReservas;

import com.Stortacco.beans.Reservas;
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

public class ListarReservas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {

            ArrayList<Reservas> lista = new ArrayList<>();

            Conectadb cdb = new Conectadb();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;

            ps = con.prepareStatement("SELECT * FROM reservas where Habilitado=?;");
            ps.setString(1, "S");
            rs = ps.executeQuery();
            while (rs.next()) {
                Reservas re = new Reservas();
                re.setIdreservas(rs.getInt("idreservas"));
                re.setFechaReserva(rs.getDate("Fecha_Reserva"));
                re.setHoraReserva(rs.getTime("Hora_Reserva"));
                re.setNumeroPersonas(rs.getString("Numero_Personas"));
                try {
                    ps2 = con.prepareStatement("SELECT Email FROM usuarios WHERE idusuarios=?;");
                    ps2.setInt(1, rs.getInt("idUsuario"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        re.setIdUsuario(rs2.getString("Email"));
                        ps2.close();
                        rs2.close();
                    } else {
                        request.getRequestDispatcher("listarReservas.jsp?mensaje=np").forward(request, response);
                        ps.close();
                        rs.close();
                    }
                } catch (SQLException sql) {
                    sql.printStackTrace();
                }
                lista.add(re);
            }
            request.setAttribute("lista", lista);
            RequestDispatcher rd = request.getRequestDispatcher("listarReservas.jsp");
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
