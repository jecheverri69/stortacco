package com.Stortacco.controlador.CRUDVentas;

import com.Stortacco.beans.Productos;
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

public class ListarRegistrarVentas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String mesa = request.getParameter("Mesa");
            ArrayList<Productos> listaP = new ArrayList<>();

            Conectadb cdb = new Conectadb();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            PreparedStatement ps2;
            ResultSet rs;
            ResultSet rs2;

            ps = con.prepareStatement("SELECT * FROM productos WHERE Habilitado=?;");
            ps.setString(1, "S");
            rs = ps.executeQuery();
            while (rs.next()) {
                Productos pr = new Productos();

                pr.setNombre(rs.getString("Nombre"));

                try {
                    ps2 = con.prepareStatement("SELECT * FROM detalles_productos WHERE idProducto=?;");
                    ps2.setInt(1, rs.getInt("idproductos"));
                    rs2 = ps2.executeQuery();
                    String cadenaDescri = "";
                    while (rs2.next()) {
                        cadenaDescri += rs2.getInt("iddetallesproductos") + "Æ" + rs2.getString("Categoria") + "Æ" + rs2.getString("Precio_Venta") + "æ";
                    }
                    cadenaDescri = cadenaDescri.substring(0, cadenaDescri.length() - 1);
                    pr.setCategoria(cadenaDescri);
                    ps2.close();
                    rs2.close();
                } catch (SQLException sql) {
                    sql.printStackTrace();
                }

                //ve.setTotal(rs.getFloat("Total"));
                listaP.add(pr);
            }
            request.setAttribute("listaP", listaP);
            RequestDispatcher rd = request.getRequestDispatcher("RegistrarVenta.jsp?Mesa=" + mesa);
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
