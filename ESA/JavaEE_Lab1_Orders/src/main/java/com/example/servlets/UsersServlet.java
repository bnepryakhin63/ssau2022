package com.example.servlets;

import java.io.*;
import java.util.List;
import com.example.domain.User;
import com.example.repository.UserRepository;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.ejb.EJB;

@WebServlet(name = "userServlet", value = "/user-servlet")
public class UsersServlet extends HttpServlet {

    @EJB
    private UserRepository userRepository;
    private String userList;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<User> users =  userRepository.getUsers();
        userList = "<ul>";
        for (User user : users) {
            userList += "<li><a href=\"delete-user-servlet?id=" + user.getId() + "\">" +
                    user.getName() +  " " + user.getLogin() + "</li>";
        }
        userList += "</ul>";
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body><h4>List of all buyers and their logins</h4><span>Click on the name to delete</span>" + userList + "</body></html>");
    }
}