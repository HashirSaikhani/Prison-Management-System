package com.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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

        String selectedPrisoner = request.getParameter("selectedPrisoner");
        List<Integer> allocatedCellIds = new ArrayList<>();
        Connection con = null;
        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?useSSL=false", "root", "hashirbluered");

            PreparedStatement pstt = con.prepareStatement("SELECT rid FROM room WHERE rcap > 0");
            ResultSet rs = pstt.executeQuery();
            while (rs.next()) {
                allocatedCellIds.add(rs.getInt("rid"));
            }

            if (!allocatedCellIds.isEmpty()) {
                // Get the first allocated cell
                int firstCellId = allocatedCellIds.get(0);

                // Update the prisoner's allocated cell
                PreparedStatement updatePrisoner = con.prepareStatement("UPDATE prisoner SET proomid = ? WHERE pname = ?");
                updatePrisoner.setInt(1, firstCellId);
                updatePrisoner.setString(2, selectedPrisoner);

                // Execute the update query
                int updateRowCount = updatePrisoner.executeUpdate();

                // Update the remaining capacity of the allocated cell
                if (updateRowCount > 0) {
                    PreparedStatement updateCell = con.prepareStatement("UPDATE room SET rcap = rcap - 1 WHERE rid = ?");
                    updateCell.setInt(1, firstCellId);
                    updateCell.executeUpdate();
                }

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
