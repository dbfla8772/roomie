package model;

public class Point {
    private long point_binary;
    private int point_dec;

    public Point() {}

    public Point(long point_binary, int point_dec) {
        this.point_binary = point_binary;
        this.point_dec = point_dec;
    }

    public long getPoint_binary() {
        return point_binary;
    }

    public void setPoint_binary(long point_binary) {
        this.point_binary = point_binary;
    }

    public int getPoint_dec() {
        return point_dec;
    }

    public void setPoint_dec(int point_dec) {
        this.point_dec = point_dec;
    }
}
