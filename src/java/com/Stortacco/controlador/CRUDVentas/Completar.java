package com.Stortacco.controlador.CRUDVentas;

import com.Stortacco.modelo.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;

public class Completar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Completar() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> al = new ArrayList<String>();
        try {
            DataSource ds = DataSource.getInstace();
            Connection conn = ds.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select Nombre from productos";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                al.add(rs.getString("Nombre"));
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        JSONArray json = new JSONArray(al);
        response.setContentType("application/json");
        response.getWriter().print(json);
    }

}
