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

@WebServlet("/Administrator/addPrisoner")
public class addPrisoner extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pname = request.getParameter("Name");
        String pcrime = request.getParameter("crime");
        int psentence = Integer.parseInt(request.getParameter("sentence")); // Parse as integer

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO prisoner (pname, pcrime, psentence) VALUES (?, ?, ?)");
            pst.setString(1, pname);
            pst.setString(2, pcrime);
            pst.setInt(3, psentence);

            int rowCount = pst.executeUpdate();

            dispatcher = request.getRequestDispatcher("/Administrator/addPrisoner.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
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
            dispatcher.forward(request, response);
        }
    }
}
//
////OOP Principles:
//Encapsulation:
//
//The servlet encapsulates the functionality related to adding a prisoner within the doPost method.
//Inheritance:
//
//The class addPrisoner extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doPost method is an example of polymorphism, as it overrides the doPost method defined in the HttpServlet class.
//SOLID Principles:
//Single Responsibility Principle (SRP):
//
//The addPrisoner class has a single responsibility: handling the addition of a prisoner. It parses the request, interacts with the database, and forwards the request.
