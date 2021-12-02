package model;

public class MyRoomie {
    private int r_id;  //myroomie table의 고유id
    private int s_id; //로그인 한 사용자
    private int roomie_id;  //myroomie로 추가한 학생의 id
    private int roomie_check;

    public MyRoomie() {}
    public MyRoomie(int r_id, int s_id, int roomie_id, int roomie_check) {
        this.r_id = r_id;
        this.s_id = s_id;
        this.roomie_id = roomie_id;
        this.roomie_check = roomie_check;
    }

    public int getR_id() {
        return r_id;
    }

    public void setR_id(int r_id) {
        this.r_id = r_id;
    }

    public int getRoomie_check() {
        return roomie_check;
    }

    public void setRoomie_check(int roomie_check) {
        this.roomie_check = roomie_check;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public int getRoomie_id() {
        return roomie_id;
    }

    public void setRoomie_id(int roomie_id) {
        this.roomie_id = roomie_id;
    }
}
