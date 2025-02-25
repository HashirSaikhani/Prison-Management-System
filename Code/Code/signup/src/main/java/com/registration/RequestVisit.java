package com.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

@WebServlet("/Visitor/RequestVisit")
public class RequestVisit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("Inside requestvisit Servlet");
        String vname = request.getParameter("visitorName");
        String vpname = request.getParameter("prisonerName");
        String vstatus = "pending"; // Default status
        
        System.out.println(vname);
        System.out.println(vpname);

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            // Load the JDBC driver and establish a connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");

            // Prepare and execute the SQL statement
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO visitor (vname, vpname, vstatus) VALUES (?, ?, ?)");
            pst.setString(1, vname);
            pst.setString(2, vpname);
            pst.setString(3, vstatus);

            int rowCount = pst.executeUpdate();

            // Set the status attribute based on the result
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the database connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // Forward the request to an appropriate page based on the status
            dispatcher = request.getRequestDispatcher("/Visitor/RequestVisit.jsp");
            dispatcher.forward(request, response);
        }
    }
}
