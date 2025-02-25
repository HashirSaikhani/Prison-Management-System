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
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");
        String Reupwd = request.getParameter("re_pass");
        RequestDispatcher dispatcher = null;
        Connection con = null;
        
        if(uname == null || uname.equals("")) {
			request.setAttribute("status", "invalidName" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        
        if(uemail == null || uemail.equals("")) {
			request.setAttribute("status", "invalidEmail" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        
        if(upwd == null || upwd.equals("")) {
			request.setAttribute("status", "invalidUpwd" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        else if(!upwd.equals(Reupwd)) {
        	request.setAttribute("status", "invalidConfirmPassword" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
        }
        
        if(umobile == null || umobile.equals("")) {
			request.setAttribute("status", "invalidMobile" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
		    }
        else if(umobile.length()<11 || umobile.length()>11) {
        	request.setAttribute("status", "invalidMobileLength" );
		    dispatcher = request.getRequestDispatcher("registration.jsp"); 
		    dispatcher.forward(request,response);
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/youtube?useSSL=false", "root", "hashirbluered");
            PreparedStatement pst = con.prepareStatement("INSERT INTO users (uname, upwd, uemail, umobile) VALUES (?, ?, ?, ?)");
            pst.setString(1, uname);
            pst.setString(2, upwd);
            pst.setString(3, uemail);
            pst.setString(4, umobile);

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
