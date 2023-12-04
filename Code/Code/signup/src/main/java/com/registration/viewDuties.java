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

@WebServlet("/Officer/viewDuties")
public class viewDuties extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	System.out.println("Inside view Duties Servlet");
    	int officerId = Integer.parseInt(request.getParameter("officerId"));
        System.out.println(officerId);

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                "hashirbluered")) {
        	
        	    PreparedStatement serchofficer = con.prepareStatement("SELECT * FROM officer WHERE oid = ?");
                serchofficer.setInt(1, officerId);
                
                ResultSet rs = serchofficer.executeQuery();
                
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create a JSON object to hold the response data
                JsonObject jsonResponse;

                if (rs.next()) {
                    System.out.println(rs.getString("oname"));
                    System.out.println(rs.getString("oduty"));

                    // Build JSON response with prisoner record data
                    jsonResponse = Json.createObjectBuilder()
                            .add("status", "success")
                            .add("officerRecord", buildOfficerRecordJson(rs))
                            .build();
                } else {
                    // No record found for the selected prisoner
                	 System.out.println("No record found for officerId: " + officerId);
                    jsonResponse = Json.createObjectBuilder().add("status", "failed").build();
                }
                
                // Write the JSON response to the PrintWriter
                try (PrintWriter out = response.getWriter()) {
                    out.print(jsonResponse.toString());
                    out.flush();
                }
                
                System.out.println("Outside view Duties Servlet");

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
        private JsonObject buildOfficerRecordJson(ResultSet rs) throws SQLException {
            return Json.createObjectBuilder()
                    .add("oname", rs.getString("oname"))
                    .add("oduty", rs.getString("oduty"))
                    .build();
        }
    }
