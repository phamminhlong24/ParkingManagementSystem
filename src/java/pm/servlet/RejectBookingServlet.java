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

/**
 *
 * @author tranh
 */
public class RejectBookingServlet extends HttpServlet {

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
        String bookingID = request.getParameter("bookingID");
        int bookingHour = Integer.parseInt(request.getParameter("bookingHour"));
        String slotNumberBooking =request.getParameter("slotNumberBooking");
        int timeStart = Integer.parseInt(request.getParameter("timeStart"));
        int timeEnd = Integer.parseInt(request.getParameter("timeEnd"));
        String url = "adminUserBooking.jsp";
        try {
            if (bookingID != null) {
                BookingDAO daoB = new BookingDAO();
                daoB.updateBookingStatus("2", bookingID);// status = 2 -> Cancel
                if(bookingHour == 720 ){
                daoB.updateTimeSlotMonth(0, 0, slotNumberBooking);
                } else if(bookingHour < 720 ){
                daoB.updateTimeSlotHour(0, 0, timeStart, timeEnd, slotNumberBooking);
                }
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
