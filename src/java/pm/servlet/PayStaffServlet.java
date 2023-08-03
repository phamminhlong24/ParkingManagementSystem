/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.BookingDAO;
import pm.dao.ParkingSlotDAO;
import pm.dao.UserDAO;
import pm.dao.VehicleDAO;

/**
 *
 * @author tranh
 */
public class PayStaffServlet extends HttpServlet {

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
        String vehiclePlate = request.getParameter("number-plate");
        String durationHour = request.getParameter("durationHour");
        String username = (String) session.getAttribute("username");
        String date = request.getParameter("dateTime");
        String parkingNameA = request.getParameter("parkingNameA");
        String duration = "";
        boolean foundErr = false;
        int userStatus = UserDAO.getUserStatusByUserName(username);
        int vehicleStatus = VehicleDAO.getVehicleStatusByPlate(vehiclePlate);

        if (durationHour != null && durationHour != "") {
            duration = durationHour;
        }

        if (vehiclePlate == null || username == null || date == null || parkingNameA == null) {
            foundErr = true;
        }

        if (foundErr) {
            response.sendRedirect("index.html");
        } else {
            boolean result
                    = BookingDAO.insertBookingTemp(vehiclePlate, duration, parkingNameA, username, date);

            UserDAO daoU = new UserDAO();
            daoU.updateUserStatus(username);
            ParkingSlotDAO daoP = new ParkingSlotDAO();
            daoP.updateParkingStatus("3", parkingNameA);
            
            if (result) {
                response.sendRedirect("bookingHistoryStaff.jsp");
            } else {
                response.sendRedirect("index.html");
            }
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
