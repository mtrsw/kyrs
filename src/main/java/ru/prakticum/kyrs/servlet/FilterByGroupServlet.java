package ru.praktikum.kyrs.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import ru.praktikum.kyrs.dao.TestResultDAO;

import java.io.IOException;

@WebServlet("/filter-group")
public class FilterByGroupServlet extends HttpServlet {

    private final TestResultDAO dao = new TestResultDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("groups", dao.getAllGroups());

        String groupIdParam = req.getParameter("groupId");
        if (groupIdParam != null && !groupIdParam.isEmpty()) {
            int groupId = Integer.parseInt(groupIdParam);
            req.setAttribute("results", dao.getByGroup(groupId));
            req.setAttribute("selectedGroup", groupId);
        }
        req.getRequestDispatcher("/filter-group.jsp").forward(req, resp);
    }
}