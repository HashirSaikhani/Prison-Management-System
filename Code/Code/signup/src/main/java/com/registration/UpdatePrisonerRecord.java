package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

@WebServlet("/Officer/UpdatePrisonerRecord")
public class UpdatePrisonerRecord extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("prisonerName");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        List<String> matchedPrisoners = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");

            // Use a prepared statement to prevent SQL injection
            PreparedStatement pst = con.prepareStatement("SELECT pname FROM prisoner WHERE pname LIKE ?");
            pst.setString(1, "%" + searchName + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                // Add matched prisoner names to the list
                matchedPrisoners.add(rs.getString("pname"));
            }

            // Set the matched prisoners list as a request attribute
            request.setAttribute("matchedPrisoners", matchedPrisoners);

            // Create a JSON object and add the list of matched prisoners
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("matchedPrisoners", matchedPrisoners);

            // Set the content type to JSON
            response.setContentType("application/json");
            // Get the PrintWriter to write the JSON response
            response.getWriter().print(jsonResponse.toJSONString());

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
