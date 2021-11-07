package model;

public class Point {
    private int pt_id;
    private long point_binary;
    private int point_dec;
    private int s_id;

    public Point() {}

    public Point(int pt_id, long point_binary, int point_dec, int s_id) {
        this.pt_id = pt_id;
        this.point_binary = point_binary;
        this.point_dec = point_dec;
        this.s_id = s_id;
    }

    public int getPt_id() {
        return pt_id;
    }

    public void setPt_id(int pt_id) {
        this.pt_id = pt_id;
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

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }
}
