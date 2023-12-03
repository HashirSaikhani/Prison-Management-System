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

@WebServlet("/Administrator/assignDuties2")
public class assignDuties2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside AssignDuties2Servlet");
        String officerName = request.getParameter("officerName");
        String officerDuty = request.getParameter("officerDuty");

        System.out.println(officerName);
        System.out.println(officerDuty);

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");

            // Check if officer with given name exists
            PreparedStatement checkOfficer = con.prepareStatement("SELECT oid FROM officer WHERE oname = ?");
            checkOfficer.setString(1, officerName);
            ResultSet checkResult = checkOfficer.executeQuery();

            if (checkResult.next()) {
                // Officer found, update officer's duty
                int officerId = checkResult.getInt("oid");
                PreparedStatement updateOfficerDuty = con.prepareStatement("UPDATE officer SET oduty = ? WHERE oid = ?");
                updateOfficerDuty.setString(1, officerDuty);
                updateOfficerDuty.setInt(2, officerId);

                // Execute the update query
                int updateRowCount = updateOfficerDuty.executeUpdate();

                // Set the response type to JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create a JSON object to hold the response data
                JsonObject jsonResponse = Json.createObjectBuilder().add("status", (updateRowCount > 0) ? "success" : "failed")
                        .build();

                // Write the JSON response to the PrintWriter
                PrintWriter out = response.getWriter();
                out.print(jsonResponse.toString());
                out.flush();
                out.close();
                System.out.println("outside AssignDuties2Servlet");

                // No need to forward the request to another JSP
                return;
            } else {
                // Officer not found
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create a JSON object to hold the response data
                JsonObject jsonResponse = Json.createObjectBuilder().add("status", "failed").build();

                // Write the JSON response to the PrintWriter
                PrintWriter out = response.getWriter();
                out.print(jsonResponse.toString());
                out.flush();
                out.close();

                return;
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
        }
    }
}
