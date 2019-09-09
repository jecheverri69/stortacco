package com.Stortacco.controlador.CRUDVentas;

import com.Stortacco.modelo.Conectadb;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class RegistrarVenta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        request.setCharacterEncoding("UTF-8");
        try {

            int total = Integer.parseInt(request.getParameter("totalRV").replace(".", ""));
            JSONArray jsonArray = new JSONArray(request.getParameter("productosListosRV"));

            HttpSession session = request.getSession();
            int idUsuarios = (int) session.getAttribute("idUsuarios");
            String nombreUsuario = (String) session.getAttribute("Nombre");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            Date fe = new Date();
            DateFormat fef = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat heh = new SimpleDateFormat("HH:mm:ss");

            DateFormat fecc = new SimpleDateFormat("ddMMyyyy");
            DateFormat horac = new SimpleDateFormat("hhmmss");
            String codigo = "f" + fecc.format(fe) + "h" + horac.format(fe);

            ps = c.prepareStatement("insert into ventas (Codigo,Fecha_Registro,Hora_Registro,idUsuario,Total) values (?,?,?,?,?);");
            ps.setString(1, codigo);
            ps.setString(2, fef.format(fe));
            ps.setString(3, heh.format(fe));
            ps.setInt(4, idUsuarios);
            ps.setInt(5, total);
            int res = ps.executeUpdate();

            if (res > 0) {
                ps.close();

                ps = c.prepareStatement("select * from ventas where Codigo=?;");
                ps.setString(1, codigo);
                rs = ps.executeQuery();

                if (rs.next()) {

                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject object = jsonArray.getJSONObject(i);

                        ps = c.prepareStatement("insert into detalles_ventas (idVenta,idProducto,Cantidad) values (?,?,?);");
                        ps.setInt(1, rs.getInt("idventas"));
                        ps.setInt(2, Integer.parseInt(object.getString("codigo")));
                        ps.setInt(3, object.getInt("cantidad"));
                        ps.executeUpdate();

                    }

                    String appPath = request.getServletContext().getRealPath("");
                    String savePath = appPath + "Facturas" + File.separator + rs.getInt("idventas") + ".pdf";

                    GenerarFactura gf = new GenerarFactura();
                    gf.EstructuraPDF(savePath, nombreUsuario, fef.format(fe), heh.format(fe), rs.getInt("idventas"), String.valueOf(total));

                    response.getWriter().print(rs.getInt("idventas") + ".pdf");

                } else {
                    response.getWriter().print("Error busqueda de id Venta");
                }
            } else {
                response.getWriter().print("Error registro de Venta");
            }

        } catch (SQLException sql) {
            response.getWriter().print("Error general de MySQL");
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
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(RegistrarVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(RegistrarVenta.class.getName()).log(Level.SEVERE, null, ex);
        }
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
