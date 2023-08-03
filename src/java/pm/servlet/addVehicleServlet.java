/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.VehicleDAO;
import pm.dto.RegistrationError;

/**
 *
 * @author KIM DUONG
 */
public class addVehicleServlet extends HttpServlet {

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
        String txtVehicleName = request.getParameter("txtVehicleName");
        String txtVehiclePlateNum = request.getParameter("txtVehiclePlateNum");
        String txtVehicleDes = request.getParameter("txtVehicleDes");
        Integer userID = (Integer) session.getAttribute("userID");
        int status = 0;

        RegistrationError errors = new RegistrationError();
        boolean foundErr = false;
        String url = "addVehicle.jsp";

        try {
            if (txtVehicleName.trim().length() < 5 || txtVehicleName.trim().length() > 35) {
                foundErr = true;
                errors.setVehicleNameLengthErr("Vehicle name is required from 5 to 35 chars");
            }
            if (txtVehicleDes.trim().length() < 10 || txtVehicleDes.trim().length() > 100) {
                foundErr = true;
                errors.setVehicleDesLengthErr("Vehicle description is required from 10 to 100 chars");
            }
            if (txtVehiclePlateNum.trim().length() != 10 || !txtVehiclePlateNum.trim().matches("^[0-9][0-9][a-zA-Z]-[0-9][0-9][0-9]\\.[0-9][0-9]$")) {
                foundErr = true;
                errors.setVehiclePlateLengthErr("Vehicle plate num is required 10 characters, must be in format [XXC-XXX.XX]");
            }
            if (foundErr) {
                request.setAttribute("ADD_ERROR", errors);
            } else {
                boolean result = VehicleDAO.insertVehicle(userID, txtVehicleName, txtVehicleDes, txtVehiclePlateNum, status);
                if (result) {
                    request.setAttribute("ADD_SUCCESS", "Vehicle added!");
                    url = "userVehicleList.jsp";
                }
            }

        } catch (SQLException ex) {
            String msg = ex.getMessage();
            log("addVehicleServlet _ SQL " + msg);
            if (msg.contains("duplicate")) {
                errors.setVehiclePlateIsExisted("Plate number " + txtVehiclePlateNum + " has existed! Please try again!");
                request.setAttribute("ADD_ERROR", errors);
            }
        } catch (Exception e) {
            e.printStackTrace();
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
