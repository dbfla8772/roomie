package model;

public class MyRoomie {
    private int s_id;
    private int roomie_id;

    public MyRoomie() {}
    public MyRoomie(int s_id, int roomie_id) {
        this.s_id = s_id;
        this.roomie_id = roomie_id;
    }

    public int getStudent_id() {
        return s_id;
    }

    public void setStudent_id(int s_id) {
        this.s_id = s_id;
    }

    public int getRoomie_id() { return roomie_id;}

    public void setRoomie_id(int roomie_id) {
        this.roomie_id = roomie_id;
    }

    public boolean isPicked(int s_id) {
        if (s_id == roomie_id)
            return true;
        return false;
    }
}
