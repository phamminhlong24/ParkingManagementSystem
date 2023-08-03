/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.BookingDAO;
import pm.dao.ParkingSlotDAO;
import pm.dao.UserDAO;
import pm.dao.VehicleDAO;
import pm.dto.UserA;
import pm.dto.Vehicle;

/**
 *
 * @author tranh
 */
public class ModalServlet extends HttpServlet {

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
        ParkingSlotDAO dao = new ParkingSlotDAO();
        ArrayList<Integer> list = new ArrayList<>();
        int timStartA = 0;
        int timEndA = 0;
        String parkingNameA = "";
         int idParking = -1;
         BookingDAO daoB = new BookingDAO();

        String hourModal = request.getParameter("hourModal");
        if (hourModal != null) {
            timStartA = Integer.parseInt(request.getParameter("timStartA"));
            timEndA = Integer.parseInt(request.getParameter("timEndA"));
            list = ParkingSlotDAO.getParkingSlotsId(timStartA, timEndA);
            idParking = dao.getIdSlot(list); //random ra dc con so id parking slot
            parkingNameA = dao.getSlotNameById(idParking);
            daoB.updateTimeSlotHour(1,1,timStartA, timEndA, parkingNameA);
        }else{
            list = ParkingSlotDAO.getParkingSlotsId();
            idParking = dao.getIdSlot(list);
            parkingNameA = dao.getSlotNameByIdMonth(idParking);
            daoB.updateTimeSlotMonth(1,1,parkingNameA);
        }

        HttpSession session = request.getSession(true);
//      String parkingNameA = request.getParameter("parkingNameA");
        String methodNameA = request.getParameter("methodNameA");
        String typeNameA = request.getParameter("typeNameA");
//        String hourModal = request.getParameter("hourModal");
        String vehicleA = request.getParameter("vehicleNameA");
        String username = (String) session.getAttribute("username");
        UserA userInfo = UserDAO.getAccount(username);
        Vehicle vehicleInfo = VehicleDAO.getAVehicle(vehicleA);
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss");
//          SimpleDateFormat ft = new SimpleDateFormat ("M d yy',' hh:mm");
        SimpleDateFormat ft1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dNow = ft.format(date);
        String dNow1 = ft1.format(date);
        String url = null;
        try {
            request.setAttribute("timStartA", timStartA);
            request.setAttribute("timEndA", timEndA);
            request.setAttribute("parkingNameA", parkingNameA);
            request.setAttribute("methodNameA", methodNameA);
            request.setAttribute("typeNameA", typeNameA);
            request.setAttribute("hourModal", hourModal);
            request.setAttribute("vehicleA", vehicleA);
            request.setAttribute("userInfo", userInfo);
            request.setAttribute("vehicleInfo", vehicleInfo);
            request.setAttribute("dateTime", dNow);
            request.setAttribute("dateTime1", dNow1);
            url = "Booking.jsp";

        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
