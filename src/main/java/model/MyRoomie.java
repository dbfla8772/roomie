package model;

public class MyRoomie {
    private String studentId;
    private String roomieId;

    public MyRoomie() {}
    public MyRoomie(String studentId, String roomieId) {
        this.studentId = studentId;
        this.roomieId = roomieId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getRoomieId() {
        return roomieId;
    }

    public void setRoomieId(String roomieId) {
        this.roomieId = roomieId;
    }

    public boolean isPicked(String studentId) {
        return this.studentId.equals(roomieId);
    }
}
