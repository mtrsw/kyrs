package ru.praktikum.lab7.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.lab7.dao.TestResultDAO;

import java.io.IOException;

@WebServlet("/delete")
public class DeleteResultServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        dao.deleteTestResult(id);

        resp.sendRedirect("list");
    }
}