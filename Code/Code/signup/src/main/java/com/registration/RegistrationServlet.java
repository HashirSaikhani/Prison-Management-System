package com.registration;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oname = request.getParameter("name");
        String oemail = request.getParameter("email");
        String opwd = request.getParameter("pass");
        String omobile = request.getParameter("contact");
        String Reopwd = request.getParameter("re_pass");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        
        if(oname == null || oname.equals("")) {
			request.setAttribute("status", "invalidName" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        
        if(oemail == null || oemail.equals("")) {
			request.setAttribute("status", "invalidEmail" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        
        if(opwd == null || opwd.equals("")) {
			request.setAttribute("status", "invalidUpwd" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        else if(!opwd.equals(Reopwd)) {
        	request.setAttribute("status", "invalidConfirmPassword" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
        }
        
        if(omobile == null || omobile.equals("")) {
			request.setAttribute("status", "invalidMobile" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        else if(omobile.length()<11 || omobile.length()>11) {
        	request.setAttribute("status", "invalidMobileLength" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");
            PreparedStatement pst = con.prepareStatement("INSERT INTO officer (oname, opwd, oemail, omobile, otype, oduty) VALUES (?, ?, ?, ?, 'officer', 'null')");
            pst.setString(1, oname);
            pst.setString(2, opwd);
            pst.setString(3, oemail);
            pst.setString(4, omobile);

            int rowCount = pst.executeUpdate();

            dispatcher = request.getRequestDispatcher("registration.jsp");
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);
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
//The servlet encapsulates the functionality related to user registration within the doPost method. It handles input validation, database interactions, and forwards the request to a JSP page.
//Inheritance:
//
//Similar to the previous examples, the RegistrationServlet class extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doPost method demonstrates polymorphism by overriding the doPost method defined in the HttpServlet class.
//SOLID Principles:
//Single Responsibility Principle (SRP):
//
//The RegistrationServlet class adheres to SRP by having a single responsibility: handling user registration-related tasks, including input validation, database queries, and forwarding the request to a JSP page.
//Open/Closed Principle (OCP):
//
//The class is open for extension (by adding more functionality) and closed for modification (as the existing code doesn't need modification for its basic functionality).
//		
//		
//		Dependency Inversion Principle (DIP):
//
//			The code uses JDBC for database interaction, and JDBC itself adheres to DIP by providing a standard interface for database access.