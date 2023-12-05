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

@WebServlet("/Officer/PermitMedicalRequest3")
public class PermitMedicalRequest3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Inside UpdateMedicalRequest3Servlet");

        // Get parameters from the request
        int editedMedicalRequestID = Integer.parseInt(request.getParameter("editPrisonerID")); // Change parameter name
        String editedMedicalRequestStatus = request.getParameter("editPrisonerRequestStatus");
        // Add other parameters as needed for updating medical request information

        System.out.println(editedMedicalRequestID);
        System.out.println(editedMedicalRequestStatus);
        // Print other parameters for debugging

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/project?useSSL=false";
        String dbUser = "root";
        String dbPassword = "hashirbluered";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            // Prepare SQL statement to update medical request information
            String updateQuery = "UPDATE medicalRequest SET mrstatus = ? WHERE mrid = ?";
            // Add other columns to update in the SET clause as needed

            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                // Set parameters for the prepared statement
                preparedStatement.setString(1, editedMedicalRequestStatus);
                preparedStatement.setInt(2, editedMedicalRequestID);
                // Set other parameters for updating medical request information

                // Execute the update statement
                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println("Outside UpdateMedicalRequest3Servlet");

                // Check if the update was successful
                if (rowsAffected > 0) {
                    // Send a success response
                    response.getWriter().write("{\"status\": \"success\"}");
                } else {
                    // Send a failure response
                    response.getWriter().write("{\"status\": \"failed\", \"message\": \"No rows updated.\"}");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions and return an error response
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Database error.\"}");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            response.getWriter().write("{\"status\": \"error\", \"message\": \"An unexpected error occurred.\"}");
        }
    }
}
