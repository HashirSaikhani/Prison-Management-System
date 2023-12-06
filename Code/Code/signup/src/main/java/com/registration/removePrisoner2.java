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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Administrator/removePrisoner2")
public class removePrisoner2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside RemovePrisonerServlet");
        String selectedPrisoner = request.getParameter("selectedPrisoner");
        System.out.println(selectedPrisoner);

        Connection con = null;
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");

            // Fetch the pid based on pname
            int pid = getPrisonerId(con, selectedPrisoner);

            if (pid != -1) {
                // Delete the prisoner from the prisoner table using pid
                PreparedStatement deletePrisoner = con.prepareStatement("DELETE FROM prisoner WHERE pid = ?");
                deletePrisoner.setInt(1, pid);

                // Execute the delete query
                int deleteRowCount = deletePrisoner.executeUpdate();

                // Set the response type to JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create a JSON object to hold the response data
                JsonObject jsonResponse = Json.createObjectBuilder()
                        .add("status", (deleteRowCount > 0) ? "success" : "failed").build();

                // Write the JSON response to the PrintWriter
                PrintWriter out = response.getWriter();
                out.print(jsonResponse.toString());
                out.flush();

                dispatcher = request.getRequestDispatcher("/Administrator/removePrisoner.jsp");
                if (deleteRowCount > 0) {
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("status", "failed");
                }
            } else {
                // Handle the case where pid is not found for the given pname
                System.out.println("Prisoner not found for pname: " + selectedPrisoner);
            }

            System.out.println("Outside RemovePrisonerServlet");
            dispatcher.forward(request, response);

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the exception or handle it appropriately
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); // Log the exception or handle it appropriately
            }
        }
    }

    private int getPrisonerId(Connection con, String pname) throws SQLException {
        // Fetch the pid based on pname
        int pid = -1;
        String sql = "SELECT pid FROM prisoner WHERE pname = ?";
        try (PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, pname);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    pid = resultSet.getInt("pid");
                }
            }
        }
        return pid;
    }
}
