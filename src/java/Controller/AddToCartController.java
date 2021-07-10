/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Product;
import Model.ProductImage;
import dal.CartProductDAO;
import dal.ProductDAO;
import dal.ProductImageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class AddToCartController extends HttpServlet {

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
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int productID = Integer.parseInt(request.getParameter("id"));

            //find product that have the id
            Product product = null;
            ProductDAO pd = new ProductDAO();
            try {
                product = pd.getProductById(productID);
            } catch (Exception e) {
                message = e.getMessage();
            }
            
            //get image of product
            ProductImageDAO pi = new ProductImageDAO();
            List<ProductImage> listProductImage = null;
            try {
                listProductImage = pi.getProductImageByProductID(productID);
            } catch (Exception e) {
                message = e.getMessage();
            }

            int n = 0;
            try {
                n = cartProductDAO.addProductToCart(productID, quantity);
            } catch (Exception e) {
                message = e.getMessage();
            }
            request.setAttribute("product", product);
            request.setAttribute("imageList", listProductImage);
            request.setAttribute("message", message);
            request.getRequestDispatcher("productdetail.jsp").forward(request, response);
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
