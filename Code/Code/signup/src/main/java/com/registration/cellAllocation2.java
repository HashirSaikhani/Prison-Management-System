package com.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.json.Json;
import javax.json.JsonObject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Administrator/cellAllocation2")
public class cellAllocation2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Inside cellAllocation2 servlet");
        String selectedPrisoner = request.getParameter("selectedPrisoner");
        System.out.println(selectedPrisoner);
        List<Integer> allocatedCellIds = new ArrayList<>();
        Connection con = null;
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root",
                    "hashirbluered");

            PreparedStatement pstt = con.prepareStatement("SELECT rid FROM room WHERE rcap > 0");
            ResultSet rs = pstt.executeQuery();
            while (rs.next()) {
                allocatedCellIds.add(rs.getInt("rid"));
            }

            if (!allocatedCellIds.isEmpty()) {
                // Get the first allocated cell
                int firstCellId = allocatedCellIds.get(0);
                System.out.println(firstCellId);

                // Update the prisoner's allocated cell
                PreparedStatement updatePrisoner = con
                        .prepareStatement("UPDATE prisoner SET proomid = ? WHERE pname = ?");
                updatePrisoner.setInt(1, firstCellId);
                updatePrisoner.setString(2, selectedPrisoner);

                // Execute the update query
                int updateRowCount = updatePrisoner.executeUpdate();

                // Update the remaining capacity of the allocated cell
                if (updateRowCount > 0) {
                    PreparedStatement updateCell = con
                            .prepareStatement("UPDATE room SET rcap = rcap - 1 WHERE rid = ?");
                    updateCell.setInt(1, firstCellId);
                    updateCell.executeUpdate();
                }

                // Set the response type to JSON
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Create a JSON object to hold the response data
                JsonObject jsonResponse = Json.createObjectBuilder().add("status", (updateRowCount > 0) ? "success" : "failed").build();

                // Write the JSON response to the PrintWriter
                PrintWriter out = response.getWriter();
                out.print(jsonResponse.toString());
                out.flush();

                dispatcher = request.getRequestDispatcher("/Administrator/cellAllocation.jsp");
                if (updateRowCount > 0) {
                    request.setAttribute("status", "success");
                } else {
                    request.setAttribute("status", "failed");
                }
            } else {
                dispatcher = request.getRequestDispatcher("/Administrator/cellAllocation.jsp");
                request.setAttribute("status", "failed");
            }

            System.out.println("outside cellAllocation2 servlet");
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
