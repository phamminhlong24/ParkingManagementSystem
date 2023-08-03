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
import pm.dao.BookingDAO;
import pm.dao.ParkingSlotDAO;
import pm.dao.RequestDAO;
import pm.dao.VehicleDAO;

/**
 *
 * @author tranh
 */
public class AccecptCancelBookingServlet extends HttpServlet {

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
        String url = "adminUserRequest.jsp";
        try {
            String requestID = request.getParameter("requestID");
            String userID = request.getParameter("userID");
            String slotNumber = request.getParameter("slotNumber");
            String vehiclePlateNumber = request.getParameter("vehiclePlateNumber");
            String bookingID = request.getParameter("bookingID");

            if (requestID != null) {
                RequestDAO daoR = new RequestDAO();
                daoR.updateRequestStatus("1", requestID);
            } else {
                url = "error.jsp";
            }

            if (slotNumber != null) {
                ParkingSlotDAO daoP = new ParkingSlotDAO();
                daoP.updateParkingStatus("0", slotNumber);
            } else {
                url = "error.jsp";
            }

            if (vehiclePlateNumber != null) {
                VehicleDAO daoV = new VehicleDAO();
                daoV.updateVehicleStatus("0", vehiclePlateNumber);
            } else {
                url = "error.jsp";
            }

            if (bookingID != null) {
                BookingDAO daoB = new BookingDAO();
                daoB.updateBookingStatus("4", bookingID);
            } else {
                url = "error.jsp";
            }
        } finally {
            response.sendRedirect(url);
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
