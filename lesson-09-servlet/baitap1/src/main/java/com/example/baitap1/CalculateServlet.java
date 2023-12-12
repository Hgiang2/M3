package com.example.baitap1;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "CalculateServlet", urlPatterns = "/calculate")
public class CalculateServlet extends HttpServlet {
    @Override
    public void init() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String description = request.getParameter("description");
        double price = Integer.parseInt(request.getParameter("price"));
        double discountPercent = Integer.parseInt(request.getParameter("discount"));
        PrintWriter printWriter = response.getWriter();
        try {
            double discountPrice = price * discountPercent * 0.01;
            printWriter.println("<html>");
            printWriter.println("Discount price of " + description + " is: " + discountPrice);
            printWriter.println("</html>");
        } catch (Exception e) {
            printWriter.println("<html>");
            printWriter.println("Invalid");
            printWriter.println("</html>");
        }
    }

    public void destroy() {
    }


}