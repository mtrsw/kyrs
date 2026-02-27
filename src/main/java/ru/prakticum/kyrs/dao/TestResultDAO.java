package ru.praktikum.kyrs.dao;

import ru.praktikum.kyrs.model.Group;
import ru.praktikum.kyrs.model.Student;
import ru.praktikum.kyrs.model.Subject;
import ru.praktikum.kyrs.model.TestResult;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TestResultDAO {

    private final DataSource dataSource;

    public TestResultDAO() {
        try {
            Context ctx = new InitialContext();
            this.dataSource = (DataSource) ctx.lookup("java:comp/env/jdbc/kyrsDB");
        } catch (NamingException e) {
            throw new RuntimeException("Не удалось получить DataSource из JNDI", e);
        }
    }

    public TestResultDAO(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    // ===================== TestResult =====================

    // БП-1: Получить все результаты
    public List<TestResult> getAllTestResults() {
        List<TestResult> results = new ArrayList<>();
        String sql = "SELECT tr.id, s.full_name AS student_name, g.group_number, " +
                "sub.subject_name, tr.score, tr.created_at " +
                "FROM test_results tr " +
                "JOIN students s ON tr.student_id = s.id " +
                "JOIN `groups` g ON s.group_id = g.id " +
                "JOIN subjects sub ON tr.subject_id = sub.id " +
                "ORDER BY tr.created_at DESC";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                results.add(mapResult(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при получении всех результатов", e);
        }
        return results;
    }

    // БП-2: Добавить результат
    public void addTestResult(int studentId, int subjectId, int score) {
        String sql = "INSERT INTO test_results (student_id, subject_id, score) VALUES (?, ?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, studentId);
            ps.setInt(2, subjectId);
            ps.setInt(3, score);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при добавлении результата", e);
        }
    }

    // БП-3: Удалить результат
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

    // БП-4: Поиск по имени студента
    public List<TestResult> searchByStudentName(String namePart) {
        List<TestResult> results = new ArrayList<>();
        if (namePart == null || namePart.trim().length() < 3) return results;
        String sql = "SELECT tr.id, s.full_name AS student_name, g.group_number, " +
                "sub.subject_name, tr.score, tr.created_at " +
                "FROM test_results tr " +
                "JOIN students s ON tr.student_id = s.id " +
                "JOIN `groups` g ON s.group_id = g.id " +
                "JOIN subjects sub ON tr.subject_id = sub.id " +
                "WHERE s.full_name LIKE ? ORDER BY tr.created_at DESC";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, "%" + namePart.trim() + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) results.add(mapResult(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при поиске по студенту", e);
        }
        return results;
    }

    // БП-5: Фильтрация по предмету
    public List<TestResult> getBySubject(int subjectId) {
        List<TestResult> results = new ArrayList<>();
        String sql = "SELECT tr.id, s.full_name AS student_name, g.group_number, " +
                "sub.subject_name, tr.score, tr.created_at " +
                "FROM test_results tr " +
                "JOIN students s ON tr.student_id = s.id " +
                "JOIN `groups` g ON s.group_id = g.id " +
                "JOIN subjects sub ON tr.subject_id = sub.id " +
                "WHERE tr.subject_id = ? ORDER BY tr.created_at DESC";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, subjectId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) results.add(mapResult(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при фильтрации по предмету", e);
        }
        return results;
    }

    // БП-6: Фильтрация по группе
    public List<TestResult> getByGroup(int groupId) {
        List<TestResult> results = new ArrayList<>();
        String sql = "SELECT tr.id, s.full_name AS student_name, g.group_number, " +
                "sub.subject_name, tr.score, tr.created_at " +
                "FROM test_results tr " +
                "JOIN students s ON tr.student_id = s.id " +
                "JOIN `groups` g ON s.group_id = g.id " +
                "JOIN subjects sub ON tr.subject_id = sub.id " +
                "WHERE s.group_id = ? ORDER BY tr.created_at DESC";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, groupId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) results.add(mapResult(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при фильтрации по группе", e);
        }
        return results;
    }

    // БП-7: Средний балл по группам
    public List<double[]> getAvgScoreByGroup() {
        List<double[]> results = new ArrayList<>();
        String sql = "SELECT g.id, g.group_number, AVG(tr.score) as avg_score " +
                "FROM test_results tr " +
                "JOIN students s ON tr.student_id = s.id " +
                "JOIN `groups` g ON s.group_id = g.id " +
                "GROUP BY g.id, g.group_number ORDER BY g.group_number";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                results.add(new double[]{rs.getInt("id"), rs.getDouble("avg_score")});
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при подсчёте среднего балла", e);
        }
        return results;
    }

    // БП-8: Добавить студента
    public void addStudent(String fullName, int groupId) {
        String sql = "INSERT INTO students (full_name, group_id) VALUES (?, ?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, fullName);
            ps.setInt(2, groupId);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при добавлении студента", e);
        }
    }

    // БП-9: Удалить студента
    public void deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при удалении студента", e);
        }
    }

    // Добавить группу
    public void addGroup(String groupNumber) {
        String sql = "INSERT INTO `groups` (group_number) VALUES (?)";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, groupNumber);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при добавлении группы", e);
        }
    }

    // Удалить группу
    public void deleteGroup(int id) {
        String sql = "DELETE FROM `groups` WHERE id = ?";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при удалении группы", e);
        }
    }

    // ===================== Справочники =====================

    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT s.id, s.full_name, s.group_id, g.group_number " +
                "FROM students s JOIN `groups` g ON s.group_id = g.id ORDER BY s.full_name";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Student st = new Student();
                st.setId(rs.getInt("id"));
                st.setFullName(rs.getString("full_name"));
                st.setGroupId(rs.getInt("group_id"));
                st.setGroupNumber(rs.getString("group_number"));
                list.add(st);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при получении студентов", e);
        }
        return list;
    }

    public List<Subject> getAllSubjects() {
        List<Subject> list = new ArrayList<>();
        String sql = "SELECT id, subject_name FROM subjects ORDER BY subject_name";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setId(rs.getInt("id"));
                sub.setSubjectName(rs.getString("subject_name"));
                list.add(sub);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при получении предметов", e);
        }
        return list;
    }

    public List<Group> getAllGroups() {
        List<Group> list = new ArrayList<>();
        String sql = "SELECT id, group_number FROM `groups` ORDER BY group_number";
        try (Connection conn = dataSource.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setGroupNumber(rs.getString("group_number"));
                list.add(g);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Ошибка при получении групп", e);
        }
        return list;
    }

    // ===================== Вспомогательный метод =====================

    private TestResult mapResult(ResultSet rs) throws SQLException {
        TestResult tr = new TestResult();
        tr.setId(rs.getInt("id"));
        tr.setStudentName(rs.getString("student_name"));
        tr.setGroupNumber(rs.getString("group_number"));
        tr.setSubjectName(rs.getString("subject_name"));
        tr.setScore(rs.getInt("score"));
        tr.setCreatedAt(rs.getTimestamp("created_at"));
        return tr;
    }
}