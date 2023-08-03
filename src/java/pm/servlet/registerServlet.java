/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pm.dao.UserDAO;
import pm.dto.RegistrationError;

/**
 *
 * @author KIM DUONG
 */
public class registerServlet extends HttpServlet {

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

        String username = request.getParameter("txtusername");
        String fullName = request.getParameter("txtfullname");
        String password = request.getParameter("txtpassword");
        String phone = request.getParameter("txtphone");
        String email = request.getParameter("txtemail");
        String address = request.getParameter("txtaddress");
        String gender = request.getParameter("txtgender");

        int gender1 = Integer.parseInt(gender);

        RegistrationError errors = new RegistrationError();
        boolean foundErr = false;
        String url = "signUp.jsp";

        try {
            /* TODO output your page here. You may use following sample code. */
            if (username.trim().length() < 6 || username.trim().length() > 45) {
                foundErr = true;
                errors.setUsernameLengthErr("Username is required from 6 to 45 chars");
            }
            if (password.trim().length() < 6 || password.trim().length() > 45) {
                foundErr = true;
                errors.setPasswordLengthErr("Password is required from 6 to 45 chars");
            }
            if (fullName.trim().length() < 6 || fullName.trim().length() > 45 || fullName.trim().matches("")) {
                foundErr = true;
                errors.setFullnameLengthErr("Full name is required from 6 to 45 chars, contain letters only");
            }

            if (address.trim().length() < 6 || address.trim().length() > 45) {
                foundErr = true;
                errors.setAddressLengthErr("Address is required from 6 to 45 chars");
            }
            if (email.trim().length() < 6 || email.trim().length() > 45 || !email.trim().matches("^(.+)@(gmail|yahoo|fpt.edu)(.com|.vn)$")) {
                foundErr = true;
                errors.setEmailLengthErr("Email is invalid, please try again");
            }

            if (phone.trim().length() != 12) {
                foundErr = true;
                errors.setPhoneLengthErr("Phone must be 12 chars length");
            }
            if (!phone.matches("[0-9]+")) {
                foundErr = true;
                errors.setPhoneContainLetter("Phone number must not contain letter");
            }
            if (foundErr) {
                request.setAttribute("REGIS_ERROR", errors);
            } else {
                int status = 1;
                int role = 1;
                boolean result = UserDAO.insertAccount(username, password, fullName, email, address, phone, role, status, gender1);
                if (result) {
                    request.setAttribute("REGIS_SUCCESS", "Sign up successfully, please check your email to cofirm account");
                    url = "signIn.jsp";
                }
            }
        } catch (SQLException ex) {
            String msg = ex.getMessage();
            log("registerServlet _ SQL " + msg);
            if (msg.contains("duplicate")) {
                errors.setUsernameIsExisted(username + " existed! Please try another username!");
                request.setAttribute("REGIS_ERROR", errors);
            }
        } catch (NamingException ex) {
            log("registerServlet _ Naming " + ex.getMessage());
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
