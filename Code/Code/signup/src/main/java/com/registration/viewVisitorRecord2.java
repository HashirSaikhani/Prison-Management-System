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

@WebServlet("/Officer/viewVisitorRecord2")
public class viewVisitorRecord2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside ViewVisitorRecord2Servlet");
        String selectedVisitor = request.getParameter("selectedVisitor");
        System.out.println(selectedVisitor);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                "hashirbluered")) {

            // Retrieve the visitor record based on the selected visitor
            PreparedStatement retrieveVisitor = con.prepareStatement("SELECT * FROM visitor WHERE vname = ?");
            retrieveVisitor.setString(1, selectedVisitor);

            // Execute the select query
            ResultSet rs = retrieveVisitor.executeQuery();

            // Set the response type to JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Create a JSON object to hold the response data
            JsonObject jsonResponse;

            if (rs.next()) {
                // Build JSON response with visitor record data
                jsonResponse = Json.createObjectBuilder()
                        .add("status", "success")
                        .add("visitorRecord", buildVisitorRecordJson(rs))
                        .build();
            } else {
                // No record found for the selected visitor
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

    // Helper method to build JSON object for visitor record
    private JsonObject buildVisitorRecordJson(ResultSet rs) throws SQLException {
        return Json.createObjectBuilder()
                .add("vid", rs.getInt("vid"))
                .add("vname", rs.getString("vname"))
                .add("vpname", rs.getString("vpname"))
                .add("vstatus", rs.getString("vstatus"))
                .build();
    }
}
