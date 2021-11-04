package model;

public class Scrap {
    private int sc_id;
    private int s_id;

    public Scrap() {}

    public Scrap(int sc_id, int s_id) {
        this.sc_id = sc_id;
        this.s_id = s_id;
    }

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
    }

    public boolean isScrapped(int s_id) {
        if (s_id == sc_id)
            return true;
        return false;
    }
}
