package com.Stortacco.controlador.CRUDProductos;

import com.Stortacco.beans.Productos;
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

public class ListarProductos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {

            ArrayList<Productos> lista = new ArrayList<>();
            ArrayList<Proveedores> listaPro = new ArrayList<>();

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
                pr.setIdproductos(rs.getInt("idproductos"));
                pr.setNombre(rs.getString("Nombre"));

                pr.setIdProveedor(rs.getInt("idProveedor"));

                try {
                    ps2 = con.prepareStatement("SELECT * FROM detalles_productos WHERE Habilitado=? and idProducto=?;");
                    ps2.setString(1, "S");
                    ps2.setInt(2, rs.getInt("idproductos"));
                    rs2 = ps2.executeQuery();
                    String des = "";
                    while (rs2.next()) {
                        des += rs2.getInt("iddetallesproductos") + "¥" + rs2.getString("Categoria") + "¥" + rs2.getInt("Cantidad") + "¥" + rs2.getDate("Fecha_Ingreso") + "¥" + rs2.getInt("Precio_Compra") + "¥" + rs2.getInt("Precio_Venta") + "¥" + rs2.getInt("idProducto") + "¥" + rs2.getString("Habilitado") + "?";
                    }

                    if (des.length() > 0) {
                        des = des.substring(0, des.length() - 1);
                    }
                    pr.setdescripcionProductos(des);
                    ps2.close();
                    rs2.close();
                } catch (SQLException sql) {
                    sql.printStackTrace();
                }

                lista.add(pr);

            }
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * from proveedores where Habilitado=?;");
            ps.setString(1, "S");
            rs = ps.executeQuery();
            while (rs.next()) {
                Proveedores pr = new Proveedores();
                pr.setIdproveedores(rs.getInt("idproveedores"));
                pr.setNombre(rs.getString("Nombre"));

                //ve.setTotal(rs.getFloat("Total"));
                listaPro.add(pr);

            }

            request.setAttribute("lista", lista);
            request.setAttribute("listaPro", listaPro);
            RequestDispatcher rd = request.getRequestDispatcher("listarProductos.jsp");
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
