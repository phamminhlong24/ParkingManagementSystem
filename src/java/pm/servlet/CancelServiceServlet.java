/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.BookingDAO;
import pm.dao.RequestDAO;
import pm.dao.UserDAO;
import pm.dto.Request;

/**
 *
 * @author tranh
 */
public class CancelServiceServlet extends HttpServlet {

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
        String url = "";
        try {
            HttpSession session = request.getSession(true);
            BookingDAO daoB = new BookingDAO();
            String vehiclePlate = request.getParameter("vehiclePlateBooingHistory");//cần
            
            String slotNumber = request.getParameter("slotPlateBooingHistory"); // cần
            
            int timeStart = Integer.parseInt(request.getParameter("timeStart"));
            int timeEnd = Integer.parseInt(request.getParameter("timeEnd"));
            if(timeStart != 0  && timeEnd != 0) {
                daoB.updateTimeSlotHour(0, 0, timeStart, timeEnd, slotNumber);
            } else {
                daoB.updateTimeSlotMonth(0, 0, slotNumber);
            }
            
            String username = (String) session.getAttribute("username");  // cần
            int userId = UserDAO.getUserIdByUserName(username);
            
            int bookingID = BookingDAO.getBookingInfoByPlateNumber(vehiclePlate); // cần
            
            String bookingID1 = String.valueOf(BookingDAO.getBookingInfoByPlateNumber(vehiclePlate));
            
            daoB.updateBookingStatus("3", bookingID1);
            
            Date date = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd"); //cần
            String dNow = ft.format(date);
            // sau đó insert vào bảng request
            boolean rq = RequestDAO.insertRequest(bookingID, userId, vehiclePlate, slotNumber, dNow);
            if(rq){
                url = "userRequest.jsp";
            }else{
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
