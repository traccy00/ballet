/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Infor;
import Model.User;
import constant.Constant;
import dal.InforDAO;
import dto.ChangedAddressDefault;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ShowAddressController extends HttpServlet {
    
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
        try {
            String message = "";
            InforDAO inforDAO = new InforDAO();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            List<Infor> inforList = null;
            try {
                inforList = inforDAO.getInforList(user.getId());
            } catch (Exception e) {
                message = e.getMessage();
            }
            //show address list of user
            List<ChangedAddressDefault> changedAddressList = new ArrayList<>();
            for (int i = 0; i < inforList.size(); i++) {
                String defaultString = "";
                Infor infor = inforList.get(i);
                if (infor.isIsDefault()) {
                    defaultString = "Default";
                }
                changedAddressList.add(new ChangedAddressDefault(infor.getId(), infor.getFullName(), infor.getPhoneNumber(), infor.getAddress(), defaultString));
            }
            //change default address
            String idString = request.getParameter("id");
            int id = 0;
            try {
                id = Integer.parseInt(idString);
            } catch (Exception e) {
                message = Constant.ERROR_OCCUR;
            }
            
            request.setAttribute("message", message);
            request.setAttribute("inforList", changedAddressList);
            request.getRequestDispatcher("address.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage() + "sfkdsj");
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
