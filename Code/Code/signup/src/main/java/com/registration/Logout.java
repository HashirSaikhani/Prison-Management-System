package com.registration;
import java.io.IOException;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}

}


//OOP Principles:
//Encapsulation:
//
//The servlet encapsulates the functionality related to user logout within the doGet method. It handles session invalidation and redirects the user to the login page.
//Inheritance:
//
//Similar to the previous examples, the Logout class extends HttpServlet, indicating inheritance from the servlet class.
//Polymorphism:
//
//The doGet method demonstrates polymorphism by overriding the doGet method defined in the HttpServlet class.
//SOLID Principles:
//Single Responsibility Principle (SRP):
//
//The Logout class adheres to SRP by having a single responsibility: handling user logout-related tasks, including session invalidation and redirection.
//Open/Closed Principle (OCP):
//
//The class is open for extension (by adding more functionality) and closed for modification (as the existing code doesn't need modification for its basic functionality).