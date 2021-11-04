package model;

import java.util.Date;

public class Chat {
    private long ch_id;
    private int sender;
    private int receiver;
    private String message;
    private Date datetime;

    public Chat() {}
    public Chat(long ch_id, int sender, int receiver, String message, Date datetime) {
        this.ch_id = ch_id;
        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
        this.datetime = datetime;
    }

    public long getCh_id() {
        return ch_id;
    }

    public void setCh_id(long ch_id) {
        this.ch_id = ch_id;
    }

    public int getSender() {
        return sender;
    }

    public void setSender(int sender) {
        this.sender = sender;
    }

    public int getReceiver() {
        return receiver;
    }

    public void setReceiver(int receiver) {
        this.receiver = receiver;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
}
