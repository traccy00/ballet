/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dal.CartProductDAO;
import dal.ProductInCartDAO;
import dto.ProductInCart;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class CartController extends HttpServlet {

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
            CartProductDAO cartProductDAO = new CartProductDAO();
            //get value from Detail Page
            String quantityString = request.getParameter("quantity");
            String productIDString = request.getParameter("id");
            int quantity = 0;
            int productID = -1;
            if (quantityString != null) {
                try {
                    quantity = Integer.parseInt(quantityString);
                } catch (Exception e) {
                    message = e.getMessage();
                }
            }
            if (productIDString != null) {
                try {
                    productID = Integer.parseInt(productIDString);
                } catch (Exception e) {
                    message = e.getMessage();
                }
            }
            //add product with quantity to cart
            int n = 0;
            try {
                n = cartProductDAO.addProductToCart(productID, quantity);
            } catch (Exception e) {
                message = e.getMessage();
            }

            
            //remove product
            int status = 0;
            String cartIDString = request.getParameter("remove");
            int cartID = 0;
            try {
                cartID = Integer.parseInt(cartIDString);
            } catch (Exception e) {
                message = e.getMessage();
            }
            try {
                status = cartProductDAO.deleteFromCart(cartID);
            } catch (Exception e) {
                message = e.getMessage();
            }
            
            request.setAttribute("message", message);
//            request.getRequestDispatcher("cart.jsp").forward(request, response);
            response.sendRedirect("SecondServlet?add=success");
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
