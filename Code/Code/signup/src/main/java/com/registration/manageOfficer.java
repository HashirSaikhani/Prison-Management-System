package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manageOfficer")
public class manageOfficer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the content type of the response
        response.setContentType("text/html;charset=UTF-8");

        // Initialize PrintWriter
        PrintWriter out = response.getWriter();

        // Creating a list to store officer names
        List<String> officers = new ArrayList<>();

        // JDBC Connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/project?useSSL=false";
        String username = "root";
        String password = "hashirbluered";

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            Connection con = DriverManager.getConnection(jdbcUrl, username, password);

            // Query to retrieve all officers
            String sql = "SELECT oname FROM officer";
            PreparedStatement pst = con.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            // Add officer names to the list
            while (rs.next()) {
                officers.add(rs.getString("oname"));
            }

            // Close the resources
            rs.close();
            pst.close();
            con.close();

            // Set the list of officers as a request attribute
            request.setAttribute("officers", officers);

            // Forward the request to the JSP page
            request.getRequestDispatcher("manageOfficer.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
