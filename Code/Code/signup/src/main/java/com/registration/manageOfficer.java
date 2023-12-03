package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

@WebServlet("/Administrator/manageOfficer")
public class manageOfficer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("officerName");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        List<String> matchedOfficers = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");

            // Use a prepared statement to prevent SQL injection
            PreparedStatement pst = con.prepareStatement("SELECT oname FROM officer WHERE oname LIKE ?");
            pst.setString(1, "%" + searchName + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                // Add matched officer names to the list
                matchedOfficers.add(rs.getString("oname"));
            }

            // Set the matched officers list as a request attribute
            request.setAttribute("matchedOfficers", matchedOfficers);

            // Create a JSON object and add the list of matched officers
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("matchedOfficers", matchedOfficers);

            // Set the content type to JSON
            response.setContentType("application/json");
            // Get the PrintWriter to write the JSON response
            response.getWriter().print(jsonResponse.toJSONString());

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
//
//OOP Principles:
//Encapsulation:
//
//The servlet encapsulates the functionality related to managing officers within the doGet and doPost methods. It handles database interactions, retrieves officer names, and sets request attributes.
//Inheritance:
//
//Similar to the previous examples, the manageOfficer class extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doGet and doPost methods demonstrate polymorphism by overriding the corresponding methods defined in the HttpServlet class.
//SOLID Principles:
//Single Responsibility Principle (SRP):
//
//The manageOfficer class adheres to SRP by having a single responsibility: handling officer management-related tasks, including retrieving officer names and forwarding the request to a JSP page.
//Open/Closed Principle (OCP):
//
//The class is open for extension (by adding more functionality) and closed for modification (as the existing code doesn't need modification for its basic functionality).
//		
//		
//		Dependency Inversion Principle (DIP):
//
//			The code uses JDBC for database interaction, and JDBC itself adheres to DIP by providing a standard interface for database access.