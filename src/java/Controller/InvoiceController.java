/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ExportInvoice;
import Model.Invoice;
import Model.OrderItem;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class InvoiceController extends HttpServlet {

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
            HttpSession s = request.getSession();
            
            String username = (String) s.getAttribute("LoginUser");
            String invoiceid = (String) s.getAttribute("invoiceid");
            Date selldate = (Date) s.getAttribute("date");
            ArrayList<OrderItem> listForPrint = new ArrayList<>();
            OrderItem o = new OrderItem();
            ArrayList<OrderItem> listItem = o.getOrderItemList();
            for (OrderItem item : listItem) {
                if (item.getInvoiceid().equals(invoiceid)) {
                    listForPrint.add(item);
                }
            }
            ExportInvoice obj = new ExportInvoice(username, invoiceid, selldate, listItem);
            //create the file output stream
            FileOutputStream output = null;
            try {
                File file = new File("d:\\MyText.txt, create new file for you...");
                output = new FileOutputStream("d:\\MyText.txt");
            } catch (FileNotFoundException e) {
                System.out.println("File doesnt exist!");
            }

            //define an object to write to the stream, this object write to the file
            OutputStreamWriter writer = new OutputStreamWriter(output);

            try {
                writer.write("Xiao Mei Store\n");
//                        writer.write(obj + "\n");
                writer.write(username + "\n");
                writer.write(invoiceid + "\n");
                writer.write(selldate + "\n");
                for (OrderItem orderItem : listForPrint) {
                    writer.write(orderItem.getProductname() + " | " + orderItem.getQuantity() + " | " + orderItem.getPrice() + "\n");
                }
            } catch (Exception e) {
                System.out.println("Couldnt write to the file!" + e.getMessage());
            }
            //close file
            try {
                writer.close();
                message = "Export successful";
            } catch (Exception e) {
                System.out.println("Couldnt close the file!" + e.getMessage());
            }

            request.setAttribute("message", message);
            request.getRequestDispatcher("invoice.jsp").forward(request, response);
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
