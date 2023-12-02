package com.registration;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/Administrator/cellAllocation")
public class cellAllocation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchName = request.getParameter("prisonerName");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        List<String> matchedPrisoners = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");

            // Use a prepared statement to prevent SQL injection
            PreparedStatement pst = con.prepareStatement("SELECT pname FROM prisoner WHERE pname LIKE ?");
            pst.setString(1, "%" + searchName + "%");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                // Add matched prisoner names to the list
                matchedPrisoners.add(rs.getString("pname"));
            }
            
            // Print the matched prisoners to the console
            System.out.println("Matched Prisoners:");
            for (String prisoner : matchedPrisoners) {
                System.out.println(prisoner);
            }

            // Set the matched prisoners list as a request attribute
            request.setAttribute("matchedPrisoners", matchedPrisoners);

            dispatcher = request.getRequestDispatcher("/Administrator/cellAllocation.jsp");
            request.setAttribute("status", "Successfully Allocated");

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
            dispatcher.forward(request, response);
        }
    }
}

