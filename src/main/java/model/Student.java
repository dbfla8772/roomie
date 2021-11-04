package model;

import jdk.nashorn.internal.objects.NativeString;

public class Student {

    private String studentId;
    private String password;
    private String name;
    private College college;
    private int gender;

    public Student() {
    }

    public Student(String studentId, String password, String name, College college, int gender) {
        this.studentId = studentId;
        this.password = password;
        this.name = name;
        this.college = college;
        this.gender = gender;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public College getCollege() {
        return college;
    }

    public void setCollege(College college) {
        this.college = college;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }


    public boolean matchPassword(String password) {
        if (password == null) {
            return false;
        }
        return this.password.equals(password);
    }

    public boolean isSameStudent(String studentId) {
        return this.studentId.equals(studentId);
    }
}
