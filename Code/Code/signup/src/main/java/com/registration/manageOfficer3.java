package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manageOfficer3")
public class manageOfficer3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String editedOfficerName = request.getParameter("editedOfficerName");
        // Add similar lines for other editable fields

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/project?useSSL=false";
        String dbUser = "root";
        String dbPassword = "hashirbluered";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            // Prepare SQL statement to update officer information
            String updateQuery = "UPDATE officer SET oname = ? WHERE oid = ?"; // Modify this query as needed
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                // Set parameters for the prepared statement
                preparedStatement.setString(1, editedOfficerName);
                // Add similar lines for other editable fields

                // Execute the update statement
                int rowsAffected = preparedStatement.executeUpdate();

                // Check if the update was successful
                if (rowsAffected > 0) {
                    // Send a success response
                    response.getWriter().write("{'status': 'success'}");
                } else {
                    // Send a failure response
                    response.getWriter().write("{'status': 'failed', 'message': 'No rows updated.'}");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions and return an error response
            response.getWriter().write("{'status': 'error', 'message': 'Database error.'}");
        }
    }
}
