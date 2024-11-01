package model.service;

import java.sql.SQLException;

import model.Student;
import model.dao.StudentDAO;

public class StudentManager {
    private static StudentManager studentMan = new StudentManager();
    private StudentDAO studentDao;

    private StudentManager() {
        try {
            studentDao = new StudentDAO();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static StudentManager getInstance() {
        return studentMan;
    }

    public int create(Student student) throws SQLException, ExistingStudentException {
        if (studentDao.existingStudent(student.getEmail()) == true) {
            throw new ExistingStudentException(student.getEmail() + "는 존재하는 아이디입니다.");
        }
        return studentDao.create(student);
    }

    public int remove(String email) throws SQLException, StudentNotFoundException {
        return studentDao.remove(email);
    }

    public boolean existing(String email) throws SQLException {
        return studentDao.existingStudent(email);
    }

    public Student findStudent(String email)
            throws SQLException, StudentNotFoundException {
        Student student = studentDao.findStudent(email);

        if (student == null) {
            throw new StudentNotFoundException(email + "는 존재하지 않는 아이디입니다.");
        }
        return student;
    }

    public boolean login(String email, String password)
            throws SQLException, StudentNotFoundException, PasswordMismatchException {
        Student student = findStudent(email);

        if (!student.matchPassword(password)) {
            throw new PasswordMismatchException("비밀번호가 일치하지 않습니다.");
        }
        return true;
    }

    public StudentDAO getStudentDao() {
        return this.studentDao;
    }
}