package model;

public class Point {
    private int s_id;
    private String point_binary;
    private String point_dec;

    public Point() {}

    public Point(int s_id, String point_binary, String point_dec) {
        this.s_id = s_id;
        this.point_binary = point_binary;
        this.point_dec = point_dec;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }
    public String getPoint_binary() {
        return point_binary;
    }

    public void setPoint_binary(String point_binary) {
        this.point_binary = point_binary;
    }

    public String getPoint_dec() {
        return point_dec;
    }

    public void setPoint_dec(String point_dec) {
        this.point_dec = point_dec;
    }
}
