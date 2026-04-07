package com.mycompany.bookappointment.servlet;

import com.mycompany.bookappointment.dao.DBConnection;
import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ✅ GET PARAMETERS
            int doctorId = Integer.parseInt(request.getParameter("doctor_id"));
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String symptoms = request.getParameter("symptoms");

            // ✅ SAFE SESSION CHECK
            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("userId") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int userId = (int) session.getAttribute("userId");

            Connection con = DBConnection.getConnection();

            if (con == null) {
                response.getWriter().println("❌ Database Connection Failed");
                return;
            }

            // 🔴 CHECK DOUBLE BOOKING
            PreparedStatement check = con.prepareStatement(
                    "SELECT * FROM appointments WHERE doctor_id=? AND appointment_date=? AND time=?"
            );

            check.setInt(1, doctorId);
            check.setString(2, date);
            check.setString(3, time);

            ResultSet rs = check.executeQuery();

            if (rs.next()) {
                request.setAttribute("errorMessage", "This time slot is already booked. Please choose another.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // ✅ INSERT
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO appointments(user_id, doctor_id, appointment_date, time, symptoms, status) VALUES (?,?,?,?,?,?)"
            );

            ps.setInt(1, userId);
            ps.setInt(2, doctorId);
            ps.setString(3, date);
            ps.setString(4, time);
            ps.setString(5, symptoms);
            ps.setString(6, "Pending");

            int row = ps.executeUpdate();

            if (row > 0) {
                response.sendRedirect("success.jsp"); // ✅ NOW WILL WORK
            } else {
                response.getWriter().println("❌ Booking failed");
            }

        } catch (ServletException | IOException | NumberFormatException | SQLException e) {

           request.setAttribute("errorMessage", "Slot already booked. Try another time.");
request.setAttribute("backPage", "bookAppointment.jsp");
request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
