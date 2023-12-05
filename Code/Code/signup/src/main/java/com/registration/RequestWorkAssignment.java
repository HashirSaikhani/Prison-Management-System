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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

@WebServlet("/Prisoner/RequestWorkAssignment")
public class RequestWorkAssignment extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String prisonerName = request.getParameter("prisonerName");
        String workAssignment = request.getParameter("workAssignment");

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");

            // Retrieve prisoner ID based on the name
            int prisonerId = getPrisonerId(con, prisonerName);

            // Insert work assignment request
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO work_assignment (wprisonerid, wwork, wpname) VALUES (?, ?, ?)");
            pst.setInt(1, prisonerId);
            pst.setString(2, workAssignment);
            pst.setString(3, prisonerName);

            int rowCount = pst.executeUpdate();

            dispatcher = request.getRequestDispatcher("/Prisoner/RequestWorkAssignment.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

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
            dispatcher.forward(request, response);
        }
    }

    // Helper method to get prisoner ID based on the name
    private int getPrisonerId(Connection con, String prisonerName) throws SQLException {
        int prisonerId = -1;
        PreparedStatement pst = con.prepareStatement("SELECT pid FROM prisoner WHERE pname = ?");
        pst.setString(1, prisonerName);

        ResultSet resultSet = pst.executeQuery();
        if (resultSet.next()) {
            prisonerId = resultSet.getInt("pid");
        }

        return prisonerId;
    }
}
