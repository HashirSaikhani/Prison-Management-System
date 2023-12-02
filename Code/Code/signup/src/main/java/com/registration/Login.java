package com.registration;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String oemail = request.getParameter("username");
		String opwd = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		if(oemail == null || oemail.equals("")) {
			request.setAttribute("status", "invalidEmail" );
		    dispatcher = request.getRequestDispatcher("login.jsp"); 
		    dispatcher.forward(request,response);
		    }
		
		if(opwd == null || opwd.equals("")) {
			request.setAttribute("status", "invalidUpwd" );
		    dispatcher = request.getRequestDispatcher("login.jsp"); 
		    dispatcher.forward(request,response);
		    }
		
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver");
	         Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");
			 PreparedStatement pst = con.prepareStatement("select * from officer where oemail = ? and opwd = ?");
			 pst.setString(1, oemail);
			 pst.setString(2, opwd);
			
			 ResultSet rs = pst.executeQuery();
			 if(rs.next()) {
			     if(oemail.equals("administrator@gmail.com")) {
			         session.setAttribute("name", rs.getString("oname"));
			         dispatcher = request.getRequestDispatcher("/Administrator/AdministratorHome.jsp");
			     } else if(oemail.equals("prisoner@gmail.com")) {
			         session.setAttribute("name", rs.getString("oname"));
			         dispatcher = request.getRequestDispatcher("/Prisoner/PrisonerHome.jsp");
			     } else if(oemail.equals("visitor@gmail.com")) {
			         session.setAttribute("name", rs.getString("oname"));
			         dispatcher = request.getRequestDispatcher("/Visitor/VisitorHome.jsp");
			     } else {
			         session.setAttribute("name", rs.getString("oname"));
			         dispatcher = request.getRequestDispatcher("/Officer/OfficerHome.jsp");
			     }
			 } else {
			     request.setAttribute("status", "failed");
			     dispatcher = request.getRequestDispatcher("login.jsp");
			 }
			 dispatcher.forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}


//OOP Principles:
//Encapsulation:
//
//The servlet encapsulates the functionality related to user login within the doPost method. It handles user input validation, database interactions, and session management.
//Inheritance:
//
//Similar to the previous examples, the Login class extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doPost method demonstrates polymorphism by overriding the doPost method defined in the HttpServlet class.
//SOLID Principles:
//Single Responsibility Principle (SRP):
//
//The Login class adheres to SRP by having a single responsibility: handling user login-related tasks, including input validation, database queries, and session management.
//Open/Closed Principle (OCP):
//
//The class is open for extension (by adding more functionality) and closed for modification (as the existing code doesn't need modification for its basic functionality).
//Dependency Inversion Principle (DIP):
//
//The code uses JDBC for database interaction, and JDBC itself adheres to DIP by providing a standard interface for database access.
