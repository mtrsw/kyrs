package ru.praktikum.lab7.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.lab7.dao.TestResultDAO;
import ru.praktikum.lab7.model.TestResult;

import java.io.IOException;

@WebServlet("/add")
public class AddResultServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        TestResult r = new TestResult();
        r.setStudentName(req.getParameter("studentName"));
        r.setTestName(req.getParameter("subject"));        // было "subject" в форме
        r.setScore(Integer.parseInt(req.getParameter("score")));

        dao.addTestResult(r);

        resp.sendRedirect("list");   // или "/list" если нужно
    }
}