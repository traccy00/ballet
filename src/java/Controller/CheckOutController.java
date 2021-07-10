/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Infor;
import Model.User;
import dal.InforDAO;
import dal.ProductInCartDAO;
import dto.ProductInCart;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class CheckOutController extends HttpServlet {

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
            //list cart product
            ProductInCartDAO productInCartDAO = new ProductInCartDAO();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            //address
            InforDAO inforDAO = new InforDAO();
            Infor defaultInfor = null;
            try {
                defaultInfor = inforDAO.getDefaultInfor(user.getId());
            } catch (Exception e) {
                message = e.getMessage();
            }
            
            List<ProductInCart> productInCarts = null;
            try {
                productInCarts = productInCartDAO.getCartProductList();
            } catch (Exception e) {
                message = e.getMessage();
            }
            //subtotal
            DecimalFormat df = new DecimalFormat("0", DecimalFormatSymbols.getInstance(Locale.ENGLISH));
            df.setMaximumFractionDigits(340);
            double subtotal = 0;
            for (ProductInCart item : productInCarts) {
                double oneItem = item.getQuantity() * item.getUnitPrice();
                subtotal += oneItem;
            }
            ///5 is shipping fee
            double total = subtotal - 5;
            String subtotalString = df.format(subtotal);
            String totalString = df.format(total);

            request.setAttribute("defaultInfor", defaultInfor);
            request.setAttribute("subtotal", subtotalString);
            request.setAttribute("total", totalString);
            request.setAttribute("cart", productInCarts);
            request.setAttribute("message", message);
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
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
