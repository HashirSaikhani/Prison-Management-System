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

@WebServlet("/Administrator/viewRecord2")
public class viewRecord2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside RemovePrisoner2Servlet");
        String selectedPrisoner = request.getParameter("selectedPrisoner");
        System.out.println(selectedPrisoner);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                "hashirbluered")) {

            // Retrieve the prisoner record based on the selected prisoner
            PreparedStatement retrievePrisoner = con.prepareStatement("SELECT * FROM prisoner WHERE pname = ?");
            retrievePrisoner.setString(1, selectedPrisoner);

            // Execute the select query
            ResultSet rs = retrievePrisoner.executeQuery();

            // Set the response type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON object to hold the response data
            JsonObject jsonResponse;

            if (rs.next()) {
                // Build JSON response with prisoner record data
                jsonResponse = Json.createObjectBuilder()
                        .add("status", "success")
                        .add("prisonerRecord", buildPrisonerRecordJson(rs))
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

    // Helper method to build JSON object for prisoner record
    private JsonObject buildPrisonerRecordJson(ResultSet rs) throws SQLException {
        return Json.createObjectBuilder()
                .add("pid", rs.getInt("pid"))
                .add("pname", rs.getString("pname"))
                .add("psentence", rs.getString("psentence"))
                .add("pcrime", rs.getString("pcrime"))
                .build();
    }
}
