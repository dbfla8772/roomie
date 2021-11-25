package model;

import java.util.Date;

public class Mail {
    private int ch_id;
    private int sender;
    private int receiver;
    private String message;
    private String datetime;
    private int mailCheck;

    public Mail(int ch_id, int sender, int receiver, String message, String datetime, int mailCheck) {
        this.ch_id = ch_id;
        this.sender = sender;
        this.receiver = receiver;
        this.message = message;
        this.datetime = datetime;
        this.mailCheck = mailCheck;
    }

    public int getCh_id() {
        return ch_id;
    }

    public void setCh_id(int ch_id) {
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

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public int getMailCheck() {
        return mailCheck;
    }

    public void setMailCheck(int mailCheck) {
        this.mailCheck = mailCheck;
    }
}
