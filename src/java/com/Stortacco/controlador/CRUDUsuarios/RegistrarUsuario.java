package com.Stortacco.controlador.CRUDUsuarios;

import com.Stortacco.modelo.Conectadb;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombre = request.getParameter("nom");
            String apellido = request.getParameter("ape");
            String fechanacimiento = request.getParameter("fn");
            String tidentificacion = request.getParameter("ti");
            String nidentificacion = request.getParameter("ni");
            String direccion = request.getParameter("dir");
            String telefono = request.getParameter("tel");
            String email = request.getParameter("email");
            String rol = request.getParameter("rol");
            String password = request.getParameter("contra");

            Conectadb cdb = new Conectadb();
            Connection c = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            Date fe = new Date();
            DateFormat fef = new SimpleDateFormat("yyyy-MM-dd");
            String hoy = fef.format(fe);

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(fef.parse(hoy));
            calendar.add(Calendar.YEAR, -18);
            Date dateLimite = calendar.getTime();

            if (fef.parse(fechanacimiento).after(dateLimite)) {
                RequestDispatcher rd = request.getRequestDispatcher("RegistrarUsuario.jsp?mensaje=NULL");
                rd.forward(request, response);
            } else {
                ps = c.prepareStatement("select * from usuarios where Email=?;");
                ps.setString(1, email);
                rs = ps.executeQuery();

                if (rs.next()) {

                    RequestDispatcher rd = request.getRequestDispatcher("RegistrarUsuario.jsp?mensaje=NULL");
                    rd.forward(request, response);

                } else {
                    ps.close();
                    rs.close();
                    ps = c.prepareStatement("insert into usuarios (Email,Password,Rol,Habilitado) Values(?,?,?,?); ");
                    ps.setString(1, email);
                    ps.setString(2, password);
                    if (rol == null) {

                        ps.setString(3, "cliente");
                    } else {
                        ps.setString(3, rol);
                    }
                    ps.setString(4, "S");

                    int res = ps.executeUpdate();

                    if (res > 0) {

                        ps.close();
                        ps = c.prepareStatement("select * from usuarios where Email=?;");
                        ps.setString(1, email);
                        rs = ps.executeQuery();
                        if (rs.next()) {

                            int idU = rs.getInt("idusuarios");

                            ps.close();
                            rs.close();
                            ps = c.prepareStatement("insert into informacion_usuarios (Fecha_Registro,Nombre,Apellidos,Fecha_Nacimiento,Tarjeta_Identificacion,Numero_Identificacion,Direccion,Telefono,IdUsuario,Habilitado) Values(?,?,?,?,?,?,?,?,?,?); ");
                            ps.setString(1, fef.format(fe));
                            ps.setString(2, nombre);
                            ps.setString(3, apellido);
                            ps.setString(4, fechanacimiento);
                            ps.setString(5, tidentificacion);
                            ps.setString(6, nidentificacion);
                            ps.setString(7, direccion);
                            ps.setString(8, telefono);
                            ps.setInt(9, idU);
                            ps.setString(10, "S");

                            int res2 = ps.executeUpdate();
                            if (res2 > 0) {

                                if (rol == null) {
                                    RequestDispatcher rd = request.getRequestDispatcher("Acceder?email=" + email + "&pass=" + password + "&bienvenido=S");
                                    rd.forward(request, response);
                                } else {
                                    RequestDispatcher rd = request.getRequestDispatcher("Usuarios?mensaje=SI");
                                    rd.forward(request, response);
                                }
                            }
                        }

                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("Usuarios?mensaje=NBD");
                        rd.forward(request, response);
                    }
                }
            }

            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println(sql.getStackTrace());
            RequestDispatcher rd = request.getRequestDispatcher("RegistrarUsuario.jsp?mensaje=NO");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(RegistrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(RegistrarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
