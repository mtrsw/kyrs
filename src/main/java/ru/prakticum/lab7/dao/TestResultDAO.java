package ru.praktikum.lab7.dao;

import ru.praktikum.lab7.model.TestResult;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestResultDAO {

    private final DataSource dataSource;

    // Конструктор для сервлетов
    public TestResultDAO() {
        try {
            Context ctx = new InitialContext();
            this.dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/kyrsDB");
        } catch (NamingException e) {
            throw new RuntimeException("Не удалось получить DataSource из JNDI. Проверь context.xml", e);
        }
    }

    // Конструктор для тестов
    public TestResultDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<TestResult> getAllTestResults() {
        List<TestResult> results = new ArrayList<>();
        String sql = "SELECT * FROM test_results ORDER BY created_at DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                TestResult tr = new TestResult();
                tr.setId(rs.getInt("id"));
                tr.setStudentName(rs.getString("student_name"));
                tr.setTestName(rs.getString("test_name"));
                tr.setScore(rs.getInt("score"));
                tr.setCreatedAt(rs.getTimestamp("created_at"));
                results.add(tr);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при получении всех результатов", e);
        }
        return results;
    }

    public List<TestResult> getTestResultsByStudent(String namePart) {
        List<TestResult> results = new ArrayList<>();

        if (namePart == null || namePart.trim().length() < 3) {
            return results; // меньше 3 символов — ничего не ищем
        }

        String word = namePart.trim();

        String sql = "SELECT * FROM test_results " +
                "WHERE student_name LIKE ? OR student_name LIKE ? OR student_name LIKE ? " +
                "ORDER BY created_at DESC";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "% " + word + " %");   // слово в середине
            ps.setString(2, word + " %");          // слово в начале
            ps.setString(3, "% " + word);          // слово в конце

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    TestResult tr = new TestResult();
                    tr.setId(rs.getInt("id"));
                    tr.setStudentName(rs.getString("student_name"));
                    tr.setTestName(rs.getString("test_name"));
                    tr.setScore(rs.getInt("score"));
                    tr.setCreatedAt(rs.getTimestamp("created_at"));
                    results.add(tr);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при поиске по имени студента", e);
        }
        return results;
    }

    public void addTestResult(TestResult result) {
        String sql = "INSERT INTO test_results (student_name, test_name, score) VALUES (?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, result.getStudentName());
            ps.setString(2, result.getTestName());
            ps.setInt(3, result.getScore());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при добавлении результата", e);
        }
    }

    public void deleteTestResult(int id) {
        String sql = "DELETE FROM test_results WHERE id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при удалении результата", e);
        }
    }
}