package com.example.servlets;

import java.io.*;
import java.util.List;
import com.example.domain.Order;
import com.example.repository.OrderRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;

@WebServlet(name = "orderServlet", value = "/order-servlet")
public class OrdersServlet extends HttpServlet {

    @EJB
    private OrderRepository OrderRepository;
    private String orderList;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Order> orders =  OrderRepository.getOrders();
        orderList = "<ul>";
        for (Order order : orders) {
            orderList += "<li><a href=\"delete-order-servlet?id=" + order.getId() + "\">" +
                    order.getZakaz() + " " + order.getId_user() + "</li>";
        }
        orderList += "</ul>";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h4>List of all orders</h4><span>Click on the order to delete it</span>" + orderList + "</body></html>");
    }
}