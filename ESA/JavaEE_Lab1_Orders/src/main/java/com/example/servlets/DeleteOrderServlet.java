package com.example.servlets;

import com.example.repository.OrderRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "deleteOrderServlet", value = "/delete-order-servlet")
public class DeleteOrderServlet extends HttpServlet {

    @EJB
    private OrderRepository orderRepository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        orderRepository.deleteOrder(id);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}