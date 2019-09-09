package com.Stortacco.controlador.CRUDProductos;

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

public class ActualizarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {

            String Id = request.getParameter("idproductos");
            String Nombre = request.getParameter("nombre");
            String Descripcion = request.getParameter("descripcionp");
            String Cantidad = request.getParameter("cantidad");
            String PrecioCompra = request.getParameter("precioc");
            String PrecioVenta = request.getParameter("preciov");
            String idProveedor = request.getParameter("proveedor");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;

            ps = c.prepareStatement("UPDATE productos SET Nombre=?,Descripcion_Producto=?,Cantidad=?,Precio_Compra=?,Precio_Venta=?,idProveedor=? WHERE idproductos=?");
            ps.setString(1, Nombre);
            ps.setString(2, Descripcion);
            ps.setInt(3, Integer.parseInt(Cantidad));
            ps.setFloat(4, Float.parseFloat(PrecioCompra));
            ps.setFloat(5, Float.parseFloat(PrecioVenta));
            ps.setInt(6, Integer.parseInt(idProveedor));
            ps.setInt(7, Integer.parseInt(Id));
            int res = ps.executeUpdate();

            if (res > 0) {
                RequestDispatcher rd = request.getRequestDispatcher("Productos?mensaje=Y");

                rd.forward(request, response);

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("Productos?mensaje=N");

                rd.forward(request, response);
            }
            cdb.cierraConexion();
        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
            RequestDispatcher rd = request.getRequestDispatcher("Productos?mensaje=N");

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
