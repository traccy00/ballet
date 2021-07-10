/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.User;
import constant.Constant;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

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
        Constant constant = new Constant();
        try {

            String message = "";
            UserDAO userDAO = new UserDAO();
            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phonenumber");
            //check input of user exist by username, password, email
            if (userName == null || password == null || email == null || phoneNumber == null) {
                response.sendRedirect("CheckRegister?valid=false&message=" + message);
                return;
            }
            User user = null;
            //user name
            try {
                user = userDAO.getUserByUsername(userName);
            } catch (Exception e) {
                message = e.getMessage();
            }

            //phone number
            try {
                user = userDAO.getUserByUsername(userName);
            } catch (Exception e) {
                message = e.getMessage();
            }

            //email
            try {
                user = userDAO.getUserByUsername(userName);
            } catch (Exception e) {
                message = e.getMessage();
            }
            if (user != null) {
                message = "Information in use";
                response.sendRedirect("CheckRegister?valid=false&message=" + message);
                return;
            } else {
                //add user if infor valid
                int n = 0;
                User insertedUser = new User();
                insertedUser.setUserName(userName);
                insertedUser.setPassword(password);
                insertedUser.setPhoneNumber(phoneNumber);
                insertedUser.setEmail(email);
                try {
                    n = userDAO.addCustomer(insertedUser);
                } catch (Exception e) {
                    message = e.getMessage();
                }
                response.sendRedirect("CheckRegister?valid=true&message=" + message);
            }
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);

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
