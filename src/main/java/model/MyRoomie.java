package model;

public class MyRoomie {
    private int m_id;  //myroomie table의 고유id
    private int s_id;
    private int roomie_id;  //myroomie로 추가한 학생의 id

    public MyRoomie() {}

    public MyRoomie(int m_id, int s_id, int roomie_id) {
        this.m_id = m_id;
        this.s_id = s_id;
        this.roomie_id = roomie_id;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
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
