package com.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;

@WebServlet("/Administrator/cellAllocation2")
public class cellAllocation2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Integer> allocatedCellIds = new ArrayList<>();
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");

            // Use a prepared statement to prevent SQL injection
            PreparedStatement pst = con.prepareStatement("SELECT rid FROM room WHERE rcap > 0");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                // Add allocated cell IDs to the list
                allocatedCellIds.add(rs.getInt("rid"));
            }

            // Create a JSON object
            JSONObject jsonResponse = new JSONObject();
            
            // Add the list of allocated cell IDs to the JSON object
            jsonResponse.put("allocatedCellIds", allocatedCellIds);

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
//The servlet encapsulates the functionality related to cell allocation within the doPost method. It handles database interactions, prepares JSON responses, and sets request attributes.
//Inheritance:
//
//Similar to the previous example, the cellAllocation class extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doPost method demonstrates polymorphism by overriding the doPost method defined in the HttpServlet class.
//
//
//SOLID Principles:
//	
//Single Responsibility Principle (SRP):
//
//The cellAllocation class adheres to SRP by having a single responsibility: handling cell allocation-related tasks, including searching for prisoners, processing the results, and generating a JSON response.
//Open/Closed Principle (OCP):
//
//The class is open for extension (by adding more functionality) and closed for modification (as the existing code doesn't need modification for its basic functionality).
//
//Dependency Inversion Principle (DIP):
//The code uses JDBC for database interaction, and JDBC itself adheres to DIP by providing a standard interface for database access.
