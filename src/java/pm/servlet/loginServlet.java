/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pm.dao.UserDAO;
import pm.dto.UserA;

/**
 *
 * @author KIM DUONG
 */
public class loginServlet extends HttpServlet {

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

        String username = request.getParameter("txtuser");
        String password = request.getParameter("txtpassword");
        UserA user = null;
        user = UserDAO.getAccount(username, password);

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            if (user != null) {
                if (user.getRole() == 0) {
                    HttpSession session = request.getSession(true);
                    if (session != null) {
                        session.setAttribute("name", user.getFullname());
                        session.setAttribute("username", username);
                        session.setAttribute("role", user.getRole());
                        response.sendRedirect("adminDashboard.jsp");
                    }
                } else if (user.getRole() == 2) {
                    HttpSession session = request.getSession(true);
                    if (session != null) {
                        session.setAttribute("name", user.getFullname());
                        session.setAttribute("username", username);
                        session.setAttribute("role", user.getRole());
                        response.sendRedirect("staffDashboard.jsp");
                    }
                } else {
                    HttpSession session = request.getSession(true);
                    if (session != null) {
                        session.setAttribute("name", user.getFullname());
                        session.setAttribute("userID", user.getuID());
                        session.setAttribute("phone", user.getPhone());
                        session.setAttribute("username", username);
                        session.setAttribute("role", user.getRole());
                        session.setAttribute("fullname", user.getFullname());
                        session.setAttribute("address", user.getAddress());
                        session.setAttribute("phone", user.getPhone());
                        session.setAttribute("email", user.getEmail());
                        response.sendRedirect("userDashboard1.jsp");
                    }
                }
            } else {
                request.setAttribute("ERROR1", "Username or Password is invalid, please try again!");
                request.getRequestDispatcher("signIn.jsp").forward(request, response);
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
