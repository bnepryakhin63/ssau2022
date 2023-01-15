package com.example.servlets;

import java.io.*;
import java.util.List;

import com.example.domain.Order;
import com.example.repository.OrderRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import jakarta.ejb.EJB;

@WebServlet(name = "addOrderServlet", value = "/add-order-servlet")
public class AddOrderServlet extends HttpServlet {

    @EJB
    private OrderRepository orderRepository;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("namePage", "Добавление заказов");
        request.getRequestDispatcher("/addorder.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("UTF-8");

        String zakaz = request.getParameter("zakaz");
        int count = Integer.parseInt(request.getParameter("count"));
        int price = Integer.parseInt(request.getParameter("price"));
        int id_user = Integer.parseInt(request.getParameter("id_user"));


        Order order = new Order(zakaz, count, price, id_user);
        orderRepository.addOrder(order);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}

