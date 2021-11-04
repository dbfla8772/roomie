package model;

import java.util.Date;

public class Chat {
    private long ch_id;
    private String sender;
    private String receiver;
    private String message;
    private Date datetime;

    public Chat() {}
    public Chat(long ch_id, String sender, String receiver, String message, Date datetime) {
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

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
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
