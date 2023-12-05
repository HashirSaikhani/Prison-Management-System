package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Officer/PermitMedicalRequest2")
public class PermitMedicalRequest2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside PermitMedicalRequest2Servlet");
        String selectedPrisoner = request.getParameter("selectedPrisoner");
        System.out.println(selectedPrisoner);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                "hashirbluered")) {

            // Retrieve the medical request record based on the selected prisoner
            PreparedStatement retrieveMedicalRequest = con.prepareStatement("SELECT * FROM medicalRequest WHERE mpname = ?");
            retrieveMedicalRequest.setString(1, selectedPrisoner);

            // Execute the select query
            ResultSet rs = retrieveMedicalRequest.executeQuery();

            // Set the response type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON object to hold the response data
            JsonObject jsonResponse;

            if (rs.next()) {
                // Build JSON response with medical request record data
                System.out.println("Outside PermitMedicalRequest2Servlet");
                jsonResponse = Json.createObjectBuilder()
                        .add("status", "success")
                        .add("prisonerRecord", buildMedicalRequestRecordJson(rs))
                        .build();
            } else {
                // No record found for the selected prisoner
                jsonResponse = Json.createObjectBuilder().add("status", "failed").build();
            }

            // Write the JSON response to the PrintWriter
            try (PrintWriter out = response.getWriter()) {
                out.print(jsonResponse.toString());
                out.flush();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database-related exceptions and return an error response
            JsonObject errorResponse = Json.createObjectBuilder()
                    .add("status", "error")
                    .add("message", "An error occurred while processing the request: " + e.getMessage())
                    .build();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            try (PrintWriter out = response.getWriter()) {
                out.print(errorResponse.toString());
                out.flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions and return an error response
            JsonObject errorResponse = Json.createObjectBuilder()
                    .add("status", "error")
                    .add("message", "An unexpected error occurred: " + e.getMessage())
                    .build();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            try (PrintWriter out = response.getWriter()) {
                out.print(errorResponse.toString());
                out.flush();
            }
        }
    }

    // Helper method to build JSON object for medical request record
    private JsonObject buildMedicalRequestRecordJson(ResultSet rs) throws SQLException {
        return Json.createObjectBuilder()
                .add("mrid", rs.getInt("mrid"))
                .add("mrprisonerid", rs.getInt("mrprisonerid"))
                .add("mpname", rs.getString("mpname"))
                .add("mdisease", rs.getString("mdisease"))
                .add("mrstatus", rs.getString("mrstatus"))
                .build();
    }
}
