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

@WebServlet("/Officer/UpdatePrisonerRecord3")
public class UpdatePrisonerRecord3 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Inside UpdatePrisonerRecord3Servlet");

        // Get parameters from the request
        int editedPrisonerID = Integer.parseInt(request.getParameter("editPrisonerID"));
        String editedPrisonerName = request.getParameter("editPrisonerName");
        String editedPrisonerSentence = request.getParameter("editPrisonerSentence");
        String editedPrisonerCrime = request.getParameter("editPrisonerCrime");
        int editedPrisonerRoomID = Integer.parseInt(request.getParameter("editPrisonerRoomID"));

        System.out.println(editedPrisonerID);
        System.out.println(editedPrisonerName);
        System.out.println(editedPrisonerSentence);
        System.out.println(editedPrisonerCrime);
        System.out.println(editedPrisonerRoomID);

        // Database connection parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/project?useSSL=false";
        String dbUser = "root";
        String dbPassword = "hashirbluered";

        try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            // Prepare SQL statement to update prisoner information
            String updateQuery = "UPDATE prisoner SET pname = ?, psentence = ?, pcrime = ?, proomid = ? WHERE pid = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                // Set parameters for the prepared statement
                preparedStatement.setString(1, editedPrisonerName);
                preparedStatement.setString(2, editedPrisonerSentence);
                preparedStatement.setString(3, editedPrisonerCrime);
                preparedStatement.setInt(4, editedPrisonerRoomID);
                preparedStatement.setInt(5, editedPrisonerID);

                // Execute the update statement
                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println("Outside UpdatePrisonerRecord3Servlet");

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
