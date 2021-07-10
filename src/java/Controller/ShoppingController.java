/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Category;
import Model.Product;
import Model.SubCategory;
import constant.Constant;
import dal.CartProductDAO;
import dal.CategoryDAO;
import dal.ProductDAO;
import dal.SubCategoryDAO;
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
public class ShoppingController extends HttpServlet {

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
            //category show
            CategoryDAO cd = new CategoryDAO();
            ProductDAO pd = new ProductDAO();
            SubCategoryDAO sd = new SubCategoryDAO();
            CartProductDAO cpd = new CartProductDAO();

            List<Category> categoryList = null;
            try {
                categoryList = cd.getCategoryList();
            } catch (Exception e) {
                message = e.getLocalizedMessage();
            }
            //subcategory show
            List<SubCategory> subCategoryList = null;
            try {
                subCategoryList = sd.getListSubCategory();
            } catch (Exception e) {
                message = e.getLocalizedMessage();
            }

            //paging
            //total product
            int totalProduct = 0;
            try {
                totalProduct = pd.getTotalProduct();
            } catch (Exception e) {
                message = e.getLocalizedMessage();
            }
            //page size
            int pageSize = 10;
            //total page
            int totalPage = 0;
            if (totalProduct % pageSize == 0) {
                totalPage = totalProduct / pageSize;
            } else if (totalProduct % pageSize != 0) {
                totalPage = totalProduct / pageSize + 1;
            }
            //page no
            int pageNo = 0;
            if (request.getParameter("page") == null) {
                pageNo = 1;
            } else {//param page is not null
                try {
                    String pageString = request.getParameter("page");
                    pageNo = Integer.parseInt(pageString);
                    //page no is not exist
                    if (pageNo < 1 || pageNo > totalPage) {
                        message = "Not found this page";
                        totalPage = 0;
                    }
                } catch (NumberFormatException e) {
                    message = constant.ERROR_OCCUR;
                    totalPage = 0;
                }
            }
            //all product paging
            List<Product> productList = null;
            try {
                productList = pd.getProductListPaging(1, pageSize);
            } catch (Exception e) {
                message = e.getLocalizedMessage();
            }
            
            request.setAttribute("totalPage", totalPage);
            request.setAttribute("page", pageNo);
            request.setAttribute("catList", categoryList);
            request.setAttribute("subList", subCategoryList);
            request.setAttribute("productList", productList);
            request.setAttribute("message", message);
            request.getRequestDispatcher("shopping.jsp").forward(request, response);
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
