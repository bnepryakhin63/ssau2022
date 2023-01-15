package com.example.servlets;

import com.example.repository.UserRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "deleteUserServlet", value = "/delete-user-servlet")
public class DeleteUserServlet extends HttpServlet {

    @EJB
    private UserRepository userRepository;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userRepository.deleteUser(id);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}