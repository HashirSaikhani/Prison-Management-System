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
            PreparedStatement pst = con.prepareStatement("INSERT INTO officer (oname, opwd, oemail, omobile, otype, oduty) VALUES (?, ?, ?, ?, 'officer', null)");
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
