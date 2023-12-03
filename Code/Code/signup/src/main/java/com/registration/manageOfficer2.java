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

@WebServlet("/Administrator/manageOfficer2")
public class manageOfficer2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside ManageOfficer2Servlet");
        String selectedOfficer = request.getParameter("selectedOfficer");
        System.out.println(selectedOfficer);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                "hashirbluered")) {

            // Retrieve the officer record based on the selected officer
            PreparedStatement retrieveOfficer = con.prepareStatement("SELECT * FROM officer WHERE oname = ?");
            retrieveOfficer.setString(1, selectedOfficer);

            // Execute the select query
            ResultSet rs = retrieveOfficer.executeQuery();

            // Set the response type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON object to hold the response data
            JsonObject jsonResponse;

            if (rs.next()) {
                // Build JSON response with officer record data
            	System.out.println("outside ManageOfficer2Servlet");
                jsonResponse = Json.createObjectBuilder()
                        .add("status", "success")
                        .add("officerRecord", buildOfficerRecordJson(rs))
                        .build();
            } else {
                // No record found for the selected officer
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

    // Helper method to build JSON object for officer record
    private JsonObject buildOfficerRecordJson(ResultSet rs) throws SQLException {
        return Json.createObjectBuilder()
                .add("oid", rs.getInt("oid"))
                .add("oname", rs.getString("oname"))
                .add("oemail", rs.getString("oemail"))
                .add("opwd", rs.getString("opwd"))
                .add("omobile", rs.getString("omobile"))
                .add("oduty", rs.getString("oduty"))
                .build();
        
    }
}
