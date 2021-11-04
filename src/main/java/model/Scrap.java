package model;

public class Scrap {
    private int sc_id;

    public Scrap() {}

    public Scrap(int sc_id) {
        this.sc_id = sc_id;
    }

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    public boolean isScrapped(Student s) {
        return true;
    }
}
