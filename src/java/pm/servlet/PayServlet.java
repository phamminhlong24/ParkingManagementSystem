/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.BookingDAO;
import pm.dao.PaymentDAO;
import pm.dao.UserDAO;
import pm.dao.VehicleDAO;
import pm.dto.Booking;

/**
 *
 * @author tranh
 */
public class PayServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);

        Integer uid = (Integer) session.getAttribute("userID");
        String vehiclePlate = request.getParameter("number-plate");
        String durationHour = request.getParameter("durationHour");
        String durationMonth = request.getParameter("durationMonth");
        String username = (String) session.getAttribute("username");
        String date = request.getParameter("dateTime");
        String parkingNameA = request.getParameter("parkingNameA");
        String method = request.getParameter("paymentMethod");
        int timeStart = Integer.parseInt(request.getParameter("timeStart"));
        int timeEnd = Integer.parseInt(request.getParameter("timeEnd"));

        String duration = "0";
        int type = 1;
        int methodPay;

        boolean foundErr = false;
        int userStatus = UserDAO.getUserStatusByUserName(username);
        if (method == "CASH") {
            methodPay = 2;
        } else {
            methodPay = 1;
        }

        if (durationMonth != null) {
            duration = "720";
            type = 2;
        }

        if (durationHour != null && durationHour != "") {
            duration = durationHour;
            type = 1;
        }

        if (vehiclePlate == null || username == null || date == null || parkingNameA == null) {
            foundErr = true;
        }

        int durationMoney = Integer.parseInt(duration) * 10000;

        if (foundErr) {
            response.sendRedirect("index.html");
        } else {
            BookingDAO.insertBooking(vehiclePlate, duration, parkingNameA, username, date,timeStart,timeEnd);
            Booking bk = BookingDAO.getBookingInfoBySlotNum(parkingNameA);
            PaymentDAO.insertPayment(bk.getBookingID(), durationMoney, type, uid, methodPay);
            UserDAO daoU = new UserDAO();
            daoU.updateUserStatus(username);
            response.sendRedirect("bookingHistory.jsp");
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
